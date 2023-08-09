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
    
    //MARK: CRIANDO OS JOGADORES (ESSA IMAGEM, PODE SER MUDADA DEPOIS)
    var player1 = PlayerCombat(image: "jogador1", name: "")
    var player2 = PlayerCombat(image: "jogador2", name: "")
    
    //MARK: Difficulty instancias
    @Published var RaiaDiff = DifficultyModel(imageInitial: "mediumBlockIara", imageSillhoute: "mediumIara", imageWin: "mediumWinIara", winCard: "", selectdedLevel: false, winLevel: false)
    
    //MARK: SETANDO OS JOGADORES
    func setPlayer(){
        if self.RaiaDiff.selectdedLevel == true{
            player1.name = "Saci"
            player2.name = "Iara"
            
            player1.cards = [Card(type: .attack, name: "attack\(player1.name)"), Card(type: .defense, name: "defense\(player1.name)"), Card(type: .recharge, name: "recharge\(player1.name)")]
            player2.cards = [Card(type: .attack, name: "attack\(player2.name)"), Card(type: .defense, name: "defense\(player2.name)"), Card(type: .recharge, name: "recharge\(player2.name)")]
        }
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
            print("MEDIO DIFICULDADEEEEEE")
            player2.selectedCard = player2.playerLogic(with: player2.RaiaProbabilities, for: player2.name)
        }

    }
    
    //MARK: QUANDO O CONTADOR ACABA
    func endTurn() {
        self.endTurnButtonInteraction = false
        isInteractionEnabled = false
        compareCardsInCenter(card1: player1.selectedCard, card2: player2.selectedCard)
        
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
            self.player1.replaceSelectedCardRandomly(with: player1.SPProbabilities, for: player1.name)
            
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
            Card(type: .attack, name: "attack\(player1.name)"),
            Card(type: .defense, name: "defense\(player1.name)"),
            Card(type: .recharge, name: "recharge\(player1.name)")
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
        if RaiaDiff.selectdedLevel == true{
            RaiaDiff.winLevel = true
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
    
}








