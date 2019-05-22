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
	var delegate: CharactersViewModelDelegate? { get set }
	
}
