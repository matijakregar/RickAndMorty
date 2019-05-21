//
//  Info.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

// Info object used when a list of other objects is requested.
struct Info: Decodable {
	
	// MARK: - Properties
	
	let count: Int
	let nextPage: Int?
	
	// MARK: - Coding keys
	
	enum CodingKeys: String, CodingKey {
		case count
		case nextPage = "next"
	}
	
}

// MARK: - Queryable

extension Info.CodingKeys: QueryKey {
	
	var queryParameter: String {
		return stringValue
	}
	
}

extension Info: Queryable {
	
}
