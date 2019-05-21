//
//  DecodingTests.swift
//  RickAndMortyTests
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import XCTest
@testable import RickAndMorty

class DecodingTests: XCTestCase {
	
	func testCharacter() {
		guard let json = Sample.load(named: "Character")
			else {
				XCTFail("Could not load the json!")
				return
		}
		
		do {
			let objectResponse = try JSONDecoder().decode(ObjectResponse<Character>.self, from: json)
			let character = objectResponse.object
			
			XCTAssertEqual(character.id, "21")
			XCTAssertEqual(character.name, "Aqua Morty")
			XCTAssertEqual(character.imageURL, URL(string: "https://rickandmortyapi.com/api/character/avatar/21.jpeg")!)
			
			XCTAssertNil(character.origin?.id)
			XCTAssertEqual(character.origin?.name, "unknown")
			XCTAssertEqual(character.location?.id, "3")
			XCTAssertEqual(character.location?.name, "Citadel of Ricks")
		}
		catch {
			XCTFail("Could not decode the JSON! \(error)")
		}
	}
	
	func testCharacterList() {
		guard let json = Sample.load(named: "Characters")
			else {
				XCTFail("Could not load the json!")
				return
		}
		
		do {
			let decoder = JSONDecoder()
			let listResponse = try decoder.decode(ListResponse<Character>.self, from: json)
			
			let info = listResponse.info
			
			XCTAssertEqual(info.count, 493)
			XCTAssertEqual(info.nextPage, 2)
			
			guard let firstCharacter = listResponse.objects.first
				else {
					XCTFail("Unable to resolve the first Character!")
					return
			}
			
			XCTAssertEqual(firstCharacter.id, "1")
			XCTAssertEqual(firstCharacter.name, "Rick Sanchez")
			XCTAssertEqual(firstCharacter.imageURL, URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)			
		}
		catch {
			XCTFail("Could not decode the JSON! \(error)")
		}
	}
	
	func testLocation() {
		guard let json = Sample.load(named: "Location")
			else {
				XCTFail("Could not load the json!")
				return
		}
		
		do {
			let objectResponse = try JSONDecoder().decode(ObjectResponse<Location>.self, from: json)
			let location = objectResponse.object
			
			XCTAssertEqual(location.id, "1")
			XCTAssertEqual(location.name, "Earth (C-137)")
			XCTAssertEqual(location.type, "Planet")
			XCTAssertEqual(location.dimension, "Dimension C-137")
			
			guard let firstResident = location.residents?.first
				else {
					XCTFail("Unable to resolve the first Resident!")
					return
			}
			
			XCTAssertEqual(firstResident.id, "38")
			XCTAssertEqual(firstResident.name, "Beth Smith")
			XCTAssertEqual(firstResident.imageURL, URL(string: "https://rickandmortyapi.com/api/character/avatar/38.jpeg")!)
		}
		catch {
			XCTFail("Could not decode the JSON! \(error)")
		}
	}
	
}
