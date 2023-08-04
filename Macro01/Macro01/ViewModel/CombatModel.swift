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
    @Published var isPaused = false
    var timer: Timer?
    
    
    
    @Published var countdownSheet: Int = 5
    
    
    
    //    var cards = Cards()
    
    var player1 = PlayerCombat(image: "jogador1", cards: [
        Card(type: .attack, name: "attack"),
        Card(type: .defense, name: "defense"),
        Card(type: .recharge, name: "recharge")
    ])
    var player2 = PlayerCombat(image: "jogador2", cards: [
        Card(type: .attack, name: "attackIara"),
        Card(type: .defense, name: "defenseIara"),
        Card(type: .recharge, name: "rechargeIara")
    ])
    
    //MARK: Difficulty instancias
    @Published var easyDiff = DifficultyModel(imageInitial: "", imageSillhoute: "facil", imageWin: "easyWin", winCard: "", selectdedLevel: false, winLevel: false)
    @Published var mediumDiff = DifficultyModel(imageInitial: "mediumBlockIara", imageSillhoute: "mediumIara", imageWin: "mediumWinIara", winCard: "", selectdedLevel: false, winLevel: false)
    @Published var hardDiff = DifficultyModel(imageInitial: "", imageSillhoute: "hardBlock", imageWin: "hardWin", winCard: "", selectdedLevel: false, winLevel: false)
    
    
    
    //MARK: CONTADOR
    func startCountdown() {
        
        if player1.winTurno == 3{
            self.gameEnd()
            return
        }
        else if player2.winTurno == 3 {
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
        if easyDiff.selectdedLevel == true {
            print("FACILLLL DIFICULDADE")
            player2.selectedCard = self.playCardEasyBot()
        }
        
        if mediumDiff.selectdedLevel == true {
            print("MEDIO DIFICULDADEEEEEE")
            player2.selectedCard = self.playCardMediumBot()
        }
        
        if hardDiff.selectdedLevel == true {
            print("DIFICIL DIFICUDADEEEE")
            player2.selectedCard = self.playCardHardBot()
        }
    }
    
    //MARK: QUANDO O CONTADOR ACABA
    func endTurn() {
        isInteractionEnabled = false
        compareCardsInCenter(card1: player1.selectedCard, card2: player2.selectedCard)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.resetTurn()
            self.incrementRound()
        }
    }
    
    //MARK: RESETANDO O CONTADOR
    func resetTurn() {
        //        self.player1.replaceSelectedCardRandomly()// essa função substitui a carta que o jogador joga
        //MELHORAR ISSO AQUI
        if easyDiff.selectdedLevel == true {
            print("FACILLLL DIFICULDADE JOGADOR")
            self.player1.replaceSelectedCardRandomlyEasy()
        }
        
        if mediumDiff.selectdedLevel == true {
            print("MEDIO DIFICULDADEEEEEE JOGADOOOOR")
            self.player1.replaceSelectedCardRandomlyEasy()
            
        }
        
        if hardDiff.selectdedLevel == true {
            print("DIFICIL DIFICUDADEEEE JOGADOOOOR")
            self.player1.replaceSelectedCardRandomlyHard()
            
        }
        
        isInteractionEnabled = true
        player1.selectedCard = Card(type: .empty, name: "")
        player2.selectedCard = Card(type: .empty, name: "")
        isCountdownVisible = true
        startCountdown()
        print("MANA DO JOGADOR 2 \(player2.mana)")
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
        self.player1.winTurno = 0
        self.player2.winTurno = 0
        self.player1.mana = 1
        self.player2.mana = 1
        self.player1.cards = [
            Card(type: .attack, name: "attackSaci"),
            Card(type: .defense, name: "defenseSaci"),
            Card(type: .recharge, name: "rechargeSaci")
        ]
    }
    
    //MARK: MOSTRAR O PLACAR DO JOGO
    func getScore() -> String {
        if player1.winTurno > player2.winTurno {
            winLevel()
            return "Player 1 ganhou!"
        } else if player1.winTurno < player2.winTurno {
            return "Player 2 ganhou!"
        } else {
            return "Empate"
        }
    }
    
    //AQUI É OQ ACONTECE SE O PLAYER1 GANHAR O LEVEL.
    
    //MELHORAR ISSO AQUI
    func winLevel(){
        if easyDiff.selectdedLevel == true{
            easyDiff.winLevel = true
            //Aqui também ele receberia a carta que será mostrada na galeria
        }
        if mediumDiff.selectdedLevel == true{
            mediumDiff.winLevel = true
        }
        if hardDiff.selectdedLevel == true{
            hardDiff.winLevel = true
        }
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
        player1.mana = 1
        player2.mana = 1
    }
    private func player2Win() {
        player2.winTurno += 1
        player2.mana = 1
        player1.mana = 1
    }
    
    private func player1RechargeMana() {
        player1.mana += 1
    }
    private func player2RechargeMana() {
        player2.mana += 1
    }
    
    
    //MARK: LOGICA BOT FACIL
    
    //MARK: LOGICA BOT: PODE SER USADA COM ESQUELETO PARA AS OUTROS NIVEIS
    func playCardEasyBot() -> Card {
        switch player2.mana {
            //se o mana for 0
        case 0:
            return noManaEasyBot()
            //se o mana for 1
        case 1:
            return withManaEasyBot()
            //se o mana for 2
        case 2:
            return twoManasEasyBot()
            //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func noManaEasyBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.9 { // 90% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else { // 10% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func withManaEasyBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.6 { // 60% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else if randomValue < 0.8 { // 20% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 20% de chance para outros tipos de carta
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func twoManasEasyBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.8 { // 80% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 20% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    
    
    
    //MARK: LOGICA BOT HARD
    func playCardHardBot() -> Card {
        switch player2.mana {
            //se o mana for 0
        case 0:
            return noManaHardBot()
            //se o mana for 1
        case 1:
            return withManaHardBot()
            //se o mana for 2
        case 2:
            return twoManasHardBot()
            //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func noManaHardBot() -> Card {
        print("MANA DO PLAYER 1 ANTES: \(player1.mana)")
        let randomValue = Double.random(in: 0..<1)
        print("VALOR ALEATORIO: \(randomValue)")
        if player1.mana <= 1 && player1.selectedCard == Card(type: .recharge, name: "rechargeSaci") {
            if randomValue <= 0.45 {
                print("VALOR ALEATORIO: \(randomValue)")
                player1.mana = player1.mana < 1 ? 0 : 1 //se a mana for
                player1.selectedCard = Card(type: .block, name: "block") //Carta efeito nulo
                print("MANA DO PLAYER 1 DEPOIS: \(player1.mana)")
            }
        }
        if randomValue < 0.9 { // 90% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else { // 10% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func withManaHardBot() -> Card {
        print("MANA DO PLAYER 1 ANTES: \(player1.mana)")
        let randomValue = Double.random(in: 0..<1)
        print("VALOR ALEATORIO: \(randomValue)")
        if player1.mana <= 1 && player1.selectedCard == Card(type: .recharge, name: "rechargeSaci") {
            if randomValue <= 0.45 {
                print("VALOR ALEATORIO: \(randomValue)")
                player1.mana = player1.mana < 1 ? 0 : 1
                player1.selectedCard = Card(type: .block, name: "block") //Carta efeito nulo
                print("MANA DO PLAYER 1 DEPOIS: \(player1.mana)")
            }
        }
        if randomValue < 0.6 { // 60% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else if randomValue < 0.8 { // 20% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 20% de chance para outros tipos de carta
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func twoManasHardBot() -> Card {
        print("MANA DO PLAYER 1 ANTES: \(player1.mana)")
        let randomValue = Double.random(in: 0..<1)
        print("VALOR ALEATORIO: \(randomValue)")
        if player1.mana <= 1 && player1.selectedCard == Card(type: .recharge, name: "rechargeSaci"){
            if randomValue <= 0.45 {
                print("VALOR ALEATORIO: \(randomValue)")
                player1.mana = player1.mana < 1 ? 0 : 1
                player1.selectedCard = Card(type: .block, name: "block") //Carta efeito nulo
                print("MANA DO PLAYER 1 DEPOIS: \(player1.mana)")
            }
        }
        if randomValue < 0.8 { // 80% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 20% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    
    //MARK: LÓGICA BOT INTERMEDIÁRIO
    
    func playCardMediumBot() -> Card {
        switch player2.mana {
            // se o mana for 0
        case 0:
            return noManaMediumBot()
            //se o mana for 1
        case 1:
            return withManaMediumBot()
        case 2:
            return twoManaMediumBot()
        default:
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    // ...
    
    private func noManaMediumBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.7 { // 70% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else { // 30% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func withManaMediumBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.4 { // 40% de chance para recarga
            return Card(type: .recharge, name: "rechargeIara")
        } else if randomValue < 0.6 { // 20% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 40% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
    private func twoManaMediumBot() -> Card {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.6 { // 60% de chance para ataque
            return Card(type: .attack, name: "attackIara")
        } else { // 40% de chance para defesa
            return Card(type: .defense, name: "defenseIara")
        }
    }
    
}








