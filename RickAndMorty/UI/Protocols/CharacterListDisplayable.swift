//
//  CharacterListDisplayable.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol CharacterListDisplayable {
	
	var name: String { get }
	var species: String { get }
	var imageURL: URL { get }
	
}
