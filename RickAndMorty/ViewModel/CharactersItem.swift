//
//  CharactersItem.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct CharactersItem: PropertyListDisplayable {
	
	let name: String
	let characters: [Character]
	
	var value: CustomStringConvertible {
		return NSLocalizedString("View all", comment: "")
	}
	
}
