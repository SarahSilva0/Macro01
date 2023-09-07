//
//  SoundManager.swift
//  Macro01
//
//  Created by Julia Mendes on 01/09/23.
//

import SwiftUI
import AVFoundation

class SoundManager: ObservableObject {
    
    static let instance = SoundManager()

    @AppStorage("isPlaying") var isAudioPlaying: Bool = false
    
    var bgm: AVAudioPlayer?
    var buttonbgm: AVAudioPlayer?
    
    enum BGMOptions: String{
        case botoSong
        case cucaSong
        case iaraSong
        case lobbyMusic
        case tutorial
    }
    
    func buttonSound() {
        
        guard let url = Bundle.main.url(forResource: "buttonClick", withExtension: ".mp3") else { return }
        
        do {
            buttonbgm = try AVAudioPlayer(contentsOf: url)
            if !isAudioPlaying {
                buttonbgm?.play()
            }
        } catch let error {
            print("Erro, não tá tocando. \(error.localizedDescription)")
        }
    }
    
    
    func playSound(music: BGMOptions) {
        
        guard let url = Bundle.main.url(forResource: music.rawValue, withExtension: ".mp3") else { return }
        
        do {
            bgm = try AVAudioPlayer(contentsOf: url)
            bgm?.numberOfLoops = .infinity
            
            if !isAudioPlaying {
                bgm?.play()
            }
        } catch let error {
            print("Erro, não tá tocando. \(error.localizedDescription)")
        }
    }
    
    func stopMusic() {
        if isAudioPlaying {
            self.bgm?.pause()
            self.buttonbgm?.pause()
        }
        else {
            self.bgm?.play()
            self.buttonbgm?.play()
        }
    }
}

extension Int {
    static var infinity = -1
}
