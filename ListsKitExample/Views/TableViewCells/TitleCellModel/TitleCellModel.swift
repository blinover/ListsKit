//
//  TitleCellModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import Foundation
import ListsKit

class TitleCellModel: LKCellModel {
	let titleText: String
	
	public init(title: String) {
		self.titleText = title
		super.init(cellIdentifier: TitleTableViewCell.cellIdentifier)
	}
	
}
