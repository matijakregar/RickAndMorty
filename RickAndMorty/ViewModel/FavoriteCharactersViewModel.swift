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
	
}


