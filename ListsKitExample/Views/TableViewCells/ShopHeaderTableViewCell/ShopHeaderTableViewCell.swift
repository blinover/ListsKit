//
//  ShopHeaderTableViewCell.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

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
