# ViewModelBindable
⚡️Super easy way to bind ViewModel

1. typealias your ViewModel which you want to inject
```swift
typealias ViewModel = DetailViewModel
```

2. Inject viewModel
```swift
let vc = UIViewController()
let viewModel = DetailViewModel()
vc.viewModel = viewModel
```

3. ViewModelBindable will call bindViewModel(_:), bindStyles(). Just use it!

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

Right **after** UIView's `awakeFromNib()`
 
You can initialize some stuffs in viewDidLoad / awakeFromNib to prepare binding if you use storyboard


### `bindStyles()`

#### Usage

`bindStyles()` is used for styling your views. This method is optional. So you don't need to implement it.

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
