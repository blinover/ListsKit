//
//  LKTableController.swift
//  ListsKit
//
//  Created by Danil Blinov on 05.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class LKTableController: NSObject, UITableViewDelegate {
	public let cellModels = BehaviorSubject<[LKCellModel]>(value: [])
	
	public var tableView: UITableView?
	private let disposeBag = DisposeBag()
	
	public func set(_ tableView: UITableView) {
		self.tableView = tableView
		self.setupTableView()
	}
	
	private func setupTableView() {
		guard let tableView = tableView else { return }
		tableView.rx
			.setDelegate(self)
			.disposed(by: disposeBag)
		
		cellModels.asObservable()
			.bind(to: tableView.rx.items) { tableView, _, model in
				tableView.registerNib(cellName: model.cellIdentifier)
				
				guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? LKTableViewCell else { abort() }
				
				cell.configureCell(model)
				
				if let collectionCell = cell as? LKTableCollectionViewCell {
					collectionCell.frame = tableView.bounds;
					
					collectionCell.setNeedsLayout()
					collectionCell.layoutIfNeeded()
					
					collectionCell.updateCollectionViewHeight()
				}
				
				return cell
		}.disposed(by: disposeBag)
		
		tableView.rx.modelSelected(LKCellModel.self).subscribe(onNext: { (cellModel) in
			cellModel.onClickCell?(cellModel)
		}).disposed(by: disposeBag)
		
        tableView.rx.itemSelected
            .bind { [weak tableView] in
                tableView?.deselectRow(at: $0, animated: true)
            }
            .disposed(by: disposeBag)
	}
	
	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		guard let height = try? cellModels.value()[indexPath.row].cellHeight else { return UITableView.automaticDimension }
		switch height {
			case .automaticDimension:
			  return UITableView.automaticDimension
			case .height(let height):
			  return height
		}
	}
	
	public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		guard let height = try? cellModels.value()[indexPath.row].cellHeight else { return UITableView.automaticDimension }
		switch height {
			case .automaticDimension:
				return UITableView.automaticDimension
			case .height(let height):
				return height
		}
	}
	
	public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
		guard let tableViewCell = tableView.cellForRow(at: indexPath) else { return }
		if let animatabelCell = tableViewCell as? Animatable {
			animatabelCell.animateSelect()
		}
	}
	
	public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		guard let tableViewCell = tableView.cellForRow(at: indexPath) else { return }
		if let animatabelCell = tableViewCell as? Animatable {
			animatabelCell.animateDeselect()
		}
	}
	
}

private extension UITableView {
	
	func registerNib(cellName: String) {
		self.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
	}
	
}

