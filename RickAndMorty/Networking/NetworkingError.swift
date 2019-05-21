//
//  NetworkingError.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
	
	case emptyResponse
	case missingBaseURL
	case noHttpResponse
	case httpError(statusCode: Int, request: URLRequest)
	
	var description: String {
		switch self {
		case let .httpError(statusCode, request):
			return "HTTPError statusCode: \(statusCode), request: \(request)"
			
		case .emptyResponse:
			return "Empty response"
		case .missingBaseURL:
			return "No base URL set"
		case .noHttpResponse:
			return "Can't resolve HTTPURLResponse"
		}
	}
	
}

