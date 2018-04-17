
import RxSwift
import Foundation


public protocol _ObjcBindable {
    func registerBinding()
}

public protocol ViewModelBindable: class, _ObjcBindable {

    associatedtype ViewModel

    var viewModel: ViewModel? { get set }

    var disposeBag: DisposeBag { get set }

    func bindViewModel(viewModel: ViewModel)
}

// MARK: - Default Implementations
extension ViewModelBindable {
    public var viewModel: ViewModel? {
        get { return objc_getAssociatedObject(self, &ViewModelAssociatedKey) as? ViewModel }
        set(newViewModel) {
            if let viewModel = newViewModel {
                objc_setAssociatedObject(self, &ViewModelAssociatedKey, viewModel, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.isViewModelBinded = false
                self.disposeBag = DisposeBag()
                self.registerBinding()
                // defer binding until view loaded
            }
        }
    }

    public func registerBinding() {
        guard let viewModel = self.viewModel else { return }
        guard !self.isViewModelBinded else { return }
        guard !self.shouldDeferBinding else { return }
        self.bindViewModel(viewModel: viewModel)
        self.isViewModelBinded = true
    }

    private var isViewModelBinded: Bool {
        get { return (objc_getAssociatedObject(self, &BindAssociatedKey) as? Bool) ?? false }
        set { objc_setAssociatedObject(self, &BindAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var shouldDeferBinding: Bool {
        if let isViewLoaded = (self as? UIViewController)?.isViewLoaded {
            return isViewLoaded == false
        }
        return false
    }
}

// MARK: - Associated Object Keys
private var ViewModelAssociatedKey = "ViewModelAssociatedKey"
private var BindAssociatedKey = "BindAssociatedKey"

// MARK: - UIViewController extension
extension UIViewController {
    @objc func _viewModel_performBinding() {
        (self as? _ObjcBindable)?.registerBinding()
    }
}

// MARK: - UIView extension
extension UIView {
    @objc func _viewModel_performBinding() {
        (self as? _ObjcBindable)?.registerBinding()
    }
}
