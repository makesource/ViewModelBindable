# ViewModelBindable
⚡️Super easy way to bind ViewModel

1. typealias your ViewModel which you want to inject
```swift
typealias ViewModel = DetailViewModel
```

2. Inject viewModel
```swift
let viewController = DetailViewController()
let viewModel = DetailViewModel()
viewController.viewModel = viewModel
```

3. Just enjoy `bindViewModel(_:)`, `bindStyles()` <br/> This will be called automatically!

## Usages
Just confrom your UIView or UIViewController to ViewModelBindable!

ViewModelBindable offers two binding method bindViewModel(_:), bindStyles()


- **UIViewController**
```swift
class DetailViewController: UIViewController {
  var disposeBag = DisposeBag()
  ...
}

extension DetailViewController: ViewModelBindable {
  typealias ViewModel = DetailViewModel
  
  // perform binding here
  func bindViewModel(viewModel: ViewModel) {
  }
  
  // This method is optional
  // Implement if you need
  func bindStyles() {
  }
}
```
- **UIView**
```swift
class DetailView: UIView {
  var disposeBag = DisposeBag()
  ...
}

extension DetailView: ViewModelBindable {
  typealias ViewModel = DetailViewModel
  
  // perform binding here
  func bindViewModel(viewModel: ViewModel) {
  }
  
  // This method is optional
  // Implement if you need
  func bindStyles() {
  }
}
```

## Features

ViewModelBindable serves two binding methods which was used in MVVM architecture.

### `bindViewModel()`

#### Usage

`bindViewModel()` is used for binding between View and ViewModel.

#### When is it called?

Right **after** UIViewController's `viewDidLoad()`

Right **after** UIView's viewModel injection

It's recommended to bind UIView's viewModel in ViewController's bindViewModel(_:) method 

```swift
func bindViewModel(viewModle: ViewModel) {
  headerView.viewModel = viewModel
  footerView.viewModel = viewModel
}
```
 
You can initialize some stuffs in viewDidLoad / awakeFromNib to prepare binding if you use storyboard


### `bindStyles()`

#### Usage

`bindStyles()` is used for styling your views. This method is optional. So implement it if you need.

- If your app support localized text or images, then styling it in 'bindStyles()'
- If your app support theme-based design that depends on user setting
- If your app does not use Storyboard

#### When is it called?

Right **before** UIViewController's initial `viewWillAppear(_:)` call and each time `traitCollectionDidChange(_:)` call
 
Right **before** each time UIView's `traitCollectionDidChange(_:)` call

## Dependency

- [RxSwift](https://github.com/ReactiveX/RxSwift) (>= 4.0.0)

## Requirements

- iOS 8.0+
- Xcode 7.3+

## Installation

ViewModelBindable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ViewModelBindable'
```

## Author

[makesource](https://github.com/makesource), makesource@gmail.com

## License

ViewModelBindable is available under the MIT license. See the LICENSE file for more info.
