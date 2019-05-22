//
//  Constants.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

struct Constants {
	
	struct Networking {
		
		static let timeout = TimeInterval(30)
		
		static let baseURL = URL(string: "https://rickandmortyapi.com")!
		
		struct Cache {
			
			static let interval = TimeInterval(60 * 60)
			static let policy = URLRequest.CachePolicy.useProtocolCachePolicy
			static let memorySize = 50 * 1024 * 1024
			static let diskSize = 200 * 1024 * 1024
			
		}
		
	}
	
	struct UserDefaults {
		
		struct Key {
			static let favoriteCharacters = "favoriteCharacters"
		}
		
	}
	
}
