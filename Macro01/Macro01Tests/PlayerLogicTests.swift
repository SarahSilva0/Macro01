//
//  PlayerLogicTests.swift
//  Macro01Tests
//
//  Created by Sarah dos Santos Silva on 17/08/23.
//

import XCTest
@testable import Macro01

final class PlayerLogicTests: XCTestCase {
    
    var player: PlayerCombat!
    
    //MARK: TESTANDO O RETORNO DAS CARTAS ATTACK E RECHARGE TIVER 2 CARTAS NA MAO DO JOGADOR
    
    override func setUp() {
        super.setUp()
        player = PlayerCombat(image: "image", name: "Player", cards: [])
        player.mana = 2
    }
    
    func testAttackCardSelection() {
        player.cards = [
            Card(type: .attack, name: "Attack1"),
            Card(type: .attack, name: "Attack2"),
            Card(type: .defense, name: "Defense1")
        ]
        
        let selectedCard = player.playerLogic(with: player.SPProbabilities, for: "SP")
        
        XCTAssertEqual(selectedCard.type, .defense)
        XCTAssertTrue(selectedCard.name.contains("SP"))
    }
    
    func testRechargeCardSelection() {
        player.cards = [
            Card(type: .recharge, name: "Recharge1"),
            Card(type: .recharge, name: "Recharge2"),
            Card(type: .defense, name: "Defense1")
        ]
        
        let selectedCard = player.playerLogic(with: player.SPProbabilities, for: "SP")
        
        XCTAssertTrue([.attack, .defense].contains(selectedCard.type))
        XCTAssertTrue(selectedCard.name.contains("SP"))
    }
    
    func testDefenseCardSelection() {
        player.cards = [
            Card(type: .defense, name: "Defense1"),
            Card(type: .defense, name: "Defense2"),
            Card(type: .defense, name: "Defense3")
        ]
        
        let selectedCard = player.playerLogic(with: player.SPProbabilities, for: "SP")
        
        
        XCTAssertTrue([.recharge, .defense, .attack].contains(selectedCard.type))
        XCTAssertTrue(selectedCard.name.contains("SP"))
    }

}
