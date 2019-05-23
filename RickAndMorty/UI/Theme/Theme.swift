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
	
	// Theme colors
	struct Colors {
		static let background: UIColor = UIColor(hex: "#20232D")!
		static let container: UIColor = UIColor(hex: "#252933")!
		static let highlightedContainer: UIColor = container.lightened
		static let overlay: UIColor = UIColor(hex: "#252933BF")!
		static let activityCover: UIColor = background.withAlphaComponent(0.75)
		
		static let accent: UIColor = UIColor(hex: "#FF9800")!
		static let destructive: UIColor = UIColor(hex: "#FF5900")!
		static let title: UIColor = UIColor(hex: "#F5F5F5")!
		static let text: UIColor = UIColor(hex: "#9E9E9E")!
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
		
		BackgroundView.appearance().backgroundColor = Theme.Colors.background
		ContainerView.appearance().backgroundColor = Theme.Colors.container
		OverlayView.appearance().backgroundColor = Theme.Colors.overlay
		TitleColoredLabel.appearance().textColor = Theme.Colors.title
		TextColoredLabel.appearance().textColor = Theme.Colors.text
		AccentColoredLabel.appearance().textColor = Theme.Colors.accent
		
	}
	
}
