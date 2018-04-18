import Foundation

private func swizzle(_ vc: UIViewController.Type) {
    [
        (#selector(vc.viewDidLoad), #selector(vc.swizzle_viewDidLoad)),
        (#selector(vc.viewWillAppear(_:)), #selector(vc.swizzle_viewWillAppear(_:)))
        ].forEach { original, swizzled in

            let originalMethod = class_getInstanceMethod(vc, original)
            let swizzledMethod = class_getInstanceMethod(vc, swizzled)

            let didAddViewDidLoadMethod = class_addMethod(vc,
                                                          original,
                                                          method_getImplementation(swizzledMethod!),
                                                          method_getTypeEncoding(swizzledMethod!))

            if didAddViewDidLoadMethod {
                class_replaceMethod(vc,
                                    swizzled,
                                    method_getImplementation(originalMethod!),
                                    method_getTypeEncoding(originalMethod!))
            } else {
                method_exchangeImplementations(originalMethod!, swizzledMethod!)
            }
    }
}

private var hasSwizzled = false

extension UIViewController {
    final public class func doBadSwizzleStuff() {
        guard !hasSwizzled else { return }

        hasSwizzled = true
        swizzle(self)
    }

    @objc internal func swizzle_viewDidLoad() {
        self.swizzle_viewDidLoad()
        self.performBinding()
    }

    @objc internal func swizzle_viewWillAppear(_ animated: Bool) {
        self.swizzle_viewWillAppear(animated)
        if !self.hasViewAppeared {
            self.bindStyles()
            self.hasViewAppeared = true
        }
    }

    // Helper to figure out if the `viewWillAppear` has been called yet
    private var hasViewAppeared: Bool {
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.hasViewAppeared) as? Bool) ?? false }
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.hasViewAppeared,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
