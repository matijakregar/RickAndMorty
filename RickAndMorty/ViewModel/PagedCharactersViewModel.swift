//
//  PagedCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

class PagedCharactersViewModel: CharactersViewModel, PagedViewModel, DataReloadable {
	
	private(set) var characters = [Character]()
	private(set) var totalCharactersCount = 0
	
	let title = NSLocalizedString("All Characters", comment: "Screen title")
	let emptyListMessage = NSLocalizedString("Couldn't load any characters.", comment: "Empty list message")
	
	weak var delegate: CharactersViewModelDelegate?
	
	private var nextPage = 1
	private var currentDataTask: URLSessionDataTask?
	
	func reloadData() {
		currentDataTask?.cancel()
		nextPage = 1
		characters = [Character]()
		loadNextPageIfPossible()
	}
	
	// Loads next page if no current data task is running.
	func loadNextPageIfPossible() {
		guard currentDataTask == nil
			else {
				return
		}
		
		currentDataTask = NetworkingManager.listRequest(page: nextPage) { [weak self] (result: ListResult<Character>) in
			guard let strongSelf = self
				else {
					return
			}
			strongSelf.currentDataTask = nil
			switch result {
			case .success(let listResponse):
				// If totalCharactersCount is changed the delegate needs full reload.
				let needsFullReload = strongSelf.totalCharactersCount != listResponse.info.count
				strongSelf.nextPage = listResponse.info.nextPage ?? 1
				strongSelf.totalCharactersCount = listResponse.info.count
				
				let oldCount = strongSelf.characters.count
				let newCount = oldCount + listResponse.objects.count
				strongSelf.characters.append(contentsOf: listResponse.objects)
				
				let newIndexPaths = (oldCount...newCount).map({IndexPath(row: $0, section: 0)})
				strongSelf.delegate?.viewModel(strongSelf, didLoadDataFor: needsFullReload ? .none : newIndexPaths)
			case .failure(let error):
				strongSelf.delegate?.viewModel(strongSelf, didFailLoadingWith: error)
			}
		}
	}
}
