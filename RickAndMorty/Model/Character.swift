//
//  Character.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct Character: Decodable {
	
	let id: String
	let name: String
	let imageURL: URL
	let location: Location?
	let origin: Location?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case imageURL = "image"
		case origin
		case location
	}
	
}
