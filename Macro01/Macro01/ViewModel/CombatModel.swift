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
    
    @Published var countdownSheet: Int = 5
    
    var cards = Cards()
    var player1 = PlayerCombat(image: "jogador1")
    var player2 = PlayerCombat(image: "jogador2")
    
    //MARK: Difficulty instancias
    @Published var easyDiff = DifficultyModel(imageInitial: "", imageSillhoute: "facil", imageWin: "easyWin", winCard: "", selectdedLevel: false, winLevel: false)
    
    @Published var mediumDiff = DifficultyModel(imageInitial: "", imageSillhoute: "facil", imageWin: "intermediaryWin", winCard: "", selectdedLevel: false, winLevel: false)
    
    @Published var hardDiff = DifficultyModel(imageInitial: "", imageSillhoute: "", imageWin: "", winCard: "", selectdedLevel: false, winLevel: false)
    
    
    
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
            isCountdownVisible = false
            isSheetVisible = true
            countdown = 3
            
        }
    }
    
    
    //MARK: FUNCAO EM QUE O PLAYER 2 JOGA AS CARTAS
    func selectedCardPlayer2() {
        player2.selectedCard = self.playCardEasyBot()
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
        self.player1.replaceSelectedCardRandomly()// essa função substitui a carta que o jogador joga
        isInteractionEnabled = true
        player1.selectedCard = ""
        player2.selectedCard = ""
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
        self.turn = 0
        self.countdown = 3
        self.player1.winTurno = 0
        self.player2.winTurno = 0
        self.player1.mana = 1
        self.player2.mana = 1
        self.player1.cards = ["attack", "defense", "recharge"]
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
    func winLevel() {
        if easyDiff.selectdedLevel == true {
            easyDiff.winLevel = true
            // Aqui ele receberia a carta que será mostrada na galeria
        } else if mediumDiff.selectdedLevel == true {
            mediumDiff.winLevel = true
            // Aqui ele receberia a carta que será mostrada na galeria
        }
    }
    
    
    
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
    
    
    //MARK: LOGICA BOT FACIL
    
    //MARK: LOGICA BOT: PODE SER USADA COM ESQUELETO PARA AS OUTROS NIVEIS
    func playCardEasyBot() -> String{
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
            return Cards().defense
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManasEasyBot() -> String {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.8 { // 80% de chance para ataque
            return Cards().attack
        } else { // 20% de chance para defesa
            return Cards().defense
        }
    }
    
    
    //Sem mana não ataca. Somente defende ou recarga.
    private func noManaEasyBot() -> String {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.9 { // 90% de chance para recarga
            return Cards().recharge
        } else { // 10% de chance para defesa
            return Cards().defense
        }
    }
    
    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withManaEasyBot() -> String {
        let randomValue = Double.random(in: 0..<1)
        if randomValue < 0.6 { // 60% de chance para recarga
            return Cards().recharge
        } else if randomValue < 0.8 { // 20% de chance para ataque
            return Cards().attack
        } else { // 20% de chance para outros tipos de carta
            return Cards().defense
        }
    }
    
    //MARK: LÓGICA BOT INTERMEDIÁRIO
    
        func playCardMediumBot() -> String {
            switch player2.mana {
                // se o mana for 0
            case 0:
                return  noManaMediumBot()
                //se o mana for 1
            case 1:
                return withManaMediumBot()
            case 2:
                return twoManaMediumBot()
            default:
                return Cards().defense
            }
        }
   
    
    private func twoManaMediumBot() -> String {
        let randomValue = Double.random(in: 0..<1)
        
        if randomValue < 0.6 {
            return Cards().attack
        } else {
            return Cards().defense
        }
    }
    
    private func noManaMediumBot() -> String {
        let randomValue = Double.random(in: 0..<1)
       
        if randomValue < 0.7 {
            return Cards().recharge
        } else {
            return Cards().defense
        }
    }
    
    private func withManaMediumBot() -> String {
        let randomValue = Double.random(in: 0..<1)
        
        if randomValue < 0.4 {
            return Cards().recharge
        } else if randomValue < 0.6 {
            return Cards().attack
        } else {
            return Cards().defense
        }
    }
    
}







