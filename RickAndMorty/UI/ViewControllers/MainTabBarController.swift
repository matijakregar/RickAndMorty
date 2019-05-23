//
//  MainTabBarController.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	enum TabIndex: Int {
		case allCharacters
		case favoriteCharacters
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let favoritesIndex = TabIndex.favoriteCharacters.rawValue
		guard let viewControllers = viewControllers,
			viewControllers.count > favoritesIndex,
			let navigationController = viewControllers[favoritesIndex] as? UINavigationController,
			let charactersViewController = navigationController.topViewController as? CharactersViewController
			else {
				return
		}
		charactersViewController.viewModel = FavoriteCharactersViewModel()
	}
	
}
