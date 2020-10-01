//
//  LKCollectionTableCellModel.swift
//  ListsKit
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import Foundation
import RxSwift

open class LKCollectionTableCellModel: LKCellModel {
	public let cellModels = BehaviorSubject<[LKCellModel]>(value: [])
	
	public override init(cellIdentifier: String) {
		super.init(cellIdentifier: cellIdentifier)
		createCellModels()
	}
	
	func createCellModels() {
		
	}
}
