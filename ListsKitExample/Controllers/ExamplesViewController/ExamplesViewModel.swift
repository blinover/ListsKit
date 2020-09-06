//
//  ExamplesViewModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import Foundation
import RxSwift
import ListsKit

final class ExamplesViewModel {
	let cellModels = BehaviorSubject<[LKCellModel]>(value: [])
	let showViewController = PublishSubject<UIViewController>()
	
	private var controllersIds = ["StarWarsViewController", "ShopFrontViewController"]
	init() {
		createCellModels()
	}
	
	private func createCellModels() {
		var models = [LKCellModel]()
		
		for controllerId in controllersIds {
			let titleCellModel = TitleCellModel(title: controllerId)
			titleCellModel.onClickCell = { [weak self] (cellModels: LKCellModel) in
				let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: controllerId)
				self?.showViewController.onNext(viewController)
			}
			models.append(titleCellModel)
		}
		cellModels.onNext(models)
	}
}
