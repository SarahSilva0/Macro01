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
    @Published var checkWin = 0
    var timer: Timer?
    
    @Published var countdownSheet: Int = 5
    
    //MARK: CRIANDO OS JOGADORES (ESSA IMAGEM, PODE SER MUDADA DEPOIS)
    var player1 = PlayerCombat(image: "", name: "")
    var player2 = PlayerCombat(image: "", name: "")
    
    //MARK: Difficulty instancias
    @Published var RaiaDiff = DifficultyModel(imageInitial: "mediumBlockIara", imageSillhoute: "mediumIara", imageWin: "mediumWinIara", winCard: "", selectdedLevel: false, winLevel: false)
    
    @Published var BotoDiff = DifficultyModel(imageInitial: "charBlockBoto", imageSillhoute: "charBoto", imageWin: "charWinBoto", winCard: "", selectdedLevel: false, winLevel: false)
    
    @Published var CucaDiff = DifficultyModel(imageInitial: "charBlockCuca", imageSillhoute: "charCuca", imageWin: "charWinCuca", winCard: "", selectdedLevel: false, winLevel: false)
    
    //MARK: SETANDO OS JOGADORES
    func setPlayer(){
        if self.RaiaDiff.selectdedLevel == true{
            player1.name = "Saci"
            player2.name = "Iara"
        }
        
        else if self.BotoDiff.selectdedLevel == true{
            
            print("BOTOOOOO")
            
            player1.name = "Saci"
            player2.name = "Boto"

        }
        else if self.CucaDiff.selectdedLevel == true{
            print("CUCAAAAA")
            
            player1.name = "Saci"
            player2.name = "Cuca"
        }
        setCards()
    }
    
    func setCards(){
        
        player1.cards = [Card(type: .attack, name: "attack\(player1.name)"), Card(type: .defense, name: "defense\(player1.name)"), Card(type: .recharge, name: "recharge\(player1.name)")]
        player2.cards = [Card(type: .attack, name: "attack\(player2.name)"), Card(type: .defense, name: "defense\(player2.name)"), Card(type: .recharge, name: "recharge\(player2.name)")]
    }
    
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
        
        if RaiaDiff.selectdedLevel == true {
            print("RAIA DIFICULDADEEEEEE")
            player2.selectedCard = player2.playerLogic(with: player2.RaiaProbabilities, for: player2.name)
        }
        
        if BotoDiff.selectdedLevel == true{
            print("BOTO DIFICULDADDEEEEE")
            player2.selectedCard = player2.playerLogic(with: player2.RaiaProbabilities, for: player2.name)
        }
        
        if CucaDiff.selectdedLevel == true{
            print("CUCA DIFICULDADDEEEEE")
            player2.selectedCard = player2.playerLogic(with: player2.RaiaProbabilities, for: player2.name)
        }
        
    }
    
    //MARK: QUANDO O CONTADOR ACABA
    func endTurn() {
        self.endTurnButtonInteraction = false
        isInteractionEnabled = false
        
        if player1.selectedCard.name == ""{
            player1.selectedCard = Card(type: .empty, name: "empty")
        }
        
        compareCardsInCenter(card1: player1.selectedCard, card2: player2.selectedCard)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.resetTurn()
            self.incrementRound()
        }
    }
    
    //MARK: RESETANDO O CONTADOR
    func resetTurn() {
        
        self.endTurnButtonInteraction = true
        
        self.player1.replaceSelectedCardRandomly(with: player1.SPProbabilities, for: player1.name)
        
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
            Card(type: .attack, name: "attack\(player1.name)"),
            Card(type: .defense, name: "defense\(player1.name)"),
            Card(type: .recharge, name: "recharge\(player1.name)")
        ]
    }
    
    //MARK: MOSTRAR O PLACAR DO JOGO
    func getScore() -> String {
        if player1.winTurno > player2.winTurno {
            winLevel()
            return "Jogador 1 ganhou!".localizedLanguage()
        } else if player1.winTurno < player2.winTurno {
            return "Jogador 2 ganhou!".localizedLanguage()
        } else {
            return "Empate".localizedLanguage()
        }
    }
    
    //AQUI É OQ ACONTECE SE O PLAYER1 GANHAR O LEVEL.
    
    //MELHORAR ISSO AQUI
    func winLevel(){
        if RaiaDiff.selectdedLevel == true{
            RaiaDiff.winLevel = true
        }
        if BotoDiff.selectdedLevel == true{
            BotoDiff.winLevel = true
        }
        if CucaDiff.selectdedLevel == true {
            CucaDiff.winLevel = true
        }
    }
    
    
    func compareCardsInCenter(card1: Card, card2: Card) {
        switch (card1.type, card2.type) {
        case (.attack, .attack):
            handleAttackVsAttack()
            checkWin = 0
        case (.attack, .defense):
            handleAttackVsDefense()
            checkWin = 0
        case (.attack, .recharge):
            handleAttackVsRecharge()
//            checkWin = 1
        case (.defense, .attack):
            handleDefenseVsAttack()
            checkWin = 0
        case (.defense, .defense):
            handleDefenseVsDefense()
            checkWin = 0
        case (.defense, .recharge):
            handleDefenseVsRecharge()
            checkWin = 0
        case (.recharge, .attack):
            handleRechargeVsAttack()
            checkWin = 2
        case (.recharge, .defense):
            handleRechargeVsDefense()
            checkWin = 0
        case (.recharge, .recharge):
            handleRechargeVsRecharge()
            checkWin = 0
        case (.empty, .attack):
            print("vazio e ataque")
            checkWin = 2
            player2Win()
        case(.empty, .defense):
            print("vazio e defesa: Nada acontece")
            checkWin = 0
        case(.empty, .recharge):
            print("vazio e recarga")
            player2RechargeMana()
            checkWin = 0
        case(.empty, .empty):
            print("vazio e vazio: Nada acontece")
            checkWin = 0
        default:
            break
        }
    }
    
    func checkPlayerVictory() -> [String] {
        switch checkWin {
        case 0:
            return ["Empate!".localizedLanguage(), "Continue tentando!".localizedLanguage()]
        case 1:
            return ["Parabéns!".localizedLanguage(), "Você ganhou a rodada!".localizedLanguage()]
        case 2:
            return ["Cuidado!".localizedLanguage(), "Você perdeu a rodada!".localizedLanguage()]
        default:
            return ["Empate!".localizedLanguage(), "Continue tentando!".localizedLanguage()]
        }
    }
    
    func checkGameWinner() -> [String] {
        switch getScore() {
        case "Jogador 1 ganhou!".localizedLanguage():
            return ["Vitória!".localizedLanguage(), "Você venceu a partida".localizedLanguage()]
        case "Jogador 2 ganhou!".localizedLanguage():
            return ["Derrota!".localizedLanguage(), "Infelizmente não foi dessa vez.".localizedLanguage()]
        default:
            return ["Empate!".localizedLanguage(), ""]
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
            checkWin = 1
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
    
}

