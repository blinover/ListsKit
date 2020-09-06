//
//  ProductCollectionViewCell.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

class ProductCollectionViewCell: LKCollectionViewCell, Animatable {
	@IBOutlet private weak var imageView: UIImageView!
	
	override func configureCell(_ cellModel: LKCellModel) {
		super.configureCell(cellModel)
		setupStyle()
		guard let model = cellModel as? ProductCellModel else { return }
		self.imageView.image = model.productImage
	}
	
	private func setupStyle() {
		self.layer.masksToBounds = false
		self.layer.cornerRadius = 8
		self.layer.shadowColor = UIColor.black.withAlphaComponent(0.05).cgColor
		self.layer.shadowOpacity = 1
		self.layer.shadowRadius = 12.0
		self.layer.shadowOffset = CGSize(width: 0, height: 6)
	}
	
}
