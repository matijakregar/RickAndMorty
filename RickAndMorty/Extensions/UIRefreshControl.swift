//
//  UIRefreshControl.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

extension UIRefreshControl {
	
	// Call this function to prevent UI glitches.
	func endRefreshingIfNeeded() {
		if isRefreshing {
			endRefreshing()
		}
	}
	
}
