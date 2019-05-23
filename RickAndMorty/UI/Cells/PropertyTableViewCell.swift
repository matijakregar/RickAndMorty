//
//  PropertyTableViewCell.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell, NibBackedTableViewCell {
	
	@IBOutlet private var containerView: UIView!
	@IBOutlet private var nameLabel: UILabel!
	@IBOutlet private var valueLabel: UILabel!
	@IBOutlet private var disclosureIcon: UIImageView!
	
	var isSelectable: Bool = false {
		didSet {
			disclosureIcon.isHidden = !isSelectable
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		disclosureIcon.tintColor = Theme.Colors.accent
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		nameLabel.text = ""
		valueLabel.text = ""
		setHighlighted(false, animated: false)
		isSelectable = false
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
	
	func configure(with propertyItem: PropertyListDisplayable) {
		nameLabel.text = propertyItem.name
		valueLabel.text = propertyItem.value.description
	}
	
}

