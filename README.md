# ViewModelBindable
⚡️Super easy way to bind ViewModel

## Features
* **Easy**: Just inject ViewModel into UIView or UIViewController
* **Powerful** : Register any type of ViewModel (include protocols) you want to bind

## Usages
Just confrom your UIView or UIViewController to ViewModelBindable!

ViewModelBindable offers two binding method bindViewModel(viewModel: ViewModel), bindStyles()


1. **UIViewController**
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
2. **UIView**
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
