//
//  LKCollectionViewCell.swift
//  ListsKit
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import RxSwift

open class LKCollectionViewCell: UICollectionViewCell {
	var disposeBag = DisposeBag()
	
	open override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
	public static func cellIdentifier() -> String {
		return String(describing: self)
	}
	
	open func configureCell(_ cellModel: LKCellModel) {

	}
}
