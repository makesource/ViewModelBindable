//
//  ViewModelBindable.swift
//  ViewModelBindable
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 makesource
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

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
    @objc internal func bindViewModel() {
        (self as? _ObjcBindable)?.registerBinding()
    }

    @objc internal func bindStyles() {
        (self as? _ObjcBindable)?.bindStyles()
    }
}

// MARK: - UIView extension
extension UIView {
    @objc internal func bindViewModel() {
        (self as? _ObjcBindable)?.registerBinding()
    }

    @objc internal func bindStyles() {
        (self as? _ObjcBindable)?.bindStyles()
    }
}
