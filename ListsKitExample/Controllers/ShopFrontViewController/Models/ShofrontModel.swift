//
//  ShofrontModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit

struct ShopfrontModel {
	let headerImage: UIImage
	let shopName: String
	let products: [Product]
	let descriptions: [DetailedDescription]
	
	static func defaultModel() -> ShopfrontModel {
		let products =  Array(0..<5).compactMap({ Product(title: "Item \($0)", image: UIImage(named: "item_\($0)")!) })
		return ShopfrontModel(headerImage: #imageLiteral(resourceName: "store"), shopName: "Supreme LA", products: products, descriptions: [])
	}
}

struct Product {
	let title: String
	let image: UIImage
}


struct DetailedDescription {
	let title: String
	let description: String
}
