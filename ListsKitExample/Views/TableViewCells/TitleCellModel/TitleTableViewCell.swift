//
//  TitleTableViewCell.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

class TitleTableViewCell: LKTableViewCell {
	@IBOutlet private weak var titleLabel: UILabel!
	
	override func configureCell(_ cellModel: LKCellModel) {
		super.configureCell(cellModel)
		guard let model = cellModel as? TitleCellModel else { return }
		titleLabel.text = model.titleText
	}
    
}
