import RxSwift
import Foundation

extension UIApplication {
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIView.doBadSwizzleStuff()
        UIViewController.doBadSwizzleStuff()
        return super.next
    }
}
