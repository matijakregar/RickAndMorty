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
		static let highlightedContainer: UIColor = container.lightened
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
		
		RoundedButton.appearance().titleFont = UIFont.preferredFont(forTextStyle: .headline)
		RoundedButton.appearance().backgroundColor = Colors.accent
		RoundedButton.appearance().textColor = Colors.background
		RoundedButton.appearance().cornerRadius = NSNumber(floatLiteral: 8.0)
		RoundedButton.appearance().contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
	}
	
}
