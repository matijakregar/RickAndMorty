//
//  Sample.swift
//  RickAndMortyTests
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class Sample {
	
	static func load(named name: String, ofType fileType: String = "json") -> Data? {
		let bundle = Bundle(for: Sample.self)
		guard let url = bundle.url(forResource: name, withExtension: fileType)
			else {
				return nil
		}
		
		return try? Data(contentsOf: url)
	}
	
}
