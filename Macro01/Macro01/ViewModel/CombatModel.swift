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
    @Published var endTurnButtonInteraction = true
    @Published var isPaused = false
    var timer: Timer?
    
    
    
    @Published var countdownSheet: Int = 5
    
    
    var SP = PlayerCombat(image: "jogador1", cards: [
        Card(type: .attack, name: "attack"),
        Card(type: .defense, name: "defense"),
        Card(type: .recharge, name: "recharge")
    ])
    var Raia = PlayerCombat(image: "jogador2", cards: [
        Card(type: .attack, name: "attackIara"),
        Card(type: .defense, name: "defenseIara"),
        Card(type: .recharge, name: "rechargeIara")
    ])
    
    //MARK: Difficulty instancias
    @Published var RaiaDiff = DifficultyModel(imageInitial: "mediumBlockIara", imageSillhoute: "mediumIara", imageWin: "mediumWinIara", winCard: "", selectdedLevel: false, winLevel: false)
    
    
    
    //MARK: CONTADOR
    func startCountdown() {
        
        if SP.winTurno == 3{
            self.gameEnd()
            return
        }
        else if Raia.winTurno == 3 {
            self.gameEnd()
            return
        }
        
        else if isPaused == false {
            startTimer()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if !self.isPaused {
                self.updateCountdown(timer)
                print("FUNCIONOU EBAAAA \(self.isPaused)")
            }
        }
    }
    
    //MARK: LÓGICA REGRESSIVA DO CONTADOR
    func updateCountdown(_ timer: Timer) {
        // Verifique se o contador está pausado antes de decrementá-lo
        if !isPaused {
            if countdown > 1 {
                countdown -= 1
            } else {
                timer.invalidate()
                isCountdownVisible = false
                isSheetVisible = true
                countdown = 3
            }
        }
    }
    
    //MARK: FUNCAO EM QUE O PLAYER 2 JOGA AS CARTAS - MELHORAR ISSO AQUI
    func selectedCardPlayer2() {
        
        if RaiaDiff.selectdedLevel == true {
            print("MEDIO DIFICULDADEEEEEE")
            Raia.selectedCard = self.RaiaBot()
        }

    }
    
    //MARK: QUANDO O CONTADOR ACABA
    func endTurn() {
        self.endTurnButtonInteraction = false
        isInteractionEnabled = false
        compareCardsInCenter(card1: SP.selectedCard, card2: Raia.selectedCard)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.resetTurn()
            self.incrementRound()
        }
    }
    
    //MARK: RESETANDO O CONTADOR
    func resetTurn() {
        
        self.endTurnButtonInteraction = true
        
        if RaiaDiff.selectdedLevel == true {
            print("MEDIO DIFICULDADEEEEEE JOGADOOOOR")
            self.SP.replaceSelectedCardRandomlyEasy()
            
        }
        
        isInteractionEnabled = true
        SP.selectedCard = Card(type: .empty, name: "")
        Raia.selectedCard = Card(type: .empty, name: "")
        isCountdownVisible = true
        startCountdown()
        print("MANA DO JOGADOR 2 \(Raia.mana)")
    }
    
    private func incrementRound(){
        turn += 1
    }
    
    private func gameEnd(){
        isGameEndAlertPresented = true
    }
    
    
    //AQUI ESTOU RESETANDO MEU JOGO. JÁ QUE O OBJETO NÃO É INSTANCIADO DE NOVO COM O STATEOBJECT, OS VALORES PERMANECEM. ESSA FUNÇÃO COM CERTEZA PRECISA SER MELHORADA.
    func gameReset(){
        timer?.invalidate()
        self.turn = 0
        self.countdown = 3
        self.SP.winTurno = 0
        self.Raia.winTurno = 0
        self.SP.mana = 1
        self.Raia.mana = 1
        self.SP.cards = [
            Card(type: .attack, name: "attackSaci"),
            Card(type: .defense, name: "defenseSaci"),
            Card(type: .recharge, name: "rechargeSaci")
        ]
    }
    
    //MARK: MOSTRAR O PLACAR DO JOGO
    func getScore() -> String {
        if SP.winTurno > Raia.winTurno {
            winLevel()
            return "Player 1 ganhou!"
        } else if SP.winTurno < Raia.winTurno {
            return "Player 2 ganhou!"
        } else {
            return "Empate"
        }
    }
    
    //AQUI É OQ ACONTECE SE O PLAYER1 GANHAR O LEVEL.
    
    //MELHORAR ISSO AQUI
    func winLevel(){

    }
    
    
    func compareCardsInCenter(card1: Card, card2: Card) {
        switch (card1.type, card2.type) {
        case (.attack, .attack):
            handleAttackVsAttack()
        case (.attack, .defense):
            handleAttackVsDefense()
        case (.attack, .recharge):
            handleAttackVsRecharge()
        case (.defense, .attack):
            handleDefenseVsAttack()
        case (.defense, .defense):
            handleDefenseVsDefense()
        case (.defense, .recharge):
            handleDefenseVsRecharge()
        case (.recharge, .attack):
            handleRechargeVsAttack()
        case (.recharge, .defense):
            handleRechargeVsDefense()
        case (.recharge, .recharge):
            handleRechargeVsRecharge()
        default:
            break
        }
    }
    
    
    private func handleAttackVsAttack() {
        if SP.mana >= 1 && Raia.mana >= 1 {
            player1LoseMana()
            player2LoseMana()
            print("AAAAAA INFERNOOOO")
        } else if SP.mana == 0 && Raia.mana >= 1 {
            player2LoseMana()
            //GANHA TURNO
        } else if SP.mana >= 1 && Raia.mana == 0 {
            player1LoseMana()
            //GANHA TURNO
        } else {
            print("ATAQUE E ATAQUE SEM MANA OS DOIS NADA ACONTECE")
        }
    }
    
    private func handleAttackVsDefense() {
        if SP.mana >= 1 {
            player1LoseMana()
        } else {
            print("ATACOU SEM MANA. NADA ACONTECE")
        }
    }
    
    private func handleAttackVsRecharge() {
        if SP.mana >= 1 {
            player1Win()
        } else {
            player2RechargeMana()
        }
    }
    
    private func handleDefenseVsAttack() {
        if Raia.mana >= 1 {
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
        if Raia.mana >= 1 {
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
        SP.mana -= 1
    }
    private func player2LoseMana() {
        Raia.mana -= 1
    }
    
    private func player1Win() {
        SP.winTurno += 1
        SP.mana = 1
        Raia.mana = 1
    }
    private func player2Win() {
        Raia.winTurno += 1
        Raia.mana = 1
        SP.mana = 1
    }
    
    private func player1RechargeMana() {
        SP.mana += 1
    }
    private func player2RechargeMana() {
        Raia.mana += 1
    }
    
    
    //MARK: LÓGICA BOT Raia
    
    func RaiaBot() -> Card {
        switch Raia.mana {
            // se o mana for 0
        case 0:
            return noManaRaia()
            //se o mana for 1
        case 1:
            return withManaRaia()
        case 2:
            return twoManaRaia()
        default:
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func noManaRaia() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.7 { // 70% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else { // 30% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func withManaRaia() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.4 { // 40% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else if randomValue < 0.6 { // 20% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 40% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func twoManaRaia() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.6 { // 60% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 40% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
}








