//
//  ProductCellModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

class ProductCellModel: LKCellModel {
	let productImage: UIImage
	let namaText: String
	
	init(_ product: Product) {
		self.productImage = product.image
		self.namaText = product.title
		super.init(cellIdentifier: ProductCollectionViewCell.cellIdentifier())
	}
}
