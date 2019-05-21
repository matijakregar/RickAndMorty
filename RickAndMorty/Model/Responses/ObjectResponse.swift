//
//  ObjectResponse.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 21/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

// A struct that decodes the response of wrapped generic object.
struct ObjectResponse<ObjectType: Decodable & Queryable>: Decodable {
	
	let object: ObjectType
	
	enum ContainerKeys: String, CodingKey {
		case data
	}
	
	enum ObjectKeys: String, CodingKey {
		case object
		
		var stringValue: String {
			return ObjectType.objectKey
		}
	}
	
	init(from decoder: Decoder) throws {
		let dataContainer = try decoder.container(keyedBy: ContainerKeys.self)
		let objectContainer = try dataContainer.nestedContainer(keyedBy: ObjectKeys.self, forKey: .data)
		self.object = try objectContainer.decode(ObjectType.self, forKey: .object)
	}
	
}

