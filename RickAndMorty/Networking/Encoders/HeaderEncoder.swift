//
//  HeaderEncoder.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct HeaderEncoder: ParameterEncoder {
	
	static func encode(request: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
		// We should not proceed if we don't have a valid URL.
		guard request.url != nil
			else {
				throw NetworkingError.missingBaseURL
		}
		
		// Do not proceed if the headers are empty.
		guard let parameters = parameters
			else {
				return request
		}
		
		// Make the request parameter a variable, so we can modify it.
		var request = request
		
		// Iterate through each keypair and set the HTTP headers.
		parameters.forEach { key, value in
			request.setValue("\(value)", forHTTPHeaderField: key)
		}
		
		return request
	}
	
}
