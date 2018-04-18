
import RxSwift
import Foundation


public protocol _ObjcBindable {
    func registerBinding()
    func bindStyles()
}

public protocol ViewModelBindable: class, _ObjcBindable {

    associatedtype ViewModel

    var viewModel: ViewModel? { get set }

    var disposeBag: DisposeBag { get set }

    func bindViewModel(viewModel: ViewModel)

    func bindStyles()
}

// MARK: - Default Implementations
extension ViewModelBindable {
    public var viewModel: ViewModel? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.viewModel) as? ViewModel }
        set(newViewModel) {
            if let viewModel = newViewModel {
                objc_setAssociatedObject(self, &AssociatedKeys.viewModel, viewModel, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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

    public func bindStyles() {
    }

    private var isViewModelBinded: Bool {
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.isViewModelBinded) as? Bool) ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.isViewModelBinded, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var shouldDeferBinding: Bool {
        if let isViewLoaded = (self as? UIViewController)?.isViewLoaded {
            return isViewLoaded == false
        }
        return false
    }
}

// MARK: - UIViewController extension
extension UIViewController {
    @objc internal func performBinding() {
        (self as? _ObjcBindable)?.registerBinding()
    }

    @objc internal func bindStyles() {
        (self as? _ObjcBindable)?.bindStyles()
    }
}

// MARK: - UIView extension
extension UIView {
    @objc internal func performBinding() {
        (self as? _ObjcBindable)?.registerBinding()
    }

    @objc internal func bindStyles() {
        (self as? _ObjcBindable)?.bindStyles()
    }
}
