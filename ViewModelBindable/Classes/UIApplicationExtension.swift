import RxSwift
import Foundation

extension UIApplication {
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIView.doAwesomeSwizzleStuff()
        UIViewController.doAwesomeSwizzleStuff()
        return super.next
    }
}
