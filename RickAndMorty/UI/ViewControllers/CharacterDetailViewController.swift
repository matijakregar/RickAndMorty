//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UITableViewController {
	
	@IBOutlet private var headerContainerView: UIView!
	@IBOutlet private var footerContainerView: UIView!
	@IBOutlet private var characterImageView: UIImageView!
	@IBOutlet private var characterNameLabel: UILabel!
	
	var viewModel: CharacterDetailViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		PropertyTableViewCell.register(for: tableView)
		
		headerContainerView.layer.cornerRadius = Theme.View.cornerRadius
		footerContainerView.layer.cornerRadius = Theme.View.cornerRadius
		
		tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
		
		guard let character = viewModel?.character
			else {
				return
		}
		
		characterImageView.loadImage(from: character.imageURL)
		characterNameLabel.text = character.name
		
		loadContent()
	}
	
	private func loadContent() {
		viewModel?.loadCharacter(completion: { [weak self] (result) in
			DispatchQueue.main.async {
				switch result {
				case .success:
					self?.tableView.reloadData()
				case .failure(let error):
					// TODO: Implement error message
					print("Character detail loading error: \(error)")
				}
			}
		})
	}
	
	private func isSelectable(row: Int) -> Bool {
		guard let listItem = viewModel?.propertyListItems[row]
			else {
				return false
		}
		return listItem.isSelectable
	}
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
		case Segue.showLocationDetail:
			guard let selectedRow = tableView.indexPathForSelectedRow?.row,
				let locationDetailViewController = segue.destination as? LocationDetailViewController,
				let locationItem = viewModel?.propertyListItems[selectedRow] as? LocationItem
				else {
					return
			}
			let locationDetailViewModel = LocationDetailViewModel(location: locationItem.location)
			locationDetailViewController.viewModel = locationDetailViewModel
		default:
			break
		}
	}
	
}

// MARK: - UITableViewDataSource
extension CharacterDetailViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.propertyListItems.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.reuseIdentifier, for: indexPath)
		
		if let propertyCell = cell as? PropertyTableViewCell,
			let viewModel = viewModel,
			indexPath.row < viewModel.propertyListItems.count {
			let propertyItem = viewModel.propertyListItems[indexPath.row]
			propertyCell.configure(with: propertyItem)
			propertyCell.isSelectable = isSelectable(row: indexPath.row)
		}
		
		return cell
	}
	
}

// MARK: - UITableViewDelegate
extension CharacterDetailViewController {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard isSelectable(row: indexPath.row)
			else {
				tableView.deselectRow(at: indexPath, animated: false)
				return
		}
		performSegue(withIdentifier: Segue.showLocationDetail, sender: nil)
	}
	
	override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return isSelectable(row: indexPath.row)
	}
	
}
