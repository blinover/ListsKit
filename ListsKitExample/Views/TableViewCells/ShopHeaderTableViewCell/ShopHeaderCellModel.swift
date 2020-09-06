//
//  ShopHeaderCellModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

class ShopHeaderCellModel: LKCellModel {
	let frontImage: UIImage
	let titleText: String
	
	init(name: String, image: UIImage) {
		self.titleText = name
		self.frontImage = image
		super.init(cellIdentifier: ShopHeaderTableViewCell.cellIdentifier)
	}
}
