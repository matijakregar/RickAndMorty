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
	case missingParameters
	case noHttpResponse
	case corruptData
	case httpError(statusCode: Int, request: URLRequest)
	
	var localizedDescription: String {
		switch self {
		case let .httpError(statusCode, request):
			return String(format: NSLocalizedString("HTTPError statusCode: %@, request: %@", comment: "Error description"), statusCode.description, request.description)
			
		case .emptyResponse:
			return NSLocalizedString("Empty response.", comment: "Error description")
		case .missingBaseURL:
			return NSLocalizedString("No base URL set.", comment: "Error description")
		case .missingParameters:
			return NSLocalizedString("Input parameters for the request missing.", comment: "Error description")
		case .noHttpResponse:
			return NSLocalizedString("Can't resolve HTTPURLResponse.", comment: "Error description")
		case .corruptData:
			return NSLocalizedString("Loaded data is corrupt.", comment: "Error description")
		}
	}
	
}

