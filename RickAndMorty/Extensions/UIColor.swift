//
//  UIColor.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import UIKit

extension UIColor {
	
	public convenience init?(hex: String) {
		let r, g, b, a: CGFloat
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			var hexColor = String(hex[start...])
			
			if hexColor.count == 6 {
				hexColor.append("ff")
			}
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}
		
		return nil
	}
	
	var redValue: CGFloat {
		return CIColor(color: self).red
	}
	var greenValue: CGFloat {
		return CIColor(color: self).green
	}
	var blueValue: CGFloat {
		return CIColor(color: self).blue
	}
	var alphaValue: CGFloat {
		return CIColor(color: self).alpha
	}
	
	func overlay(with overlayColor: UIColor) -> UIColor {
		guard self != .clear
			else {
				return .clear
		}
		
		let alpha = 1 - (1 - overlayColor.alphaValue) * (1 - alphaValue)
		let red = ((overlayColor.redValue * overlayColor.alphaValue) / alpha) + (redValue * alphaValue * (1 - overlayColor.alphaValue) / alpha)
		let green = ((overlayColor.greenValue * overlayColor.alphaValue) / alpha) + (greenValue * alphaValue * (1 - overlayColor.alphaValue) / alpha)
		let blue = ((overlayColor.blueValue * overlayColor.alphaValue) / alpha) + (blueValue * alphaValue * (1 - overlayColor.alphaValue) / alpha)
		return UIColor(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	var darkened: UIColor {
		// Overlay 20% black.
		return self.overlay(with: UIColor(white: 0.0, alpha: 0.20))
	}
	
	var lightened: UIColor {
		// Overlay 20% white.
		return self.overlay(with: UIColor(white: 1.0, alpha: 0.20))
	}
	
}
