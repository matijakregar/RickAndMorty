//
//  QueryEndpoint.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct QueryEndpoint<T: Queryable>: Endpoint {
	
	let query: Query<T>
	
	var baseURL: URL {
		return Constants.Networking.baseURL
	}
	
	var path: String {
		return "/graphql"
	}
	
	var method: HTTPMethod {
		return .post
	}
	
	var postParameters: [String: Any]? {
		return ["query": query.stringValue]
	}
	
	var urlParameters: [String : Any]? {
		return nil
	}
	
	var headers: [String: Any]? {
		var headers = [String: Any]()
		headers["Content-Type"] = "application/json"
		headers["Accept"] = "application/json"
		headers["Accept-Encoding"] = "gzip, deflate, br"
		return headers
	}
	
	// MARK: - Request
	
	// Build a URL request with defined parameters.
	func urlRequest() throws -> URLRequest {
		var request = URLRequest(url: baseURL.appendingPathComponent(path))
		request.httpMethod = method.rawValue
		
		// Encode header parameters.
		request = try HeaderEncoder.encode(request: request, with: headers)
		
		// Encode the post parameters and return the request.
		request = try PostParameterEncoder.encode(request: request, with: postParameters)
		
		return request
	}
	
}

