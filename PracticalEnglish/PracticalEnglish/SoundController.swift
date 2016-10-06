//
//  SoundController.swift
//  EmotivApp
//
//  Created by biga on 9/5/16.
//  Copyright © 2016 emotiv. All rights reserved.
//

import UIKit
import AVFoundation

class SoundController: NSObject {
    private static var soundPlayer : AVAudioPlayer?
    
    static func stopSound(){
        if let soundPlayer = self.soundPlayer{
            soundPlayer.stop()
        }
    }
    
    static func playSound(url : NSURL, isRepeat: Bool = false){
        do{
            if let soundPlayer = self.soundPlayer{
                soundPlayer.stop()
            }
            
            self.soundPlayer = try AVAudioPlayer(contentsOf: url as URL)
            
            if let soundPlayer = self.soundPlayer{
                if isRepeat{
                    soundPlayer.numberOfLoops = 5
                } else {
                    soundPlayer.numberOfLoops = 0
                }
                
                soundPlayer.play()
            }
        } catch{
            NSLog("Fail to play sound")
        }
    }
    
    static func playRight(){
        if let url = Bundle.main.url(forResource: "SFX_UI_welcome", withExtension: "wav"){
            self.playSound(url: url as NSURL)
        }
    }
    
    static func playClickButton(){
        if let url = Bundle.main.url(forResource: "SFX_UI_capture", withExtension: "wav"){
            self.playSound(url: url as NSURL)
        }
    }
    
    static func playWrong(){
        if let url = Bundle.main.url(forResource: "SFX_UI_complete", withExtension: "wav"){
            self.playSound(url: url as NSURL)
        }
    }

}
