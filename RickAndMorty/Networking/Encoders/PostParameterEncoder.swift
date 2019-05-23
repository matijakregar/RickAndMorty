//
//  PostParameterEncoder.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct PostParameterEncoder: ParameterEncoder {
	
	static func encode(request: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
		// It would not make any sense to encode a request without a URL.
		guard request.url != nil
			else {
				throw NetworkingError.missingBaseURL
		}
		
		// Do not proceed if the headers are empty.
		guard let parameters = parameters
			else {
				return request
		}
		
		// Shadow the request argument as a variable so we can change it
		var request = request
		
		// Map the parameter dictionary to post body data.
		do {
			request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
		} catch {
			throw error
		}
		
		return request
	}
	
}

