//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol Endpoint {
	
	var baseURL: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var postParameters: [String: Any]? { get }
	var urlParameters: [String: Any]? { get }
	var headers: [String: Any]? { get }
	
	func urlRequest() throws -> URLRequest
	
}
