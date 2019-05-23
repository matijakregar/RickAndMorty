//
//  FavoritesTest.swift
//  RickAndMortyTests
//
//  Created by Matija Kregar on 23/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import XCTest
@testable import RickAndMorty

class FavoritesTest: XCTestCase {
	
	lazy var storedFavorites = {
		return FavoritesManager.favoriteCharacters
	}()
	
	override func setUp() {
		// Remove all the favorites.
		guard let favorites = storedFavorites
			else {
				return
		}
		for favorite in favorites {
			FavoritesManager.removeFavorite(character: favorite)
		}
	}
	
	override func tearDown() {
		// Put all the favorites back.
		guard let favorites = storedFavorites
			else {
				return
		}
		for favorite in favorites {
			FavoritesManager.addFavorite(character: favorite)
		}
	}
	
	func testAddingAndRemoving() {
		guard let character: Character = Sample.loadAndDecode(named: "Character")
			else {
				XCTFail()
				return
		}
		FavoritesManager.addFavorite(character: character)
		
		guard let firstFavorite = FavoritesManager.favoriteCharacters?.first
			else {
				XCTFail("Failed to save the character to favorites.")
				return
		}
		
		XCTAssertEqual(firstFavorite.id, "21")
		XCTAssertEqual(firstFavorite.name, "Aqua Morty")
		XCTAssertEqual(firstFavorite.species, "Humanoid")
		XCTAssertEqual(firstFavorite.imageURL, URL(string: "https://rickandmortyapi.com/api/character/avatar/21.jpeg")!)
		
		XCTAssertNil(firstFavorite.origin?.id)
		XCTAssertEqual(firstFavorite.origin?.name, "unknown")
		XCTAssertEqual(firstFavorite.location?.id, "3")
		XCTAssertEqual(firstFavorite.location?.name, "Citadel of Ricks")
		
		FavoritesManager.removeFavorite(character: firstFavorite)
		XCTAssertNil(FavoritesManager.favoriteCharacters?.first, "Failed to remove the character from favorites.")
		
	}
	
}

