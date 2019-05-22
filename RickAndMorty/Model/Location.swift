//
//  Location.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct Location: Decodable {
	
	// MARK: - Properties
	
	let id: String?
	let name: String
	let type: String?
	let dimension: String?
	let residents: [Character]?
	
	// MARK: - Coding keys
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case type
		case dimension
		case residents
	}
	
}

// MARK: - Queryable

extension Location.CodingKeys: QueryKey {
	// Define how the query is generated and which properties have nested queries.
	var queryParameter: String {
		switch self {
		case .residents:
			return stringValue + " " + Character.shortQuery
		default:
			return stringValue
		}
	}
	
}

extension Location: Queryable {
	
	static var shortQuery: String {
		return query(for: [
			.id,
			.name
			])
	}
	
	static var objectKey: String {
		return "location"
	}
	
	static var listKey: String {
		return "locations"
	}
	
}

extension Location: CustomStringConvertible {
	
	var description: String {
		return name
	}
	
}
