//
//  QueryKey.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

// A protocol that defines properties to generate their GraphQL queries.
protocol Queryable {
	
	associatedtype CodingKeys
	// Query for specified properties.
	static func query(for keys: [CodingKeys]) -> String
	// Query for predefined properties usually needed in lists.
	static var shortQuery: String { get }
	// Query for all defined properties.
	static var fullQuery: String { get }
	
	// Query key for fetching a list of objects and a decoding key to decode list results.
	static var listKey: String { get }
	// Query key for fetching a single object and a decoding key to decode a single result.
	static var objectKey: String { get }
	
}

// A protocol to enable coding keys to generate a query for the related property.
protocol QueryKey: CaseIterable {
	
	var queryParameter: String { get }
	
}

// Default implementation for Queryable.
extension Queryable where CodingKeys: QueryKey {
	static func query(for keys: [CodingKeys]) -> String {
		return keys.query
	}
	
	static var fullQuery: String {
		return Array(CodingKeys.allCases).query
	}
	
	// Empty default implementations to make these properties optional.
	static var shortQuery: String {
		return ""
	}
	
	static var listKey: String {
		return ""
	}
	
	static var objectKey: String {
		return ""
	}
}

extension Array where Element: QueryKey {
	
	// Array extension that generates a GraphQL query from an array of QueryKeys.s
	var query: String {
		let result = self.compactMap({$0.queryParameter}).joined(separator: ", ")
		return "{ \(result) }"
	}
	
}
