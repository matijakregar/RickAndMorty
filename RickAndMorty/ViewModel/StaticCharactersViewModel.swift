//
//  StaticCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class StaticCharactersViewModel: CharactersViewModel {
	
	private(set) var characters = [Character]()
	var totalCharactersCount: Int {
		return characters.count
	}
	
	private(set) var title: String
	let emptyListMessage = NSLocalizedString("No characters here.", comment: "Empty list message")
	
	weak var delegate: CharactersViewModelDelegate?
	
	init(characters: [Character], title: String) {
		self.characters = characters
		self.title = title
	}
	
}

