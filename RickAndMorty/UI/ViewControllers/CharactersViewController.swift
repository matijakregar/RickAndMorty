//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {
	
	lazy var viewModel: PagedCharactersViewModel = {
		let viewModel = PagedCharactersViewModel()
		viewModel.delegate = self
		return viewModel
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Register cell classes
		CharacterTableViewCell.register(for: tableView)
		
		viewModel.reloadData()
	}
	
	private func visibleIndexPaths(intersectingWith indexPaths: [IndexPath]) -> [IndexPath] {
		let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
		let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
		return Array(indexPathsIntersection)
	}
	
}

// MARK: - UITableViewDataSource
extension CharactersViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.totalCharactersCount
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath)
		
		if let characterCell = cell as? CharacterTableViewCell {
			if indexPath.row < viewModel.characters.count {
				characterCell.configure(with: viewModel.characters[indexPath.row])
			}
			else {
				characterCell.configure(with: .none)
			}
		}
		
		return cell
	}
	
}

// MARK: - UITableViewDelegate
extension CharactersViewController {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
}

// MARK: - UITableViewDataSourcePrefetching
extension CharactersViewController: UITableViewDataSourcePrefetching {
	
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		guard let firstRow = indexPaths.first?.row,
			let lastRow = indexPaths.last?.row
			else {
				return
		}
		if lastRow > viewModel.characters.count || firstRow > viewModel.characters.count {
			viewModel.loadNextPageIfPossible()
		}
	}
	
}

// MARK: - CharactersViewModelDelegate
extension CharactersViewController: CharactersViewModelDelegate {
	
	func viewModel(_ viewModel: CharactersViewModel, didLoadDataFor indexPaths: [IndexPath]?) {
		DispatchQueue.main.async {
			guard let indexPaths = indexPaths
				else {
					self.tableView.reloadData()
					return
			}
			
			let indexPathsToReload = self.visibleIndexPaths(intersectingWith: indexPaths)
			self.tableView.reloadRows(at: indexPathsToReload, with: .automatic)
		}
	}
	
	func viewModel(_ viewModel: CharactersViewModel, didFailLoadingWith error: Error) {
		DispatchQueue.main.async {
			// TODO: Implement error message
			print("Characters loading error: \(error)")
		}
	}
	
}
