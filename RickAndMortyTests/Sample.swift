//
//  Sample.swift
//  RickAndMortyTests
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import XCTest
@testable import RickAndMorty

class Sample {
	
	static func load(named name: String, ofType fileType: String = "json") -> Data? {
		let bundle = Bundle(for: Sample.self)
		guard let url = bundle.url(forResource: name, withExtension: fileType)
			else {
				return nil
		}
		
		return try? Data(contentsOf: url)
	}
	
	static func loadAndDecode<T: Decodable & Queryable>(named name: String, ofType fileType: String = "json") -> T? {
		let bundle = Bundle(for: Sample.self)
		guard let url = bundle.url(forResource: name, withExtension: fileType),
			let data = try? Data(contentsOf: url),
			let objectResponse = try? JSONDecoder().decode(ObjectResponse<T>.self, from: data)
			else {
				XCTFail("Unable to load and decode: \(name).\(fileType)")
				return nil
		}
		
		return objectResponse.object
	}
	
}
