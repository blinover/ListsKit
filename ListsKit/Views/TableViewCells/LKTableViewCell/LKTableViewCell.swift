//
//  LKTableViewCell.swift
//  ListsKit
//
//  Created by Danil Blinov on 05.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import RxSwift

open class LKTableViewCell: UITableViewCell {

	public static var cellIdentifier: String {
		return String(describing: self)
	}
	
	public var disposeBag = DisposeBag()
	
	open override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
	open func configureCell(_ cellModel: LKCellModel) {
		self.backgroundColor = cellModel.backgroundColor
	}
}
