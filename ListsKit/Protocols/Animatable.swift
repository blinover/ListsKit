//
//  Animatable.swift
//  ListsKit
//
//  Created by Danil Blinov on 05.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit

public protocol Animatable {
	func animateSelect()
	func animateDeselect()
}

public extension Animatable where Self: UIView {
	
	func animateSelect() {
		let originalTransform = self.transform
		let scaledTransform = originalTransform.scaledBy(x: 0.9, y: 0.9)
		UIView.animate(withDuration: 0.2, animations: {
			self.transform = scaledTransform
		})
	}
	
	func animateDeselect() {
		let originalTransform = self.transform
		let scaledTransform = originalTransform.scaledBy(x: 1.111111111111111, y: 1.111111111111111)
		UIView.animate(withDuration: 0.2, animations: {
			self.transform = scaledTransform
		})
	}
	
}
