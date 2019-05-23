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
	
	let title = NSLocalizedString("Favorite Characters", comment: "Screen title")
	let emptyListMessage = NSLocalizedString("No favorites selected yet.", comment: "Empty list message")
	
	let canDeleteCharacters: Bool = true
	
	weak var delegate: CharactersViewModelDelegate?
	
	init() {
		NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(Constants.Notification.favoritesChanged), object: nil)
	}
	
	@objc func reloadData() {
		guard let retrievedCharacters = FavoritesManager.favoriteCharacters
			else {
				characters = [Character]()
				return
		}
		characters = retrievedCharacters
		delegate?.viewModel(self, didLoadDataFor: .none)
	}
	
	func removeFromFavorites(character: Character) {
		FavoritesManager.removeFavorite(character: character)
		characters = FavoritesManager.favoriteCharacters ?? [Character]()
	}
	
}


