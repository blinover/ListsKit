//
//  LKCellModel.swift
//  ListsKit
//
//  Created by Danil Blinov on 05.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit

open class LKCellModel {
	public enum LKCellHeight {
		case height(_ height: CGFloat)
		case automaticDimension
	}
	
	public typealias OnClickCellAction = (_ cellModel: LKCellModel) -> Void
	
	open var cellHeight: LKCellHeight { return .automaticDimension }
	public var cellIdentifier: String
	public var backgroundColor: UIColor?
	public var onClickCell: OnClickCellAction?
	
	public init(cellIdentifier: String) {
		self.cellIdentifier = cellIdentifier
	}
	
}
