//
//  NSObject.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

extension NSObject {
	
	public static var className: String {
		return String(describing: self)
	}
	
	public var className: String {
		return String(describing: type(of: self))
	}
	
}
