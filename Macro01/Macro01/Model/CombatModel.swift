// CombatModel.swift
import Foundation

//MARK: MODEL DO COMBATE
class CombatViewModel: ObservableObject {
    
    @Published var countdown: Int = 5
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
        
        if turn > 5{
            self.gameEnd()
            return
        }
        else{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.updateCountdown(timer)
            }
        }
    }
    
    //MARK: LÓGICA CONTADOR
    private func updateCountdown(_ timer: Timer) {
        if countdown > 0 {
            countdown -= 1
        } else {
            timer.invalidate()
            endTurn()
        }
    }
    
    //MARK: QUANDO O CONTADOR ACABA
    private func endTurn() {
        player2.selectedCard = self.player2.playCard()
        isSheetVisible = false
        isInteractionEnabled = false
        isCountdownVisible = false
        
        compareCardsInCenter(card1: player1.selectedCard, card2: player2.selectedCard)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.resetTurn()
            self.incrementRound()
        }
    }
    
    //MARK: RESETANDO O CONTADOR
    private func resetTurn() {
        isInteractionEnabled = true
        player1.replaceSelectedCardRandomly()
        player1.selectedCard = ""
        countdown = 5
        isCountdownVisible = true
        startCountdown()
    }
    
    private func incrementRound(){
        turn += 1
    }
    
    func gameEnd(){
        isGameEndAlertPresented = true
    }
    
    //Verifica o placar do jogo
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


//MARK: MODEL JOGADOR
class PlayerCombat: ObservableObject {
    var image: String
    var winTurno = 0
    @Published var mana: Int = 1
    @Published var cards: [String]
    @Published var selectedCard = ""
    
    
    init(image: String, mana: Int = 1, cards: [String] = ["attack", "defense", "recharge"], selectedCard: String = "") {
        self.image = image
        self.mana = mana
        self.cards = cards
        self.selectedCard = selectedCard
    }
    
    //MARK: FUNCAO QUE PEGA CARTA SELECIONADA E SUBSTITUI ELA
    //MARK: MELHORAR AQUI DEPOIS
    func replaceSelectedCardRandomly() {
        let index = cards.firstIndex(of: selectedCard)
        guard let currentIndex = index else { return }
        
        let cardsInstance = Cards()
        let newCard = cardsInstance.randomCard() // Usando a função randomCard() na instância de Cards
        cards[currentIndex] = newCard
        selectedCard = newCard
    }
    
    
    //MARK: LOGICA BOT:
    func playCard() -> String{
        switch self.mana {
            //se o mana for 0
        case 0:
            return noMana()
            //se o mana for 1
        case 1:
            return withMana()
            //se o mana for 2
        case 2:
            return twoManas()
            //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Cards().defense
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManas() -> String {
        let randomIndex = Int.random(in: 0..<2)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().attack
        default:
            return Cards().defense
        }
    }
    
    //Sem mana não ataca. Somente defende ou recarga.
    private func noMana() -> String {
        let randomIndex = Int.random(in: 0..<2)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().recharge
        default:
            return Cards().defense
        }
    }
    
    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withMana() -> String {
        let randomIndex = Int.random(in: 0..<3)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().recharge
        case 2:
            return Cards().attack
        default:
            return Cards().defense
        }
    }
}

//MARK: MODEL CARDS COM A LOGICA DA ALEATORIEDADE 
struct Cards {
    let defense = "defense"
    let attack = "attack"
    let recharge = "recharge"
    
    func randomCard() -> String {
        let randomValue = Double.random(in: 0..<1)
        
        if randomValue < 0.4 { // 40% de chance para ataque
            return attack
        } else if randomValue < 0.7 { // 30% de chance para recarga
            return recharge
        } else { // 25% de chance para defesa
            return defense
        }
    }
}


