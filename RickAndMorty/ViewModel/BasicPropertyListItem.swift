//
//  BasicPropertyListItem.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct BasicPropertyListItem: PropertyListDisplayable {
	
	let name: String
	let value: CustomStringConvertible
	let isSelectable: Bool = false
	
}
