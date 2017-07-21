//
//  JsonHelper.swift
//  VeetoApp
//
//  Created by IFCE on 20/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import Foundation


class JsonHelper {
	public func readJson() -> Dictionary<Int, Card> {
		
		do {
			if let file = Bundle.main.url(forResource: "veetoCards", withExtension: "json") {
				let data = try Data(contentsOf: file)
				//let json = try JSONSerialization.jsonObject(with: data, options: [])
				let jsonString = String(data: data, encoding: .utf8)
				//print(jsonString)
				
				if let cards = [Card].deserialize(from: jsonString) {
					var dicCards = Dictionary<Int, Card>()
					
					dicCards = Dictionary(keyValuePairs : cards.filter{$0 != nil}.map{($0!.id!, $0!)})
					
					return dicCards
					//print(dicCards)
				}
				
				
				//let cards = Dictionary<String, Card>()
				
				
			} else {
				print("no file")
			}
		} catch {
			print(error.localizedDescription)
			
		}
		
		return [Int : Card]()
	}
}





extension Dictionary {
	public init(keyValuePairs: [(Key, Value)]) {
		self.init()
		for pair in keyValuePairs {
			self[pair.0] = pair.1
		}
	}
}
