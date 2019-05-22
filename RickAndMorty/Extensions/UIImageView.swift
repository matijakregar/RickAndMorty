//
//  UIImageView.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

// An extension of UIImageView for asynchronous loading of images.
extension UIImageView {
	
	// Load an image from a URL with an optional placeholder.
	// Return a data task object so we can cancel the loading if needed.
	@discardableResult
	func loadImage(from url: URL, placeholder: UIImage? = nil, completion: ((Result<UIImage, Error>) -> Void)? = nil) -> URLSessionDataTask? {
		self.image = placeholder
		
		return NetworkingManager.request(for: url) { result in
			// Verify that the image data is valid.
			guard case .success(let value) = result,
				let data = value,
				let newImage = UIImage(data: data)
				else {
					completion?(.failure(NetworkingError.corruptData))
					return
			}
			
			// Since we're updating the UI after this point, run this on the main queue.
			DispatchQueue.main.async {
				UIView.transition(with: self,
													duration: .shortAnimation,
													options: .transitionCrossDissolve,
													animations: {
														self.image = newImage
				},
													completion: { _ in
														completion?(.success(newImage))
				})
			}
		}
	}
	
}


