//
//  Location.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct Location: Decodable {
	
	let id: String?
	let name: String
	let type: String?
	let dimension: String?
	let residents: [Character]?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case type
		case dimension
		case residents
	}
	
}
