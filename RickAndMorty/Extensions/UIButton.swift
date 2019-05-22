//
//  UIButton.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

extension UIButton {
	
	var allStates: [UIControl.State] {
		return [.normal, .selected, .highlighted, .disabled]
	}
	
	@objc func setTitle(_ title: String?) {
		allStates.forEach {
			setTitle(title, for: $0)
		}
	}
	
}
