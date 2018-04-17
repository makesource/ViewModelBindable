
import RxSwift
import Foundation

protocol ViewModelBindable: class {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
}
