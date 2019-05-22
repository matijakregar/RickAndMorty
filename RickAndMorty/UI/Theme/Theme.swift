//
//  Theme.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

struct Theme {

	struct View {
		static let cornerRadius: CGFloat = 8.0
	}
	
	// Theme colors defined in Assets.
	struct Colors {
		static let background: UIColor = UIColor(named: "BackgroundColor")!
		static let container: UIColor = UIColor(named: "ContainerColor")!
		static let overlay: UIColor = UIColor(named: "OverlayColor")!
		
		static let accent: UIColor = UIColor(named: "AccentColor")!
		static let destructive: UIColor = UIColor(named: "DestructiveColor")!
		static let title: UIColor = UIColor(named: "TitleColor")!
		static let text: UIColor = UIColor(named: "TextColor")!
	}
	
	// Function to be called on application didFinishLaunchingWithOptions
	static func apply() {
		UINavigationBar.appearance().barTintColor = Colors.background
		UINavigationBar.appearance().tintColor = Colors.accent
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Colors.accent]
		
		UITabBar.appearance().tintColor = Colors.accent
		UITabBar.appearance().backgroundColor = Colors.background
		UITabBar.appearance().barTintColor = Colors.background
		
		UITableViewCell.appearance().backgroundColor = Colors.background
		UITableView.appearance().backgroundColor = Colors.background
		
		UIWindow.appearance().tintColor = Colors.accent
	}
	
}
