//
//  ListResponse.swift
//  RickAndMorty
//
//  Created by Matija Kregar on 20/05/2019.
//  Copyright © 2019 Matija Kregar. All rights reserved.
//

import Foundation

// A struct that decodes the response of wrapped list of generic objects.
struct ListResponse<ObjectType: Decodable & Queryable>: Decodable {
	
	let info: Info
	let objects: [ObjectType]
	
	enum ContainerKeys: String, CodingKey {
		case data
	}
	
	enum ListKeys: String, CodingKey {
		case list
		
		var stringValue: String {
			return ObjectType.listKey
		}
	}
	
	enum ObjectKeys: String, CodingKey {
		case info
		case objects = "results"
	}
	
	init(from decoder: Decoder) throws {
		let dataContainer = try decoder.container(keyedBy: ContainerKeys.self)
		let listContainer = try dataContainer.nestedContainer(keyedBy: ListKeys.self, forKey: .data)
		let objectContainer = try listContainer.nestedContainer(keyedBy: ObjectKeys.self, forKey: .list)
		self.info = try objectContainer.decode(Info.self, forKey: .info)
		self.objects = try objectContainer.decode([ObjectType].self, forKey: .objects)
	}
	
}
