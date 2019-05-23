//
//  Query.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol QueryConvertible {
	
	var stringValue: String { get }
	
}

enum Query<T: Queryable>: QueryConvertible {
	
	case list(page: Int)
	case object(id: String)
	
	var topQueryName: String {
		switch self {
		case .list(let page):
			return "\(T.listKey)(page: \(page))"
		case .object(let id):
			return "\(T.objectKey)(id: \(id))"
		}
	}
	
	var infoQuery: String? {
		switch self {
		case .list:
			return "info \(Info.fullQuery)"
		case .object:
			return nil
		}
	}
	
	var resultQuery: String {
		switch self {
		case .list:
			return "results \(T.shortQuery)"
		case .object:
			return T.fullQuery
		}
	}
	
	var stringValue: String {
		var result = "query { "
		result += topQueryName
		if let infoQuery = infoQuery {
			result += "{ \(infoQuery) \(resultQuery) }"
		}
		else {
			result += resultQuery
		}
		result += " }"
		
		return result
	}
	
}
