//
//  LKTableCollectionViewCell.swift
//  ListsKit
//
//  Created by Danil Blinov on 05.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class LKTableCollectionViewCell: LKTableViewCell {
	
	private var collectionView: UICollectionView!
	private var сollectionViewHeight: NSLayoutConstraint?
	public var structureModel: LKCollectionTableCellModel!
	
	public func set(_ collectionView: UICollectionView, height: NSLayoutConstraint) {
		self.collectionView = collectionView
		self.сollectionViewHeight = height
	}
	
	open override func configureCell(_ cellModel: LKCellModel) {
		super.configureCell(cellModel)
		guard let model = cellModel as? LKCollectionTableCellModel else { return }
		structureModel = model
		
		collectionView.dataSource = nil
		collectionView.delegate = nil
				
		collectionView.rx.setDelegate(self).disposed(by: disposeBag)
		
		structureModel.cellModels
			.bind(to: collectionView.rx.items) { collectionView, row, model in
				collectionView.registerNib(cellName: model.cellIdentifier)
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: IndexPath(row: row, section: 0)) as? LKCollectionViewCell else { fatalError() }
				cell.configureCell(model)
				return cell
		}.disposed(by: disposeBag)
		
		collectionView.rx.modelSelected(LKCellModel.self).subscribe(onNext: { (model) in
			model.onClickCell?(model)
		}).disposed(by: disposeBag)
	}
	
	public override func awakeFromNib() {
		let layout = UICollectionViewFlowLayout()
		layout.estimatedItemSize = CGSize(width: 100, height: 100)
		self.collectionView?.collectionViewLayout = layout
	}
	
	func updateCollectionViewHeight() {
		if let height = self.сollectionViewHeight {
			height.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height
		}
		
		collectionView.reloadData()
	}
	
}

extension LKTableCollectionViewCell: UICollectionViewDelegate {
	
	public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		guard let collectionViewCell = collectionView.cellForItem(at: indexPath) else { return }
		if let animatabelCell = collectionViewCell as? Animatable {
			animatabelCell.animateSelect()
		}
	}
	
	public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		guard let collectionViewCell = collectionView.cellForItem(at: indexPath) else { return }
		if let animatabelCell = collectionViewCell as? Animatable {
			animatabelCell.animateDeselect()
		}
	}
	
}

private extension UICollectionView {
	
	func registerNib(cellName: String) {
		self.register(UINib(nibName: cellName, bundle: Bundle.main), forCellWithReuseIdentifier: cellName)
	}
	
}
