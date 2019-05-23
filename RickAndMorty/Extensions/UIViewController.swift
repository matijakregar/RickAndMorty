//
//  UIViewController.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 23/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func showAlert(for error: Error) {
		let alertController = UIAlertController(
			title: NSLocalizedString("Error", comment: "Error message title"),
			message: error.localizedDescription,
			preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Alert action title"), style: .cancel, handler: { _ in
			alertController.dismiss(animated: true, completion: nil)
		}))
		present(alertController, animated: true, completion: nil)
	}
	
		@discardableResult
	func showActivityIndicator(backgroundColor: UIColor? = Theme.Colors.activityCover, animated: Bool = false, completion: (() -> Void)? = nil) -> UIView? {
			guard view.subviews.filter({ $0 is ActivityIndicatorView }).count == 0
				else {
					return nil
			}
	
			let activityIndicatorView = ActivityIndicatorView(frame: view.bounds)
			activityIndicatorView.alpha = 0
			view.addSubview(activityIndicatorView)
	
			if let backgroundColor = backgroundColor {
				activityIndicatorView.backgroundColor = backgroundColor
			}
			else {
				activityIndicatorView.backgroundColor = view.backgroundColor?.withAlphaComponent(0.8)
			}
	
			activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
			
			if animated {
				activityIndicatorView.fadeIn(completion: { _ in
					completion?()
				})
			}
			else {
				activityIndicatorView.alpha = 1.0
				completion?()
			}
	
			return activityIndicatorView
		}
	
		func hideActivityIndicator(completion: (() -> Void)? = nil) {
			view.subviews.filter({ $0 is ActivityIndicatorView }).forEach { subview in
				subview.fadeOut(completion: { _ in
					subview.removeFromSuperview()
				})
			}
	
			completion?()
		}
	
}
