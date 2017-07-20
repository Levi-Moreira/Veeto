//
//  CardProvider.swift
//  VeetoApp
//
//  Created by IFCE on 20/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import Foundation

class CardProvider {
	
	private var words = [Int : Card]()
	
	private var playedCardsId = [Int]()
	
	private let cardsNumber = 100
	
	private var correctCards = [Int]()
	
	private var wrongCards = [Int]()
	
	private var currentCard : Card?
	
	
	static let sharedInstance: CardProvider = {
		let instance = CardProvider()
		return instance
	}()
	
	init() {
		words = JsonHelper().readJson()
	}
	
	
	func restoreProvider(){
		correctCards.removeAll()
		wrongCards.removeAll()
	}
	
	func provideCard() -> Card{
		var randomNum : UInt32 = arc4random_uniform(100) + 1 // range is 0 to 99
		
		if playedCardsId.count > 70{
			playedCardsId.removeAll()
		}
		
		while playedCardsId.contains(Int(randomNum)) {
			randomNum = arc4random_uniform(100) + 1
		}
		
		if let card = words[Int(randomNum)]{
			currentCard = card
			playedCardsId.append(Int(randomNum))
			return card
		}
		
		return Card()
	}
	
	func passCard(){
		
		if let card = currentCard{
			if let id = card.id{
				wrongCards.append(id)
			}
		}
	}
	
	func correctCard(){
		if let card = currentCard{
			if let id = card.id{
				correctCards.append(id)
			}
		}
	}
	
	
}
