//
//  CharactersViewModelDelegate.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol CharactersViewModelDelegate: class {

	func viewModel(_ viewModel: CharactersViewModel, didLoadDataFor indexPaths: [IndexPath]?)
	func viewModel(_ viewModel: CharactersViewModel, didFailLoadingWith error: Error)
	
}
