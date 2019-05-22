//
//  UserDefaultsManager.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct FavoritesManager {
	
	// Using user defaults to persist favorite characters is a quick solution. Ideally something like CoreData would be used.
	private static var userDefaults = UserDefaults.standard
	
	static func addFavorite(character: Character) {
		var favorites = [character]
		if let existingFavorites = favoriteCharacters {
			favorites.append(contentsOf: existingFavorites)
		}
		
		let noDuplicatesFavorites: [Character] = Array(Set(favorites))

		guard let favoritesData = try? JSONEncoder().encode(noDuplicatesFavorites)
			else {
				return
		}
		userDefaults.setValue(favoritesData, forKey: Constants.UserDefaults.Key.favoriteCharacters)
		userDefaults.synchronize()
	}
	
	static func removeFavorite(character :Character) {
		guard let existingFavorites = favoriteCharacters
			else {
				return
		}
		
		let filteredFavorites = existingFavorites.filter({$0 != character})
		
		guard let favoritesData = try? JSONEncoder().encode(filteredFavorites)
			else {
				return
		}
		userDefaults.setValue(favoritesData, forKey: Constants.UserDefaults.Key.favoriteCharacters)
		userDefaults.synchronize()
	}
	
	static var favoriteCharacters: [Character]? {
		get {
			guard let charactersData = userDefaults.value(forKey: Constants.UserDefaults.Key.favoriteCharacters) as? Data
				else {
					return nil
			}
			
			let characters = try? JSONDecoder().decode([Character].self, from: charactersData)
			return characters
		}
	}
	
}

