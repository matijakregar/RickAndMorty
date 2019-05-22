//
//  UIView.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

extension UIView {
	
	func fadeIn(withDuration duration: TimeInterval = .defaultAnimation, completion: ((Bool) -> Void)? = nil) {
		isHidden = false
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 1
		}) { (success) in
			completion?(success)
		}
	}
	
	func fadeOut(withDuration duration: TimeInterval = .defaultAnimation, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 0
		}) { (success) in
			self.isHidden = true
			completion?(success)
		}
	}
	
}
