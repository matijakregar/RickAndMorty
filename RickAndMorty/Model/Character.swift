//
//  Character.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct Character: Decodable {
	
	// MARK: - Properties
	
	let id: String
	let name: String
	let species: String
	let imageURL: URL
	let location: Location?
	let origin: Location?
	
	// MARK: - Coding keys
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case species
		case imageURL = "image"
		case origin
		case location
	}
	
}

// MARK: - Queryable

extension Character.CodingKeys: QueryKey {
	// Define how the query is generated and which properties have nested queries.
	var queryParameter: String {
		switch self {
		case .location, .origin:
			return stringValue + " " + Location.shortQuery
		default:
			return stringValue
		}
	}
	
}

extension Character: Queryable {
	
	static var shortQuery: String {
		return query(for: [
			.id,
			.name,
			.species,
			.imageURL
			])
	}
	
	static var objectKey: String {
		return "character"
	}
	
	static var listKey: String {
		return "characters"
	}
	
}

// MARK: - CharacterListDisplayable

extension Character: CharacterListDisplayable {
	
}
