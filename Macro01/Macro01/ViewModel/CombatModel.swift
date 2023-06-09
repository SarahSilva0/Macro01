// CombatModel.swift
import Foundation

//MARK: MODEL DO COMBATE
class CombatViewModel: ObservableObject {
    
    @Published var countdown: Int = 3
    @Published var turn: Int = 1
    @Published var isCountdownVisible = true
    @Published var isSheetVisible = false
    @Published var isInteractionEnabled = true
    @Published var isGameEndAlertPresented = false

    
    var cards = Cards()
    var player1 = PlayerCombat(image: "jogador1")
    var player2 = PlayerCombat(image: "jogador2")
    
    //MARK: CONTADOR
    func startCountdown() {
        if turn > 5 {
            self.gameEnd()
            return
        }
        else{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.updateCountdown(timer)
            }
        }
    }
    
    //MARK: LÓGICA REGRESSIVA DO CONTADOR
    func updateCountdown(_ timer: Timer) {
        if countdown > 1 {
            countdown -= 1
        } else {
            timer.invalidate()
            openSheetView()
        }
    }
    
    func openSheetView() {
        isSheetVisible = true
    }

    func countdownVisible() {
        isCountdownVisible = false
    }
    
    func selectedCardPlayer2() {
        player2.selectedCard = self.player2.playCard()
    }
    
    
    
    //MARK: QUANDO O CONTADOR ACABA
    func endTurn() {
        
        isSheetVisible = false
        isInteractionEnabled = false
        compareCardsInCenter(card1: player1.selectedCard, card2: player2.selectedCard)
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.resetTurn()
            self.incrementRound()
        }
    }
    
    //MARK: RESETANDO O CONTADOR
    func resetTurn() {
        isInteractionEnabled = true
        player1.replaceSelectedCardRandomly()
        player1.selectedCard = ""
        countdown = 3 //Contagem regressiva a partir do 3
        isCountdownVisible = true
        startCountdown()
    }
    
    private func incrementRound(){
        turn += 1
    }
    
    private func gameEnd(){
        isGameEndAlertPresented = true
    }
    
    //MARK: MOSTRAR O PLACAR DO JOGO
    func getScore() -> String {
        if player1.winTurno > player2.winTurno {
            return "Player 1 ganhou!"
        } else if player1.winTurno < player2.winTurno {
            return "Player 2 ganhou!"
        } else {
            return "Empate"
        }
    }
    
    
    //MARK: REFATORAR ISSO AQUI E COLOCAR EM UM OUTRO ARQUIVO DAQUI ATÉ....
    
    func compareCardsInCenter(card1: String, card2: String) {
        switch (card1, card2) {
        case (cards.attack, cards.attack):
            handleAttackVsAttack()
        case (cards.attack, cards.defense):
            handleAttackVsDefense()
        case (cards.attack, cards.recharge):
            handleAttackVsRecharge()
        case (cards.defense, cards.attack):
            handleDefenseVsAttack()
        case (cards.defense, cards.defense):
            handleDefenseVsDefense()
        case (cards.defense, cards.recharge):
            handleDefenseVsRecharge()
        case (cards.recharge, cards.attack):
            handleRechargeVsAttack()
        case (cards.recharge, cards.defense):
            handleRechargeVsDefense()
        case (cards.recharge, cards.recharge):
            handleRechargeVsRecharge()
        default:
            break
        }
    }
    
    private func handleAttackVsAttack() {
        if player1.mana >= 1 && player2.mana >= 1 {
            player1LoseMana()
            player2LoseMana()
            print("AAAAAA INFERNOOOO")
        } else if player1.mana == 0 && player2.mana >= 1 {
            player2LoseMana()
            //GANHA TURNO
        } else if player1.mana >= 1 && player2.mana == 0 {
            player1LoseMana()
            //GANHA TURNO
        } else {
            print("ATAQUE E ATAQUE SEM MANA OS DOIS NADA ACONTECE")
        }
    }
    
    private func handleAttackVsDefense() {
        if player1.mana >= 1 {
            player1LoseMana()
        } else {
            print("ATACOU SEM MANA. NADA ACONTECE")
        }
    }
    
    private func handleAttackVsRecharge() {
        if player1.mana >= 1 {
            player1Win()
        } else {
            player2RechargeMana()
        }
    }
    
    private func handleDefenseVsAttack() {
        if player2.mana >= 1 {
            player2LoseMana()
        }
    }
    
    private func handleDefenseVsDefense() {
        print("NADA ACONTECE OS DOIS DEFENDERAM")
    }
    
    private func handleDefenseVsRecharge() {
        player2RechargeMana()
    }
    
    private func handleRechargeVsAttack() {
        if player2.mana >= 1 {
            player2Win()
        } else {
            player1RechargeMana()
        }
    }
    
    private func handleRechargeVsDefense() {
        player1RechargeMana()
    }
    
    private func handleRechargeVsRecharge() {
        player1RechargeMana()
        player2RechargeMana()
    }
    
    
    private func player1LoseMana() {
        player1.mana -= 1
    }
    private func player2LoseMana() {
        player2.mana -= 1
    }
    
    private func player1Win() {
        player1.winTurno += 1
        player1.mana = 0
        player2.mana = 0
    }
    private func player2Win() {
        player2.winTurno += 1
        player2.mana = 0
        player1.mana = 0
    }
    
    private func player1RechargeMana() {
        player1.mana += 1
    }
    private func player2RechargeMana() {
        player2.mana += 1
    }
}

//MARK: ATÉ AQUI. SERÁ MELHOR SE ESSE BLOCO TODO DE CÓDIGO IR PARA OUTRA VIEW







