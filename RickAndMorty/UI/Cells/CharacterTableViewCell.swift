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
	
	private var imageDataTask: URLSessionDataTask?
	private var currentURL: URL?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		containerView.layer.cornerRadius = Theme.View.cornerRadius
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		// Cancel the previous image from getting loaded and presenting any unwanted results.
		imageDataTask?.cancel()
		nameLabel.text = ""
		speciesLabel.text = ""
		setHighlighted(false, animated: false)
	}
	
	override func setHighlighted(_ highlighted: Bool, animated: Bool) {
		containerView.backgroundColor = highlighted ? Theme.Colors.highlightedContainer : Theme.Colors.container
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {		
		setHighlighted(selected, animated: animated)
	}
	
	func configure(with character: CharacterListDisplayable?) {
		if let character = character {
			nameLabel.text = character.name
			speciesLabel.text = character.species
			
			// TODO: check if this can be solved nicely
			// An ugly hack to prevent blinking images
			if currentURL != character.imageURL {
				characterImageView.image = nil
				imageDataTask = characterImageView.loadImage(from: character.imageURL)
				currentURL = character.imageURL
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

