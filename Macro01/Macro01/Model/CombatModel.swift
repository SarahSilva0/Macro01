// CombatModel.swift
import Foundation

class CombatViewModel: ObservableObject {
    
    @Published var selectedCard: String = ""
    @Published var selectedCard2: String = ""
   
    @Published var countdown: Int = 5
    @Published var isCountdownVisible = true
    @Published var isSheetVisible = false
    @Published var isInteractionEnabled = true
    
  
    
    var cards = Cards()
    var player1 = PlayerCombat(image: "jogador1")
    var player2 = PlayerCombat(image: "jogador2")
    
    //Variável do contador
    @Published var round: Int =  1
    //Variável que controla a exibicao do alerta
    @Published var isGameEndAlertPresented = false
    
    @Published var result = false
    
    
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.countdown > 0 {
                self.countdown -= 1
            } else {
                timer.invalidate()
                self.selectedCard2 = self.cards.randomCard()
                print(self.selectedCard2)
                self.isSheetVisible = false
                self.isInteractionEnabled = false
                self.isCountdownVisible = false
                self.compareCardsInCenter(card1: self.selectedCard, card2: self.selectedCard2)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isInteractionEnabled = true
                    self.selectedCard = ""
                    self.countdown = 5
                    self.isCountdownVisible = true
                    self.checkGameEnd() //verifica se tem 5 round e chama o final
                    self.incrementRound() // Chama função para incrementar o round
                    self.startCountdown()
                    
                }
            }
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
    
    func handleAttackVsAttack() {
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
    
    func handleAttackVsDefense() {
        if player1.mana >= 1 {
            player1LoseMana()
        } else {
            print("ATACOU SEM MANA. NADA ACONTECE")
        }
    }
    
    func handleAttackVsRecharge() {
        if player1.mana >= 1 {
            player1Win()
        } else {
            player2RechargeMana()
        }
    }
    
    func handleDefenseVsAttack() {
        if player2.mana >= 1 {
            player2LoseMana()
        }
    }
    
    func handleDefenseVsDefense() {
        print("NADA ACONTECE OS DOIS DEFENDERAM")
    }
    
    func handleDefenseVsRecharge() {
        player2RechargeMana()
    }
    
    func handleRechargeVsAttack() {
        if player2.mana >= 1 {
            player2Win()
        } else {
            player1RechargeMana()
        }
    }
    
    func handleRechargeVsDefense() {
        player1RechargeMana()
    }
    
    func handleRechargeVsRecharge() {
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
    }
    private func player2Win() {
        player2.winTurno += 1
    }
    
    private func player1RechargeMana() {
        player1.mana += 1
    }
    private func player2RechargeMana() {
        player2.mana += 1
    }
    
    
    // Incrementa a variável round em 1
    func incrementRound() {
        round += 1
    }
    
    //Verifica se chegou no final dos rounds e chama aviso
    func checkGameEnd() {
        if round == 2 {
            isGameEndAlertPresented = true
        }
    }
    
    //Verifica o placar do jogo
    func getScore() -> String {
        if player1.winTurno > player2.winTurno {
            return "\(player2.winTurno)\nPlayer 1 ganhou!"
        } else if player1.winTurno < player2.winTurno {
            return "\(player2.winTurno)\nPlayer 2 ganhou!"
        } else {
            return "Empate"
        }
    }


    
    
    
}

//MARK: ATÉ AQUI. SERÁ MELHOR SE ESSE BLOCO TODO DE CÓDIGO IR PARA OUTRA VIEW

class PlayerCombat: ObservableObject {
    var image: String
    var winTurno = 0
    @Published var mana: Int = 1
    @Published var cards: [String]
    
    init(image: String, mana: Int = 1, cards: [String] = ["attack", "defense", "recharge"]) {
        self.image = image
        self.mana = mana
        self.cards = cards
    }
}

struct Cards {
    let defense = "defense"
    let attack = "attack"
    let recharge = "recharge"
    
    func randomCard() -> String {
        let randomIndex = Int.random(in: 0..<3)
        switch randomIndex {
        case 0:
            return attack
        case 1:
            return defense
        case 2:
            return recharge
        default:
            return ""
        }
    }
}
