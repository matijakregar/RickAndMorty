//
//  DecodingManager.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct DecodingManager {
	
	// Decode the returned JSON data and try to create an object out of it.
	static func decode<T: Decodable>(data: Data?, completion: @escaping (Result<T, Error>) -> Void) {
		// Return an error if the data returned is empty.
		guard let data = data
			else {
				completion(.failure(NetworkingError.emptyResponse))
				return
		}
		
		// Try deserializing the returned JSON into the destination generic type.
		do {
			let decoder = JSONDecoder()
			let decodedValue = try decoder.decode(T.self, from: data)
			completion(.success(decodedValue))
		}
		catch {
			completion(.failure(error))
		}
		
	}
	
}

