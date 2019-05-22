//
//  FavoriteCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class FavoriteCharactersViewModel: CharactersViewModel, DataReloadable {
	
	private(set) var characters = [Character]()
	var totalCharactersCount: Int {
		return characters.count
	}
	
	weak var delegate: CharactersViewModelDelegate?
	
	func reloadData() {
		guard let retrievedCharacters = FavoritesManager.favoriteCharacters
			else {
				characters = [Character]()
				return
		}
		characters = retrievedCharacters
	}
	
}


