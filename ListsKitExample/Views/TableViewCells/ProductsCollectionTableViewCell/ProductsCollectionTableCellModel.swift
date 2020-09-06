//
//  ProductsCollectionTableCellModel.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import Foundation
import ListsKit

class ProductsCollectionTableCellModel: LKCollectionTableCellModel {	
	init(products: [Product]) {
		super.init(cellIdentifier: ProductsCollectionTableViewCell.cellIdentifier)
		
		let models = products.compactMap({ ProductCellModel($0) })
		cellModels.onNext(models)
	}
}
