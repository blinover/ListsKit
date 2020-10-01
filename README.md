![ListsKit](https://github.com/blinover/ListsKit/blob/master/Images/logo.png?raw=true)
======================================
[![Version](https://img.shields.io/cocoapods/v/ListsKit.svg?style=flat)](http://cocoapods.org/pods/ListsKit)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/blinover/ListsKit/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/ListsKit.svg?style=flat)](http://cocoapods.org/pods/ListsKit)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-success.svg?style=flat)](https://developer.apple.com/swift/)
![iOS 9.0+](https://img.shields.io/badge/iOS-12.0%2B-blue.svg)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## Intoduction

ListsKit helps you write less code and reuse cells as easily as possible. Use UICollectionView inside UITableView + Fancy click animations

## Usage
### Basic
```swift
import ListsKit
```

Create cell model and Inherit `LKCellModel`, setup model and use parent initializer
```swift
class ShopHeaderCellModel: LKCellModel {
	let frontImage: UIImage
	let titleText: String
	
	init(name: String, image: UIImage) {
		self.titleText = name
		self.frontImage = image
		super.init(cellIdentifier: ShopHeaderTableViewCell.cellIdentifier)
	}
}
```

Create `UITableViewCell + .xib` and Inherit `LKTableViewCell`, for configuring cell use `func configureCell(_ cellModel: LKCellModel)`
```swift
class ShopHeaderTableViewCell: LKTableViewCell {
	@IBOutlet private weak var shopImageView: UIImageView!
	@IBOutlet private weak var titleLabel: UILabel!
	
	override func configureCell(_ cellModel: LKCellModel) {
		super.configureCell(cellModel)
		guard let model = cellModel as? ShopHeaderCellModel else { return }
		shopImageView.image = model.frontImage
		titleLabel.text = model.titleText
	}  
}
```

 Add `LKTableController` property in your ViewController
```swift
	private let tableController = LKTableController()
```

Create cell models and bind it to LKTableController `cellModels` property
```swift
	private func createCellModels() {
		var models = [LKCellModel]()

		let shopHeaderCell = ShopHeaderCellModel(name: shopModel.shopName, image: shopModel.headerImage)
		models.append(shopHeaderCell)

		tableController.cellModels.onNext(models)
	}
```

Now you can easily reuse `ShopHeaderCellModel` modify and safly inject in another controller.

See Example project for more information and complex examples.

## Requirements
`ListsKit` written in Swift 5.0. Compatible with iOS 13.0+

## Installation

### Cocoapods

```ruby
pod 'ListsKit'
```

## Contributors
[Anton Lisovoy](https://github.com/AntonLisovoy)

## License

ListsKit is released under a MIT License.
