//
//  LocationDetailViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class LocationDetailViewModel {
	
	private(set) var location: Location
	
	init(location: Location) {
		self.location = location
	}
	
	var propertyListItems: [PropertyListDisplayable] {
		var items: [PropertyListDisplayable] = []
		if let type = location.type {
			items.append(BasicPropertyListItem(name: NSLocalizedString("Type", comment: "Location property name"), value: type))
		}
		if let dimension = location.dimension {
			items.append(BasicPropertyListItem(name: NSLocalizedString("Origin", comment: "Location property name"), value: dimension))
		}
		if let residents = location.residents {
			items.append(CharactersItem(name: NSLocalizedString("Residents", comment: "Location property name"), characters: residents))
		}
		return items
	}
	
	func loadLocation(completion: @escaping (Result<Bool, Error>) -> Void) {
		guard let id = location.id
		else {
			completion(.failure(NetworkingError.missingParameters))
			return
		}
		NetworkingManager.objectRequest(id: id) { [weak self] (result: ObjectResult<Location>) in
			switch result {
			case .success(let objectResponse):
				self?.location = objectResponse.object
				completion(.success(true))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
}

