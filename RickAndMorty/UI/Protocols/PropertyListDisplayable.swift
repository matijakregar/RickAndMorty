//
//  PropertyListDisplayable.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 22/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

protocol PropertyListDisplayable {
	
	var name: String { get }
	var value: CustomStringConvertible { get }
	
}
