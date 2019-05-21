//
//  NetworkingManager.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class NetworkingManager {
	
	private static let shared = NetworkingManager()
	
	private lazy var session: URLSession = {
		return URLSession(configuration: sessionConfiguration)
	}()
	
	private lazy var cache: URLCache = {
		return URLCache(memoryCapacity: Constants.Networking.Cache.memorySize, diskCapacity: Constants.Networking.Cache.diskSize, diskPath: nil)
	}()
	
	// Creates a custom session configuration.
	private lazy var sessionConfiguration: URLSessionConfiguration = {
		var sessionConfiguration = URLSessionConfiguration.default
		sessionConfiguration.allowsCellularAccess = true
		sessionConfiguration.timeoutIntervalForRequest = Constants.Networking.timeout
		sessionConfiguration.timeoutIntervalForResource = Constants.Networking.timeout
		sessionConfiguration.requestCachePolicy = Constants.Networking.Cache.policy
		sessionConfiguration.urlCache = cache
		
		return sessionConfiguration
	}()
	
	
	// Start a request for a URL and pass returned data to the completion block.
	@discardableResult
	static func request(for url: URL, completion: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask? {
		return request(URLRequest(url: url), completion: completion)
	}
	
	// Start a URL request and pass returned data to the completion block.
	@discardableResult
	static func request(_ request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask? {
		
		let session = shared.session
		let task = session.dataTask(with: request) { (data, response, error) in
			// In case of any error we make sure we pass a Result of type failure.
			if let error = error {
				completion(.failure(error))
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse
				else {
					completion(.failure(NetworkingError.noHttpResponse))
					return
			}
			
			guard	200...299 ~= httpResponse.statusCode
				else {
					let error = NetworkingError.httpError(statusCode: httpResponse.statusCode, request: request)
					completion(.failure(error))
					return
			}
			
			// Call the completion block with success.
			completion(.success(data))
		}
		task.resume()
		return task
	}
	
	// Start a URL request from the specified endpoint, decode the response and execute a completion block when done.
	@discardableResult
	static func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask? {
		do {
			// Build the endpoint request.
			let request = try endpoint.urlRequest()
			
			// Return the request.
			return self.request(request, completion: completion)
		}
		catch {
			// In case of any other failure, pass the error in the result type.
			completion(.failure(error))
			
			return nil
		}
	}
	
	// Start a URL request for decodable results, execute a completion block when done.
	@discardableResult
	static func request<T: Decodable>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask? {
		return self.request(request) { result in
			switch result {
			case let .failure(error):
				completion(.failure(error))
			case let .success(value):
				DecodingManager.decode(data: value, completion: completion)
			}
		}
	}
	
}
