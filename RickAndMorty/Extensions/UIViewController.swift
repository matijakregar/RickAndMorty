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
	
}
