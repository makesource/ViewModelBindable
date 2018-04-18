# ViewModelBindable
⚡️Super easy way to bind ViewModel
* **Easy**: Just inject ViewModel into UIView or UIViewController
* **Powerful** : Register any type of ViewModel (include protocols) you want to bind

## Usages
Just confrom your UIView or UIViewController to ViewModelBindable!

ViewModelBindable offers two binding method bindViewModel(viewModel: ViewModel), bindStyles()


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
  // Use if you need
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
  // Use if you need
  func bindStyles() {
  }
}
```

## Features

ViewModelBindable serves two binding methods which was used in MVVM architecture.

### `bindViewModel()`
`bindViewModel()` is used for binding between View and ViewModel.
It will be called only once after ViewModel injection. 
It is guaranteed that `bindViewModel()` was called after UIViewController's `viewDidLoad()`, UIView's `awakeFromNib()`. So don't be worried about IBOutlets was not initialized when binding if you use Storyboard.

### `bindStyles()`
`bindStyles()` is used for styling your views. In case ~, you have no choice but to set text or styles in swift files. ~ helps you to styles views. It will called


## Requirements

## Installation

ViewModelBindable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ViewModelBindable'
```

## Author

makesource, makesource@gmail.com

## License

ViewModelBindable is available under the MIT license. See the LICENSE file for more info.
