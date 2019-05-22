//
//  QueryTests.swift
//  RickAndMortyTests
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import XCTest
@testable import RickAndMorty

class QueryTests: XCTestCase {
	// WARNING: These tests are pretty brittle because of spaces.
	func testSingleCharacter() {
		let query = Query<Character>.object(id: "21")
		XCTAssertEqual(query.stringValue, "query { character(id: 21){ id, name, species, image, origin { id, name }, location { id, name } } }")
	}
	func testCharactersPage() {
		let query = Query<Character>.list(page: 1)
		XCTAssertEqual(query.stringValue, "query { characters(page: 1){ info { count, next } results { id, name, species, image } } }")
	}
	func testSingleLocation() {
		let query = Query<Location>.object(id: "1")
		XCTAssertEqual(query.stringValue, "query { location(id: 1){ id, name, type, dimension, residents { id, name, species, image } } }")
	}
	
}
