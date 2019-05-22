//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class CharacterDetailViewModel {
	
	private(set) var character: Character
	
	init(character: Character) {
		self.character = character
	}
	
	var propertyListItems: [PropertyListDisplayable] {
		var items: [PropertyListDisplayable] = []
		items.append(BasicPropertyListItem(name: "Species", value: character.species))
		if let origin = character.origin {
			items.append(LocationItem(name: "Origin", location: origin))
		}
		if let location = character.location {
			items.append(LocationItem(name: "Location", location: location))
		}
		return items
	}
	
	func loadCharacter(completion: @escaping (Result<Bool, Error>) -> Void) {
		NetworkingManager.objectRequest(id: character.id) { [weak self] (result: ObjectResult<Character>) in
			switch result {
			case .success(let objectResponse):
				self?.character = objectResponse.object
				completion(.success(true))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
}
