//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell, NibBackedTableViewCell {
	
	@IBOutlet private var containerView: UIView!
	@IBOutlet private var characterImageView: UIImageView!
	@IBOutlet private var nameLabel: UILabel!
	@IBOutlet private var speciesLabel: UILabel!
	@IBOutlet private var loadingIndicator: UIActivityIndicatorView!
	
	private var imageDataTask: URLSessionDataTask? {
		didSet {
			oldValue?.cancel()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		containerView.layer.cornerRadius = Theme.View.cornerRadius
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		// Cancel the previous image from getting loaded and presenting any unwanted results.
		imageDataTask?.suspend()
		nameLabel.text = ""
		speciesLabel.text = ""
		setHighlighted(false, animated: false)
	}
	
	override func setHighlighted(_ highlighted: Bool, animated: Bool) {
		let color = highlighted ? Theme.Colors.highlightedContainer : Theme.Colors.container
		if animated {
			UIView.animate(withDuration: .shortAnimation) {
				self.containerView.backgroundColor = color
			}
		}
		else {
			containerView.backgroundColor = color
		}
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {		
		setHighlighted(selected, animated: animated)
	}
	
	func configure(with character: CharacterListDisplayable?) {
		if let character = character {
			nameLabel.text = character.name
			speciesLabel.text = character.species
			
			if imageDataTask?.state == .suspended,
				imageDataTask?.currentRequest?.url == character.imageURL {
				imageDataTask?.resume()
			}
			else {
				characterImageView.image = nil
				imageDataTask = characterImageView.loadImage(from: character.imageURL)
			}
			containerView.fadeIn()
			loadingIndicator.stopAnimating()
		}
		else {
			containerView.alpha = 0
			loadingIndicator.startAnimating()
		}
	}
	
}

