//
//  ShopFrontViewModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import Foundation
import ListsKit
import RxSwift

class ShopFrontViewModel {
	let cellModels = BehaviorSubject<[LKCellModel]>(value: [])
	private let shopModel = ShopfrontModel.defaultModel()
	
	init() {
		createCellModels()
	}
	
	private func createCellModels() {
		var models = [LKCellModel]()

		let shopHeaderCell = ShopHeaderCellModel(name: shopModel.shopName, image: shopModel.headerImage)
		models.append(shopHeaderCell)
		
		let productsCell = ProductsCollectionTableCellModel(products: shopModel.products)
		models.append(productsCell)

		cellModels.onNext(models)
	}
	
}
