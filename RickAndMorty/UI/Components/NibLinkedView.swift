//
//  NibLinkedView.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 23/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

// A UIView subclass that links the xib view implementation to the UIView subclass.
// Make sure that xib file and UIView subclass have the same name and the UIView subclass is set as a File's owner in the xib.
class NibLinkedView: UIView {
	
	var view: UIView!
	
	// MARK: - Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
		setup()
	}
	
	// MARK: - Initial setup
	
	func setup() {
		// override in a subclass if needed
	}
	
	private func xibSetup() {
		guard let loadedView = loadViewFromXib()
			else {
				assertionFailure("View cannot be loaded from Xib. Check file names!")
				return
		}
		view = loadedView
		view.frame = self.bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(view)
	}
	
	private func loadViewFromXib() -> UIView? {
		let nibName = className
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
			else {
				return nil
		}
		return view
	}
}
