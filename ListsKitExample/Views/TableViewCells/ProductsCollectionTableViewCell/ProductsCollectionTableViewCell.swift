//
//  ProductsCollectionTableViewCell.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit

class ProductsCollectionTableViewCell: LKTableCollectionViewCell {
	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet private weak var collectionHeight: NSLayoutConstraint!
	
	override func configureCell(_ cellModel: LKCellModel) {
		set(collectionView, height: collectionHeight)
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let width = 84
		layout.sectionInset = UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 16)
		layout.minimumInteritemSpacing = 16
		layout.itemSize = CGSize(width: width, height: width + 40)
		self.collectionView.collectionViewLayout = layout
		
		super.configureCell(cellModel)
	}
}
