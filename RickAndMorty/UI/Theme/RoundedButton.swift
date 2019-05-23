//
//  RoundedButton.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 23/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
	
	@objc dynamic var cornerRadius: NSNumber? {
		didSet {
			guard let cornerRadius = cornerRadius
				else {
					layer.cornerRadius = 0
					return
			}
			layer.cornerRadius = CGFloat(cornerRadius.doubleValue)
		}
	}
	
	@objc dynamic var titleFont: UIFont? {
		didSet {
			titleLabel?.font = titleFont
		}
	}
	
	@objc dynamic var textColor: UIColor? {
		didSet {
			setTitleColor(textColor)
		}
	}
	
}
