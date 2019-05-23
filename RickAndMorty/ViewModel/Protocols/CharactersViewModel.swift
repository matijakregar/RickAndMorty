//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol CharactersViewModel {
	
	var characters: [Character] { get }
	var totalCharactersCount: Int { get }
	var title: String { get }
	var emptyListMessage: String { get }
	var canDeleteCharacters: Bool { get }
	var delegate: CharactersViewModelDelegate? { get set }
	
}


extension CharactersViewModel {
	
	var canDeleteCharacters: Bool {
		return false
	}
	
}
