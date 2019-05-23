//
//  ParameterEncoder.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol ParameterEncoder {
	
	static func encode(request: URLRequest, with parameters: [String: Any]?) throws -> URLRequest
	
}
