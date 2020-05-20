import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MainViewController: UIViewController, AVAudioPlayerDelegate {
    
        var players: [URL: AVAudioPlayer] = [:]
        var duplicatePlayers: [AVAudioPlayer] = []
        
        var id = 8
        var play = false
        var counter:Int = 0
        var timer = Timer()
        var speed = 6.0
            
        let speed1Btn = UIButton(frame: CGRect(x: 12, y: 50, width: 40, height: 20))
        let speed2Btn = UIButton(frame: CGRect(x: 12, y: 80, width: 40, height: 20))
        let speed3Btn = UIButton(frame: CGRect(x: 12, y: 110, width: 40, height: 20))
        let speed4Btn = UIButton(frame: CGRect(x: 12, y: 140, width: 40, height: 20))
        let speed5Btn = UIButton(frame: CGRect(x: 12, y: 170, width: 40, height: 20))
        let speed6Btn = UIButton(frame: CGRect(x: 12, y: 200, width: 40, height: 20))
        
        //sound list elements
        let titleSound = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 40))
        let closeBtn = UIButton(frame: CGRect(x: 470, y: 10, width: 20, height: 20))
    
        //play pause wrapper element
        let stopBtn = UIButton(frame: CGRect(x: 15, y: 7, width: 30, height: 30))
        let playBtn = UIButton(frame: CGRect(x: 80, y: 7, width: 30, height: 30))
        let resetBtn = UIButton(frame: CGRect(x: 210, y: 7, width: 30, height: 30))
        let speedBtn = UIButton(frame: CGRect(x: 140, y: 13, width: 40, height: 20))
        let helpBtn = UIButton(frame: CGRect(x: 550, y: 10, width: 35, height: 35))
    
    
        //other view
        let soundList = UIView(frame: CGRect(x: 40,y: 1510, width: 500, height: 240))
        let playPauseWrapper = UIView(frame: CGRect(x: 160,y: 5, width: 260, height: 45))
        let helpView = UIView(frame: CGRect(x: 50,y: 100, width: 500, height: 600))
        let speedView = UIView(frame: CGRect(x: 295,y: -295, width: 65, height: 230))
        
        
        let closeHelpBtn = UIButton(frame: CGRect(x: 470, y: 10, width: 20, height: 20))
    
        //option sound button
        let option1 = UIButton(frame: CGRect(x: 20, y: 70, width: 70, height: 30))
        let option2 = UIButton(frame: CGRect(x: 100, y: 70, width: 70, height: 30))
        let option3 = UIButton(frame: CGRect(x: 180, y: 70, width: 70, height: 30))
        let option4 = UIButton(frame: CGRect(x: 260, y: 70, width: 70, height: 30))
        let option5 = UIButton(frame: CGRect(x: 340, y: 70, width: 70, height: 30))
        let option6 = UIButton(frame: CGRect(x: 420, y: 70, width: 70, height: 30))
        let option7 = UIButton(frame: CGRect(x: 20, y: 110, width: 70, height: 30))
        let option8 = UIButton(frame: CGRect(x: 100, y: 110, width: 70, height: 30))
        let option9 = UIButton(frame: CGRect(x: 180, y: 110, width: 70, height: 30))
        let option10 = UIButton(frame: CGRect(x: 260, y: 110, width: 70, height: 30))
        let option11 = UIButton(frame: CGRect(x: 340, y: 110, width: 70, height: 30))
        let option12 = UIButton(frame: CGRect(x: 420, y: 110, width: 70, height: 30))
        let option13 = UIButton(frame: CGRect(x: 20, y: 150, width: 70, height: 30))
        let option14 = UIButton(frame: CGRect(x: 100, y: 150, width: 70, height: 30))
        let option15 = UIButton(frame: CGRect(x: 180, y: 150, width: 70, height: 30))
        let option16 = UIButton(frame: CGRect(x: 260, y: 150, width: 70, height: 30))
        let option17 = UIButton(frame: CGRect(x: 340, y: 150, width: 70, height: 30))
        let option18 = UIButton(frame: CGRect(x: 420, y: 150, width: 70, height: 30))
        let option19 = UIButton(frame: CGRect(x: 20, y: 190, width: 70, height: 30))
        let option20 = UIButton(frame: CGRect(x: 100, y: 190, width: 70, height: 30))
        let option21 = UIButton(frame: CGRect(x: 180, y: 190, width: 70, height: 30))
        let option22 = UIButton(frame: CGRect(x: 260, y: 190, width: 70, height: 30))
        let option23 = UIButton(frame: CGRect(x: 340, y: 190, width: 70, height: 30))
        let option24 = UIButton(frame: CGRect(x: 420, y: 190, width: 70, height: 30))
    
        
        //Button for choose sound
        let inputSound1Btn = UIButton(frame: CGRect(x: 20, y: 690, width: 50, height: 50))
        let inputSound2Btn = UIButton(frame: CGRect(x: 90, y: 690, width: 50, height: 50))
        let inputSound3Btn = UIButton(frame: CGRect(x: 160, y: 690, width: 50, height: 50))
        let inputSound4Btn = UIButton(frame: CGRect(x: 230, y: 690, width: 50, height: 50))
        let inputSound5Btn = UIButton(frame: CGRect(x: 300, y: 690, width: 50, height: 50))
        let inputSound6Btn = UIButton(frame: CGRect(x: 370, y: 690, width: 50, height: 50))
        let inputSound7Btn = UIButton(frame: CGRect(x: 440, y: 690, width: 50, height: 50))
        let inputSound8Btn = UIButton(frame: CGRect(x: 510, y: 690, width: 50, height: 50))
        
        //Button row 1 from above input sound button
        let r1c1Btn = UIButton(frame: CGRect(x: 20, y: 620, width: 50, height: 50))
        let r1c2Btn = UIButton(frame: CGRect(x: 90, y: 620, width: 50, height: 50))
        let r1c3Btn = UIButton(frame: CGRect(x: 160, y: 620, width: 50, height: 50))
        let r1c4Btn = UIButton(frame: CGRect(x: 230, y: 620, width: 50, height: 50))
        let r1c5Btn = UIButton(frame: CGRect(x: 300, y: 620, width: 50, height: 50))
        let r1c6Btn = UIButton(frame: CGRect(x: 370, y: 620, width: 50, height: 50))
        let r1c7Btn = UIButton(frame: CGRect(x: 440, y: 620, width: 50, height: 50))
        let r1c8Btn = UIButton(frame: CGRect(x: 510, y: 620, width: 50, height: 50))

        //Button row 2 from above input sound button
        let r2c1Btn = UIButton(frame: CGRect(x: 20, y: 550, width: 50, height: 50))
        let r2c2Btn = UIButton(frame: CGRect(x: 90, y: 550, width: 50, height: 50))
        let r2c3Btn = UIButton(frame: CGRect(x: 160, y: 550, width: 50, height: 50))
        let r2c4Btn = UIButton(frame: CGRect(x: 230, y: 550, width: 50, height: 50))
        let r2c5Btn = UIButton(frame: CGRect(x: 300, y: 550, width: 50, height: 50))
        let r2c6Btn = UIButton(frame: CGRect(x: 370, y: 550, width: 50, height: 50))
        let r2c7Btn = UIButton(frame: CGRect(x: 440, y: 550, width: 50, height: 50))
        let r2c8Btn = UIButton(frame: CGRect(x: 510, y: 550, width: 50, height: 50))
        
        //Button row 3 from above input sound button
        let r3c1Btn = UIButton(frame: CGRect(x: 20, y: 480, width: 50, height: 50))
        let r3c2Btn = UIButton(frame: CGRect(x: 90, y: 480, width: 50, height: 50))
        let r3c3Btn = UIButton(frame: CGRect(x: 160, y: 480, width: 50, height: 50))
        let r3c4Btn = UIButton(frame: CGRect(x: 230, y: 480, width: 50, height: 50))
        let r3c5Btn = UIButton(frame: CGRect(x: 300, y: 480, width: 50, height: 50))
        let r3c6Btn = UIButton(frame: CGRect(x: 370, y: 480, width: 50, height: 50))
        let r3c7Btn = UIButton(frame: CGRect(x: 440, y: 480, width: 50, height: 50))
        let r3c8Btn = UIButton(frame: CGRect(x: 510, y: 480, width: 50, height: 50))
    
        //Button row 4 from above input sound button
        let r4c1Btn = UIButton(frame: CGRect(x: 20, y: 410, width: 50, height: 50))
        let r4c2Btn = UIButton(frame: CGRect(x: 90, y: 410, width: 50, height: 50))
        let r4c3Btn = UIButton(frame: CGRect(x: 160, y: 410, width: 50, height: 50))
        let r4c4Btn = UIButton(frame: CGRect(x: 230, y: 410, width: 50, height: 50))
        let r4c5Btn = UIButton(frame: CGRect(x: 300, y: 410, width: 50, height: 50))
        let r4c6Btn = UIButton(frame: CGRect(x: 370, y: 410, width: 50, height: 50))
        let r4c7Btn = UIButton(frame: CGRect(x: 440, y: 410, width: 50, height: 50))
        let r4c8Btn = UIButton(frame: CGRect(x: 510, y: 410, width: 50, height: 50))
         
        //Button row 5 from above input sound button
        let r5c1Btn = UIButton(frame: CGRect(x: 20, y: 340, width: 50, height: 50))
        let r5c2Btn = UIButton(frame: CGRect(x: 90, y: 340, width: 50, height: 50))
        let r5c3Btn = UIButton(frame: CGRect(x: 160, y: 340, width: 50, height: 50))
        let r5c4Btn = UIButton(frame: CGRect(x: 230, y: 340, width: 50, height: 50))
        let r5c5Btn = UIButton(frame: CGRect(x: 300, y: 340, width: 50, height: 50))
        let r5c6Btn = UIButton(frame: CGRect(x: 370, y: 340, width: 50, height: 50))
        let r5c7Btn = UIButton(frame: CGRect(x: 440, y: 340, width: 50, height: 50))
        let r5c8Btn = UIButton(frame: CGRect(x: 510, y: 340, width: 50, height: 50))
    
        //Button row 6 from above input sound button
        let r6c1Btn = UIButton(frame: CGRect(x: 20, y: 270, width: 50, height: 50))
        let r6c2Btn = UIButton(frame: CGRect(x: 90, y: 270, width: 50, height: 50))
        let r6c3Btn = UIButton(frame: CGRect(x: 160, y: 270, width: 50, height: 50))
        let r6c4Btn = UIButton(frame: CGRect(x: 230, y: 270, width: 50, height: 50))
        let r6c5Btn = UIButton(frame: CGRect(x: 300, y: 270, width: 50, height: 50))
        let r6c6Btn = UIButton(frame: CGRect(x: 370, y: 270, width: 50, height: 50))
        let r6c7Btn = UIButton(frame: CGRect(x: 440, y: 270, width: 50, height: 50))
        let r6c8Btn = UIButton(frame: CGRect(x: 510, y: 270, width: 50, height: 50))

        //Button row 7 from above input sound button
        let r7c1Btn = UIButton(frame: CGRect(x: 20, y: 200, width: 50, height: 50))
        let r7c2Btn = UIButton(frame: CGRect(x: 90, y: 200, width: 50, height: 50))
        let r7c3Btn = UIButton(frame: CGRect(x: 160, y: 200, width: 50, height: 50))
        let r7c4Btn = UIButton(frame: CGRect(x: 230, y: 200, width: 50, height: 50))
        let r7c5Btn = UIButton(frame: CGRect(x: 300, y: 200, width: 50, height: 50))
        let r7c6Btn = UIButton(frame: CGRect(x: 370, y: 200, width: 50, height: 50))
        let r7c7Btn = UIButton(frame: CGRect(x: 440, y: 200, width: 50, height: 50))
        let r7c8Btn = UIButton(frame: CGRect(x: 510, y: 200, width: 50, height: 50))
         
        //Button row 8 from above input sound button
        let r8c1Btn = UIButton(frame: CGRect(x: 20, y: 130, width: 50, height: 50))
        let r8c2Btn = UIButton(frame: CGRect(x: 90, y: 130, width: 50, height: 50))
        let r8c3Btn = UIButton(frame: CGRect(x: 160, y: 130, width: 50, height: 50))
        let r8c4Btn = UIButton(frame: CGRect(x: 230, y: 130, width: 50, height: 50))
        let r8c5Btn = UIButton(frame: CGRect(x: 300, y: 130, width: 50, height: 50))
        let r8c6Btn = UIButton(frame: CGRect(x: 370, y: 130, width: 50, height: 50))
        let r8c7Btn = UIButton(frame: CGRect(x: 440, y: 130, width: 50, height: 50))
        let r8c8Btn = UIButton(frame: CGRect(x: 510, y: 130, width: 50, height: 50))

        //Button row 9 from above input sound button
        let r9c1Btn = UIButton(frame: CGRect(x: 20, y: 60, width: 50, height: 50))
        let r9c2Btn = UIButton(frame: CGRect(x: 90, y: 60, width: 50, height: 50))
        let r9c3Btn = UIButton(frame: CGRect(x: 160, y: 60, width: 50, height: 50))
        let r9c4Btn = UIButton(frame: CGRect(x: 230, y: 60, width: 50, height: 50))
        let r9c5Btn = UIButton(frame: CGRect(x: 300, y: 60, width: 50, height: 50))
        let r9c6Btn = UIButton(frame: CGRect(x: 370, y: 60, width: 50, height: 50))
        let r9c7Btn = UIButton(frame: CGRect(x: 440, y: 60, width: 50, height: 50))
        let r9c8Btn = UIButton(frame: CGRect(x: 510, y: 60, width: 50, height: 50))
    
        var rowButton1:[UIButton] = []
        
        var rowButton2:[UIButton] = []
        
        var rowButton3:[UIButton] = []
        
        var rowButton4:[UIButton] = []
        
        var rowButton5:[UIButton] = []
        
        var rowButton6:[UIButton] = []
        
        var rowButton7:[UIButton] = []
        
        var rowButton8:[UIButton] = []
        
        var rowButton9:[UIButton] = []

    
        var sounds: [Sound] = [
            Sound(name:"Glass",sound:"sound1"),Sound(name:"Pistol",sound:"sound2"),Sound(name:"Window",sound:"sound3"),
            Sound(name:"Cart",sound:"sound4"),Sound(name:"Paintball",sound:"sound5"),Sound(name:"Cork Pop",sound:"sound18"),
            Sound(name:"Paper",sound:"sound7"),Sound(name:"Axe",sound:"sound8"),Sound(name:"Plastic",sound:"sound9"),
            Sound(name:"Metal",sound:"sound10"),Sound(name:"Camera",sound:"sound11"),Sound(name:"Keys",sound:"sound12"),
            Sound(name:"Cymbal",sound:"sound13"),Sound(name:"Blocks",sound:"sound14"),Sound(name:"Lighters",sound:"sound15"),
            Sound(name:"Water",sound:"sound16"),Sound(name:"Switches",sound:"sound17"),Sound(name:"Piano C",sound:"sound19"),
            Sound(name:"Piano D",sound:"sound20"),Sound(name:"Piano E",sound:"sound21"),Sound(name:"Piano F",sound:"sound22"),
            Sound(name:"Piano G",sound:"sound23"),Sound(name:"Piano A",sound:"sound24"),Sound(name:"Piano B",sound:"sound25")
        ]
    
        var choose: [Choose] = [
            Choose(input:"input1",option:"sound19"),Choose(input:"input2",option:"sound20"),Choose(input:"input3",option:"sound21"),Choose(input:"input4",option:"sound22"),
            Choose(input:"input5",option:"sound23"),Choose(input:"input6",option:"sound24"),Choose(input:"input7",option:"sound14"),Choose(input:"input8",option:"sound8")
        ]

    
        var soundChoosed = Array(repeating: "", count: 8)
    
        var btnRow1Clicked = Array(repeating: false, count: 8)
        var btnRow2Clicked = Array(repeating: false, count: 8)
        var btnRow3Clicked = Array(repeating: false, count: 8)
        var btnRow4Clicked = Array(repeating: false, count: 8)
        var btnRow5Clicked = Array(repeating: false, count: 8)
        var btnRow6Clicked = Array(repeating: false, count: 8)
        var btnRow7Clicked = Array(repeating: false, count: 8)
        var btnRow8Clicked = Array(repeating: false, count: 8)
        var btnRow9Clicked = Array(repeating: false, count: 8)
        var rowButton: [UIButton] = []
    
    
    
    public override func loadView() {
        let view = UIView()
        view.addBackground()
        helpView.addHelpImage()
        
        let inputSoundBtn =
            [inputSound1Btn,inputSound2Btn,inputSound3Btn,inputSound4Btn,inputSound5Btn,inputSound6Btn, inputSound7Btn, inputSound8Btn]
        
        let option = [option1,option2,option3,option4,option5,option6,option7,option8,option9,option10,option11,option12,option13,option14,option15,option16,option17,option18,option19,option20,option21,option22,option23,option24]
        
        
        rowButton =
            [r1c1Btn,r1c2Btn,r1c3Btn,r1c4Btn,r1c5Btn,r1c6Btn,r1c7Btn,r1c8Btn,
             r2c1Btn,r2c2Btn,r2c3Btn,r2c4Btn,r2c5Btn,r2c6Btn,r2c7Btn,r2c8Btn,
             r3c1Btn,r3c2Btn,r3c3Btn,r3c4Btn,r3c5Btn,r3c6Btn,r3c7Btn,r3c8Btn,
             r4c1Btn,r4c2Btn,r4c3Btn,r4c4Btn,r4c5Btn,r4c6Btn,r4c7Btn,r4c8Btn,
             r5c1Btn,r5c2Btn,r5c3Btn,r5c4Btn,r5c5Btn,r5c6Btn,r5c7Btn,r5c8Btn,
             r6c1Btn,r6c2Btn,r6c3Btn,r6c4Btn,r6c5Btn,r6c6Btn,r6c7Btn,r6c8Btn,
             r7c1Btn,r7c2Btn,r7c3Btn,r7c4Btn,r7c5Btn,r7c6Btn,r7c7Btn,r7c8Btn,
             r8c1Btn,r8c2Btn,r8c3Btn,r8c4Btn,r8c5Btn,r8c6Btn,r8c7Btn,r8c8Btn,
             r9c1Btn,r9c2Btn,r9c3Btn,r9c4Btn,r9c5Btn,r9c6Btn,r9c7Btn,r9c8Btn
            ]
        
        let speedButton = [speed1Btn,speed2Btn,speed3Btn,speed4Btn, speed5Btn, speed6Btn]
        
        
        
                rowButton1 = [
                    r1c1Btn,r1c2Btn,r1c3Btn,r1c4Btn,r1c5Btn,r1c6Btn,r1c7Btn,r1c8Btn,
                ]
                
                rowButton2 = [
                    r2c1Btn,r2c2Btn,r2c3Btn,r2c4Btn,r2c5Btn,r2c6Btn,r2c7Btn,r2c8Btn,
                ]
                
                rowButton3 = [
                    r3c1Btn,r3c2Btn,r3c3Btn,r3c4Btn,r3c5Btn,r3c6Btn,r3c7Btn,r3c8Btn,
                ]
                
                rowButton4 = [
                    r4c1Btn,r4c2Btn,r4c3Btn,r4c4Btn,r4c5Btn,r4c6Btn,r4c7Btn,r4c8Btn,
                ]
                
                rowButton5 = [
                    r5c1Btn,r5c2Btn,r5c3Btn,r5c4Btn,r5c5Btn,r5c6Btn,r5c7Btn,r5c8Btn,
                ]
                
                rowButton6 = [
                    r6c1Btn,r6c2Btn,r6c3Btn,r6c4Btn,r6c5Btn,r6c6Btn,r6c7Btn,r6c8Btn,
                ]
                
                rowButton7 = [
                    r7c1Btn,r7c2Btn,r7c3Btn,r7c4Btn,r7c5Btn,r7c6Btn,r7c7Btn,r7c8Btn,
                ]
                
                rowButton8 = [
                    r8c1Btn,r8c2Btn,r8c3Btn,r8c4Btn,r8c5Btn,r8c6Btn,r8c7Btn,r8c8Btn,
                ]
                
                rowButton9 = [
                    r9c1Btn,r9c2Btn,r9c3Btn,r9c4Btn,r9c5Btn,r9c6Btn,r9c7Btn,r9c8Btn
                ]
        
        
        titleSound.text = "Choose Sound :"
        titleSound.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        
        closeBtn.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeBtn.tintColor = UIColor.red
        closeBtn.alpha = 0.7
        
        closeHelpBtn.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeHelpBtn.tintColor = UIColor.red
        closeHelpBtn.alpha = 0.7
        
        playBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        playBtn.tintColor = UIColor.red
        playBtn.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        
        stopBtn.setBackgroundImage(UIImage(systemName: "stop.fill"), for: .normal)
        stopBtn.tintColor = UIColor.red
        stopBtn.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        
        
        resetBtn.setBackgroundImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        resetBtn.tintColor = UIColor.red
        
        helpBtn.setBackgroundImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
        helpBtn.tintColor = UIColor.white
        helpBtn.alpha = 0.7
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedBtn.tintColor = UIColor.white
        speedBtn.titleLabel?.font = .systemFont(ofSize: 14)
        speedBtn.layer.cornerRadius = 7
        speedBtn.backgroundColor = UIColor.red
        
        
        
        soundList.backgroundColor = UIColor.white
        soundList.layer.cornerRadius = 15
        soundList.alpha = 0.9

        
        playPauseWrapper.backgroundColor = UIColor.white
        playPauseWrapper.layer.cornerRadius = 15
        playPauseWrapper.alpha = 0.9
        
        helpView.backgroundColor = UIColor.white
        helpView.layer.cornerRadius = 15
        helpView.alpha = 0.9
        
        speedView.backgroundColor = UIColor.white
        speedView.layer.cornerRadius = 15
        speedView.alpha = 0.9
        
        
        for input in inputSoundBtn {
            input.setTitle("🎵", for: .normal)
            input.backgroundColor = UIColor.red
            input.layer.cornerRadius = input.frame.size.height/2
            input.alpha = 0.7
        }
        
        for btn in rowButton {
            btn.backgroundColor = UIColor.gray
            btn.layer.cornerRadius = btn.frame.size.height/2
            btn.alpha = 0.5
        }
        
        for (index,opt) in option.enumerated() {
            opt.backgroundColor = UIColor.red
            opt.layer.cornerRadius = 10
            opt.setTitle(sounds[index].name, for: .normal)
            opt.titleLabel?.font = .boldSystemFont(ofSize: 12)
            opt.alpha = 0.8
        }
        
        for spdBtn in speedButton {
            spdBtn.titleLabel?.font = .boldSystemFont(ofSize: 12)
            spdBtn.tintColor = UIColor.white
            spdBtn.layer.cornerRadius = 7
            spdBtn.backgroundColor = UIColor.red
        }
        
        speed1Btn.setTitle("1.0x", for: .normal)
        speed2Btn.setTitle("2.0x", for: .normal)
        speed3Btn.setTitle("3.0x", for: .normal)
        speed4Btn.setTitle("4.0x", for: .normal)
        speed5Btn.setTitle("5.0x", for: .normal)
        speed6Btn.setTitle("6.0x", for: .normal)
        
        
        btnAction()
        
        for input in inputSoundBtn {
            view.addSubview(input)
        }
        
        for btn in rowButton {
            view.addSubview(btn)
        }
        
        for opt in option {
            soundList.addSubview(opt)
        }
        
        view.addSubview(playPauseWrapper)
        playPauseWrapper.addSubview(playBtn)
        playPauseWrapper.addSubview(resetBtn)
        playPauseWrapper.addSubview(speedBtn)
        playPauseWrapper.addSubview(stopBtn)
        
        
        view.addSubview(soundList)
        soundList.addSubview(titleSound)
        soundList.addSubview(closeBtn)
        
        view.addSubview(speedView)
        speedView.addSubview(speed1Btn)
        speedView.addSubview(speed2Btn)
        speedView.addSubview(speed3Btn)
        speedView.addSubview(speed4Btn)
        speedView.addSubview(speed5Btn)
        speedView.addSubview(speed6Btn)
        
        
        view.addSubview(helpView)
        helpView.addSubview(closeHelpBtn)
        
        
        view.addSubview(helpBtn)
        
        view.bringSubviewToFront(soundList)
        
        self.view = view
        
    }
    
    
    //
    
    
    @objc func stopAction(sender: UIButton!) {
        
        dismissSpeed()
        dismissHelp()
        dismiss()

        playBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        play = false

        switch counter {
            case 1:
                
                for (index,btn) in rowButton1.enumerated() {
                    if btnRow1Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            case 2:
                
                for (index,btn) in rowButton2.enumerated() {
                    if btnRow2Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
            
                
            case 3:
            
                for (index,btn) in rowButton3.enumerated() {
                    if btnRow3Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
            
        
            case 4:
                
                for (index,btn) in rowButton4.enumerated() {
                    if btnRow4Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            case 5:
                
                for (index,btn) in rowButton5.enumerated() {
                    if btnRow5Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            
            case 6:
                
                for (index,btn) in rowButton6.enumerated() {
                    if btnRow6Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            case 7:
                
                for (index,btn) in rowButton7.enumerated() {
                    if btnRow7Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            case 8:
             
                for (index,btn) in rowButton8.enumerated() {
                    if btnRow8Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            case 9:
                
                for (index,btn) in rowButton9.enumerated() {
                    if btnRow9Clicked[index] == true {
                            btn.backgroundColor = UIColor.white
                    }else{
                        btn.backgroundColor = UIColor.gray
                    }
                }
                
            default:
                print("")
            }
        
        timer.invalidate()
        counter = 0
    
    }
    
    @objc func playAction(sender: UIButton!) {
        
        dismissSpeed()
        dismiss()
        dismissHelp()
        
        let time:Double = 1/speed
    
        if play == false{
            timer.invalidate()
            play = true
            timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            playBtn.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        }else{
            play = false
            playBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            timer.invalidate()
        }
        
    }
    
    
    @objc func timerAction() {
        counter += 1
        
        if counter > 9 {
            counter = 0
            for (index,btn) in btnRow9Clicked.enumerated() {
                if btn == true {
                    rowButton9[index].backgroundColor = UIColor.white
                }else{
                    rowButton9[index].backgroundColor = UIColor.gray
                }
            }
        
            
            
        }else{
            
            switch counter {
            case 1:
                
                for (index,btn) in rowButton1.enumerated() {
                    if btnRow1Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            case 2:
                
                for (index,btn) in btnRow1Clicked.enumerated() {
                    if btn == true {
                        rowButton1[index].backgroundColor = UIColor.white
                    }else{
                        rowButton1[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton2.enumerated() {
                    if btnRow2Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
            
                
            case 3:
            
                for (index,btn) in btnRow2Clicked.enumerated() {
                    if btn == true {
                        rowButton2[index].backgroundColor = UIColor.white
                    }else{
                        rowButton2[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton3.enumerated() {
                    if btnRow3Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
            
        
            case 4:
                
                for (index,btn) in btnRow3Clicked.enumerated() {
                    if btn == true {
                        rowButton3[index].backgroundColor = UIColor.white
                    }else{
                        rowButton3[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton4.enumerated() {
                    if btnRow4Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            case 5:
                
                for (index,btn) in btnRow4Clicked.enumerated() {
                    if btn == true {
                        rowButton4[index].backgroundColor = UIColor.white
                    }else{
                        rowButton4[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton5.enumerated() {
                    if btnRow5Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            
            case 6:
                
                for (index,btn) in btnRow5Clicked.enumerated() {
                    if btn == true {
                        rowButton5[index].backgroundColor = UIColor.white
                    }else{
                        rowButton5[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton6.enumerated() {
                    if btnRow6Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            case 7:
                
                for (index,btn) in btnRow6Clicked.enumerated() {
                    if btn == true {
                        rowButton6[index].backgroundColor = UIColor.white
                    }else{
                        rowButton6[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton7.enumerated() {
                    if btnRow7Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            case 8:
             
                for (index,btn) in btnRow7Clicked.enumerated() {
                    if btn == true {
                        rowButton7[index].backgroundColor = UIColor.white
                    }else{
                        rowButton7[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton8.enumerated() {
                    if btnRow8Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            case 9:
                
                for (index,btn) in btnRow8Clicked.enumerated() {
                    if btn == true {
                        rowButton8[index].backgroundColor = UIColor.white
                    }else{
                        rowButton8[index].backgroundColor = UIColor.gray
                    }
                }
                
                
                for (index,btn) in rowButton9.enumerated() {
                    if btnRow9Clicked[index] == true {
                        if choose[index].option != "" {
                            playSound(soundData: choose[index].option)
                        }
                    }
                    btn.backgroundColor = UIColor.black
                }
                
            default:
                print("")
            }
            
        }
        
    }

    
    
    func playSound(soundData: String){
        
        let volume:Float = 2.0
        
        guard let bundle = Bundle.main.path(forResource: soundData, ofType: "mp3") else { return }
        let soundFileNameURL = URL(fileURLWithPath: bundle)

        if let player = players[soundFileNameURL] {

            if !player.isPlaying {
                player.prepareToPlay()
                player.volume = volume
                player.play()
            } else {
                do {
                    let duplicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameURL)

                    duplicatePlayer.delegate = self
                    duplicatePlayers.append(duplicatePlayer)

                    duplicatePlayer.prepareToPlay()
                    duplicatePlayer.play()
                    duplicatePlayer.volume = volume
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
                player.volume = volume
            } catch let error {
                print(error.localizedDescription)
            }
        }
       
    }
    
    @objc func closeAction(sender: UIButton!) {
//        let inputSoundBtn =
//            [inputSound1Btn,inputSound2Btn,inputSound3Btn,inputSound4Btn,inputSound5Btn,inputSound6Btn, inputSound7Btn, inputSound8Btn]
        
//        if choose[id].option == "" {
//            inputSoundBtn[id].backgroundColor = UIColor.systemPink
//            inputSoundBtn[id].alpha = 0.5
//        }
            dismiss()
            id = 8
    }
    
    func dismiss(){
        if soundList.frame.origin.y == 510 {
            let xPosition = soundList.frame.origin.x
            let yPosition = soundList.frame.origin.y + 1000

            let width = soundList.frame.size.width
            let height = soundList.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.soundList.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
    }
    
    
    @objc func input1(sender: UIButton!) {
        
        guard soundList.frame.origin.y == 550 else {
//            inputSound1Btn.backgroundColor = UIColor.red
//            inputSound1Btn.alpha = 0.8
            id = 0
            popup()
            return
        }
        
    }

    
    @objc func input2(sender: UIButton!) {
        
        guard soundList.frame.origin.y == 550 else {
//            inputSound2Btn.backgroundColor = UIColor.red
//            inputSound2Btn.alpha = 0.8
            id = 1
            popup()
            return
        }
        
    }
    
    @objc func input3(sender: UIButton!) {
        
        guard soundList.frame.origin.y == 550 else {
//            inputSound3Btn.backgroundColor = UIColor.red
//            inputSound3Btn.alpha = 0.8
            id = 2
            popup()
            return
        }
    }
    
    @objc func input4(sender: UIButton!) {
        guard soundList.frame.origin.y == 550 else {
//            inputSound4Btn.backgroundColor = UIColor.red
//            inputSound4Btn.alpha = 0.8
            id = 3
            popup()
            return
        }
    }
    
    @objc func input5(sender: UIButton!) {
        guard soundList.frame.origin.y == 550 else {
//            inputSound5Btn.backgroundColor = UIColor.red
//            inputSound5Btn.alpha = 0.8
            id = 4
            popup()
            return
        }
    }
    
    @objc func input6(sender: UIButton!) {
        guard soundList.frame.origin.y == 550 else {
//            inputSound6Btn.backgroundColor = UIColor.red
//            inputSound6Btn.alpha = 0.8
            id = 5
            popup()
            return
        }
    }
    
    @objc func input7(sender: UIButton!) {
        guard soundList.frame.origin.y == 550 else {
//            inputSound7Btn.backgroundColor = UIColor.red
//            inputSound7Btn.alpha = 0.8
            id = 6
            popup()
            return
        }
    }
    
    @objc func input8(sender: UIButton!) {
        guard soundList.frame.origin.y == 550 else {
//            inputSound8Btn.backgroundColor = UIColor.red
//            inputSound8Btn.alpha = 0.8
            id = 7
            popup()
            return
        }
    }
    
    
    func popup(){
        dismissHelp()
        dismissSpeed()
        if soundList.frame.origin.y == 1510 {
            let xPosition = soundList.frame.origin.x
            let yPosition = soundList.frame.origin.y - 1000

            let width = soundList.frame.size.width
            let height = soundList.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.soundList.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
        
    }
    
    func popupSpeedView(){
        if speedView.frame.origin.y == -295 {
            let xPosition = speedView.frame.origin.x
            let yPosition = speedView.frame.origin.y + 300

            let width = speedView.frame.size.width
            let height = speedView.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.speedView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
    }
    
    func popupHelpView(){
        if helpView.frame.origin.x == 950 {
            let xPosition = helpView.frame.origin.x - 900
            let yPosition = helpView.frame.origin.y

            let width = helpView.frame.size.width
            let height = helpView.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.helpView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }else{
            dismissHelp()
        }
    }
    
    func dismissSpeed(){
        if speedView.frame.origin.y == 5 {
            let xPosition = speedView.frame.origin.x
            let yPosition = speedView.frame.origin.y - 300

            let width = speedView.frame.size.width
            let height = speedView.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.speedView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
    }
    
    func dismissHelp(){
        if helpView.frame.origin.x == 50 {
            let xPosition = helpView.frame.origin.x + 900
            let yPosition = helpView.frame.origin.y

            let width = helpView.frame.size.width
            let height = helpView.frame.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.helpView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
    }
    
    func speedPlay(){
            
        let time:Double = 1/speed
        
        if play == true{
                
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
                
                
        }
    }
    
    @objc func speedAction(sender: UIButton!) {
        popupSpeedView()
        dismissHelp()
        dismiss()
        
    }
    
    @objc func speed1Action(sender: UIButton!) {
        dismissSpeed()
        speed = 1.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()

            
    }
    
    @objc func speed2Action(sender: UIButton!) {
        dismissSpeed()
        speed = 2.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()

    }
    
    @objc func speed3Action(sender: UIButton!) {
        dismissSpeed()
        speed = 3.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()

    }
    
    @objc func speed4Action(sender: UIButton!) {
        dismissSpeed()
        speed = 4.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()
    }
    
    @objc func speed5Action(sender: UIButton!) {
        dismissSpeed()
        speed = 5.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()
    }
    
    @objc func speed6Action(sender: UIButton!) {
        dismissSpeed()
        speed = 6.0
        
        speedBtn.setTitle(String(speed)+"x", for: .normal)
        speedPlay()
    }
    
    
    @objc func resetAction(sender: UIButton!) {
        dismissHelp()
        dismissSpeed()
        dismiss()
        
        for (index,_) in rowButton.enumerated() {
            rowButton[index].backgroundColor = UIColor.gray
        }
        for i in 0...7{
            btnRow1Clicked[i] = false
            btnRow2Clicked[i] = false
            btnRow3Clicked[i] = false
            btnRow4Clicked[i] = false
            btnRow5Clicked[i] = false
            btnRow6Clicked[i] = false
            btnRow7Clicked[i] = false
            btnRow8Clicked[i] = false
            btnRow9Clicked[i] = false
        }
    }
    
    
    @objc func helpAction(sender: UIButton!) {
        popupHelpView()
        dismissSpeed()
        dismiss()
    }
    
    
    @objc func closeHelpAction(sender: UIButton!) {
        dismissHelp()
    }
    
    
    
    @objc func r1c1Action(sender: UIButton!) {
        if r1c1Btn.backgroundColor == UIColor.gray || r1c1Btn.backgroundColor == UIColor.black{
            r1c1Btn.backgroundColor = UIColor.white
            btnRow1Clicked[0] = true
        }else{
            r1c1Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[0] = false
        }
    }
    
    
    
    @objc func r1c2Action(sender: UIButton!) {
        if r1c2Btn.backgroundColor == UIColor.gray || r1c2Btn.backgroundColor == UIColor.black{
            r1c2Btn.backgroundColor = UIColor.white
            btnRow1Clicked[1] = true
        }else{
            r1c2Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[1] = false
        }
    }
    
    @objc func r1c3Action(sender: UIButton!) {
        if r1c3Btn.backgroundColor == UIColor.gray || r1c3Btn.backgroundColor == UIColor.black{
            r1c3Btn.backgroundColor = UIColor.white
            btnRow1Clicked[2] = true
        }else{
            r1c3Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[2] = false
        }
    }
    
    
    @objc func r1c4Action(sender: UIButton!) {
        if r1c4Btn.backgroundColor == UIColor.gray || r1c4Btn.backgroundColor == UIColor.black{
            r1c4Btn.backgroundColor = UIColor.white
            btnRow1Clicked[3] = true
        }else{
            r1c4Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[3] = false
        }
    }
    
    @objc func r1c5Action(sender: UIButton!) {
        if r1c5Btn.backgroundColor == UIColor.gray || r1c5Btn.backgroundColor == UIColor.black{
            r1c5Btn.backgroundColor = UIColor.white
            btnRow1Clicked[4] = true
        }else{
            r1c5Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[4] = false
        }
    }
    
    @objc func r1c6Action(sender: UIButton!) {
        if r1c6Btn.backgroundColor == UIColor.gray || r1c6Btn.backgroundColor == UIColor.black{
            r1c6Btn.backgroundColor = UIColor.white
            btnRow1Clicked[5] = true
        }else{
            r1c6Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[5] = false
        }
    }
    
    @objc func r1c7Action(sender: UIButton!) {
        if r1c7Btn.backgroundColor == UIColor.gray || r1c7Btn.backgroundColor == UIColor.black{
            r1c7Btn.backgroundColor = UIColor.white
            btnRow1Clicked[6] = true
        }else{
            r1c7Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[6] = false
        }
    }
    
    @objc func r1c8Action(sender: UIButton!) {
        if r1c8Btn.backgroundColor == UIColor.gray || r1c8Btn.backgroundColor == UIColor.black{
            r1c8Btn.backgroundColor = UIColor.white
            btnRow1Clicked[7] = true
        }else{
            r1c8Btn.backgroundColor = UIColor.gray
            btnRow1Clicked[7] = false
        }
    }
    
    
    
    
    
    @objc func r2c1Action(sender: UIButton!) {
        if r2c1Btn.backgroundColor == UIColor.gray || r2c1Btn.backgroundColor == UIColor.black{
            r2c1Btn.backgroundColor = UIColor.white
            btnRow2Clicked[0] = true
        }else{
            r2c1Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[0] = false
        }
    }
    
    @objc func r2c2Action(sender: UIButton!) {
        if r2c2Btn.backgroundColor == UIColor.gray || r2c2Btn.backgroundColor == UIColor.black{
            r2c2Btn.backgroundColor = UIColor.white
            btnRow2Clicked[1] = true
        }else{
            r2c2Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[1] = false
        }
    }
    
    @objc func r2c3Action(sender: UIButton!) {
        if r2c3Btn.backgroundColor == UIColor.gray || r2c3Btn.backgroundColor == UIColor.black{
            r2c3Btn.backgroundColor = UIColor.white
            btnRow2Clicked[2] = true
        }else{
            r2c3Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[2] = false
        }
    }
    
    @objc func r2c4Action(sender: UIButton!) {
        if r2c4Btn.backgroundColor == UIColor.gray || r2c4Btn.backgroundColor == UIColor.black{
            r2c4Btn.backgroundColor = UIColor.white
            btnRow2Clicked[3] = true
        }else{
            r2c4Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[3] = false
        }
    }
    
    @objc func r2c5Action(sender: UIButton!) {
        if r2c5Btn.backgroundColor == UIColor.gray || r2c5Btn.backgroundColor == UIColor.black{
            r2c5Btn.backgroundColor = UIColor.white
            btnRow2Clicked[4] = true
        }else{
            r2c5Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[4] = false
        }
    }
    
    @objc func r2c6Action(sender: UIButton!) {
        if r2c6Btn.backgroundColor == UIColor.gray || r2c6Btn.backgroundColor == UIColor.black{
            r2c6Btn.backgroundColor = UIColor.white
            btnRow2Clicked[5] = true
        }else{
            r2c6Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[5] = false
        }
    }
    
    @objc func r2c7Action(sender: UIButton!) {
        if r2c7Btn.backgroundColor == UIColor.gray || r2c7Btn.backgroundColor == UIColor.black{
            r2c7Btn.backgroundColor = UIColor.white
            btnRow2Clicked[6] = true
        }else{
            r2c7Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[6] = false
        }
    }
    
    @objc func r2c8Action(sender: UIButton!) {
        if r2c8Btn.backgroundColor == UIColor.gray || r2c8Btn.backgroundColor == UIColor.black{
            r2c8Btn.backgroundColor = UIColor.white
            btnRow2Clicked[7] = true
        }else{
            r2c8Btn.backgroundColor = UIColor.gray
            btnRow2Clicked[7] = false
        }
    }

    
    
    
    @objc func r3c1Action(sender: UIButton!) {
        if r3c1Btn.backgroundColor == UIColor.gray || r3c1Btn.backgroundColor == UIColor.black{
            r3c1Btn.backgroundColor = UIColor.white
            btnRow3Clicked[0] = true
        }else{
            r3c1Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[0] = false
        }
    }
    
    @objc func r3c2Action(sender: UIButton!) {
        if r3c2Btn.backgroundColor == UIColor.gray || r3c2Btn.backgroundColor == UIColor.black{
            r3c2Btn.backgroundColor = UIColor.white
            btnRow3Clicked[1] = true
        }else{
            r3c2Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[1] = false
        }
    }
    
    @objc func r3c3Action(sender: UIButton!) {
        if r3c3Btn.backgroundColor == UIColor.gray || r3c3Btn.backgroundColor == UIColor.black{
            r3c3Btn.backgroundColor = UIColor.white
            btnRow3Clicked[2] = true
        }else{
            r3c3Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[2] = false
        }
    }
    
    @objc func r3c4Action(sender: UIButton!) {
        if r3c4Btn.backgroundColor == UIColor.gray || r3c4Btn.backgroundColor == UIColor.black{
            r3c4Btn.backgroundColor = UIColor.white
            btnRow3Clicked[3] = true
        }else{
            r3c4Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[3] = false
        }
    }
    
    @objc func r3c5Action(sender: UIButton!) {
        if r3c5Btn.backgroundColor == UIColor.gray || r3c5Btn.backgroundColor == UIColor.black{
            r3c5Btn.backgroundColor = UIColor.white
            btnRow3Clicked[4] = true
        }else{
            r3c5Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[4] = false
        }
    }
    
    @objc func r3c6Action(sender: UIButton!) {
        if r3c6Btn.backgroundColor == UIColor.gray || r3c6Btn.backgroundColor == UIColor.black{
            r3c6Btn.backgroundColor = UIColor.white
            btnRow3Clicked[5] = true
        }else{
            r3c6Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[5] = false
        }
    }
    
    @objc func r3c7Action(sender: UIButton!) {
        if r3c7Btn.backgroundColor == UIColor.gray || r3c7Btn.backgroundColor == UIColor.black{
            r3c7Btn.backgroundColor = UIColor.white
            btnRow3Clicked[6] = true
        }else{
            r3c7Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[6] = false
        }
    }
    
    @objc func r3c8Action(sender: UIButton!) {
        if r3c8Btn.backgroundColor == UIColor.gray || r3c8Btn.backgroundColor == UIColor.black{
            r3c8Btn.backgroundColor = UIColor.white
            btnRow3Clicked[7] = true
        }else{
            r3c8Btn.backgroundColor = UIColor.gray
            btnRow3Clicked[7] = false
        }
    }
    
    
    
    
    @objc func r4c1Action(sender: UIButton!) {
        if r4c1Btn.backgroundColor == UIColor.gray || r4c1Btn.backgroundColor == UIColor.black{
            r4c1Btn.backgroundColor = UIColor.white
            btnRow4Clicked[0] = true
        }else{
            r4c1Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[0] = false
        }
    }
    
    @objc func r4c2Action(sender: UIButton!) {
        if r4c2Btn.backgroundColor == UIColor.gray || r4c2Btn.backgroundColor == UIColor.black{
            r4c2Btn.backgroundColor = UIColor.white
            btnRow4Clicked[1] = true
        }else{
            r4c2Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[1] = false
        }
    }
    
    @objc func r4c3Action(sender: UIButton!) {
        if r4c3Btn.backgroundColor == UIColor.gray || r4c3Btn.backgroundColor == UIColor.black{
            r4c3Btn.backgroundColor = UIColor.white
            btnRow4Clicked[2] = true
        }else{
            r4c3Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[2] = false
        }
    }
    
    @objc func r4c4Action(sender: UIButton!) {
        if r4c4Btn.backgroundColor == UIColor.gray || r4c4Btn.backgroundColor == UIColor.black{
            r4c4Btn.backgroundColor = UIColor.white
            btnRow4Clicked[3] = true
        }else{
            r4c4Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[3] = false
        }
    }
    
    @objc func r4c5Action(sender: UIButton!) {
        if r4c5Btn.backgroundColor == UIColor.gray || r4c5Btn.backgroundColor == UIColor.black{
            r4c5Btn.backgroundColor = UIColor.white
            btnRow4Clicked[4] = true
        }else{
            r4c5Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[4] = false
        }
    }
    
    @objc func r4c6Action(sender: UIButton!) {
        if r4c6Btn.backgroundColor == UIColor.gray || r4c6Btn.backgroundColor == UIColor.black{
            r4c6Btn.backgroundColor = UIColor.white
            btnRow4Clicked[5] = true
        }else{
            r4c6Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[5] = false
        }
    }
    
    @objc func r4c7Action(sender: UIButton!) {
        if r4c7Btn.backgroundColor == UIColor.gray || r4c7Btn.backgroundColor == UIColor.black{
            r4c7Btn.backgroundColor = UIColor.white
            btnRow4Clicked[6] = true
        }else{
            r4c7Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[6] = false
        }
    }
    
    @objc func r4c8Action(sender: UIButton!) {
        if r4c8Btn.backgroundColor == UIColor.gray || r4c8Btn.backgroundColor == UIColor.black{
            r4c8Btn.backgroundColor = UIColor.white
            btnRow4Clicked[7] = true
        }else{
            r4c8Btn.backgroundColor = UIColor.gray
            btnRow4Clicked[7] = false
        }
    }
    
    
    
    
    
    @objc func r5c1Action(sender: UIButton!) {
        if r5c1Btn.backgroundColor == UIColor.gray || r5c1Btn.backgroundColor == UIColor.black{
            r5c1Btn.backgroundColor = UIColor.white
            btnRow5Clicked[0] = true
        }else{
            r5c1Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[0] = false
        }
    }

    @objc func r5c2Action(sender: UIButton!) {
        if r5c2Btn.backgroundColor == UIColor.gray || r5c2Btn.backgroundColor == UIColor.black{
            r5c2Btn.backgroundColor = UIColor.white
            btnRow5Clicked[1] = true
        }else{
            r5c2Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[1] = false
        }
    }

    @objc func r5c3Action(sender: UIButton!) {
        if r5c3Btn.backgroundColor == UIColor.gray || r5c3Btn.backgroundColor == UIColor.black{
            r5c3Btn.backgroundColor = UIColor.white
            btnRow5Clicked[2] = true
        }else{
            r5c3Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[2] = false
        }
    }

    @objc func r5c4Action(sender: UIButton!) {
        if r5c4Btn.backgroundColor == UIColor.gray || r5c4Btn.backgroundColor == UIColor.black{
            r5c4Btn.backgroundColor = UIColor.white
            btnRow5Clicked[3] = true
        }else{
            r5c4Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[3] = false
        }
    }

    @objc func r5c5Action(sender: UIButton!) {
        if r5c5Btn.backgroundColor == UIColor.gray || r5c5Btn.backgroundColor == UIColor.black{
            r5c5Btn.backgroundColor = UIColor.white
            btnRow5Clicked[4] = true
        }else{
            r5c5Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[4] = false
        }
    }

    @objc func r5c6Action(sender: UIButton!) {
        if r5c6Btn.backgroundColor == UIColor.gray || r5c6Btn.backgroundColor == UIColor.black{
            r5c6Btn.backgroundColor = UIColor.white
            btnRow5Clicked[5] = true
        }else{
            r5c6Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[5] = false
        }
    }

    @objc func r5c7Action(sender: UIButton!) {
        if r5c7Btn.backgroundColor == UIColor.gray || r5c7Btn.backgroundColor == UIColor.black{
            r5c7Btn.backgroundColor = UIColor.white
            btnRow5Clicked[6] = true
        }else{
            r5c7Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[6] = false
        }
    }

    @objc func r5c8Action(sender: UIButton!) {
        if r5c8Btn.backgroundColor == UIColor.gray || r5c8Btn.backgroundColor == UIColor.black{
            r5c8Btn.backgroundColor = UIColor.white
            btnRow5Clicked[7] = true
        }else{
            r5c8Btn.backgroundColor = UIColor.gray
            btnRow5Clicked[7] = false
        }
    }

    
    
    @objc func r6c1Action(sender: UIButton!) {
        if r6c1Btn.backgroundColor == UIColor.gray || r6c1Btn.backgroundColor == UIColor.black{
            r6c1Btn.backgroundColor = UIColor.white
            btnRow6Clicked[0] = true
        }else{
            r6c1Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[0] = false
        }
    }

    @objc func r6c2Action(sender: UIButton!) {
        if r6c2Btn.backgroundColor == UIColor.gray || r6c2Btn.backgroundColor == UIColor.black{
            r6c2Btn.backgroundColor = UIColor.white
            btnRow6Clicked[1] = true
        }else{
            r6c2Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[1] = false
        }
    }

    @objc func r6c3Action(sender: UIButton!) {
        if r6c3Btn.backgroundColor == UIColor.gray || r6c3Btn.backgroundColor == UIColor.black{
            r6c3Btn.backgroundColor = UIColor.white
            btnRow6Clicked[2] = true
        }else{
            r6c3Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[2] = false
        }
    }

    @objc func r6c4Action(sender: UIButton!) {
        if r6c4Btn.backgroundColor == UIColor.gray || r6c4Btn.backgroundColor == UIColor.black{
            r6c4Btn.backgroundColor = UIColor.white
            btnRow6Clicked[3] = true
        }else{
            r6c4Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[3] = false
        }
    }

    @objc func r6c5Action(sender: UIButton!) {
        if r6c5Btn.backgroundColor == UIColor.gray || r6c5Btn.backgroundColor == UIColor.black{
            r6c5Btn.backgroundColor = UIColor.white
            btnRow6Clicked[4] = true
        }else{
            r6c5Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[4] = false
        }
    }

    @objc func r6c6Action(sender: UIButton!) {
        if r6c6Btn.backgroundColor == UIColor.gray || r6c6Btn.backgroundColor == UIColor.black{
            r6c6Btn.backgroundColor = UIColor.white
            btnRow6Clicked[5] = true
        }else{
            r6c6Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[5] = false
        }
    }

    @objc func r6c7Action(sender: UIButton!) {
        if r6c7Btn.backgroundColor == UIColor.gray || r6c7Btn.backgroundColor == UIColor.black{
            r6c7Btn.backgroundColor = UIColor.white
            btnRow6Clicked[6] = true
        }else{
            r6c7Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[6] = false
        }
    }

    @objc func r6c8Action(sender: UIButton!) {
        if r6c8Btn.backgroundColor == UIColor.gray || r6c8Btn.backgroundColor == UIColor.black{
            r6c8Btn.backgroundColor = UIColor.white
            btnRow6Clicked[7] = true
        }else{
            r6c8Btn.backgroundColor = UIColor.gray
            btnRow6Clicked[7] = false
        }
    }

    
    
    @objc func r7c1Action(sender: UIButton!) {
        if r7c1Btn.backgroundColor == UIColor.gray || r7c1Btn.backgroundColor == UIColor.black{
            r7c1Btn.backgroundColor = UIColor.white
            btnRow7Clicked[0] = true
        }else{
            r7c1Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[0] = false
        }
    }

    @objc func r7c2Action(sender: UIButton!) {
        if r7c2Btn.backgroundColor == UIColor.gray || r7c2Btn.backgroundColor == UIColor.black{
            r7c2Btn.backgroundColor = UIColor.white
            btnRow7Clicked[1] = true
        }else{
            r7c2Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[1] = false
        }
    }

    @objc func r7c3Action(sender: UIButton!) {
        if r7c3Btn.backgroundColor == UIColor.gray || r7c3Btn.backgroundColor == UIColor.black{
            r7c3Btn.backgroundColor = UIColor.white
            btnRow7Clicked[2] = true
        }else{
            r7c3Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[2] = false
        }
    }

    @objc func r7c4Action(sender: UIButton!) {
        if r7c4Btn.backgroundColor == UIColor.gray || r7c4Btn.backgroundColor == UIColor.black{
            r7c4Btn.backgroundColor = UIColor.white
            btnRow7Clicked[3] = true
        }else{
            r7c4Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[3] = false
        }
    }

    @objc func r7c5Action(sender: UIButton!) {
        if r7c5Btn.backgroundColor == UIColor.gray || r7c5Btn.backgroundColor == UIColor.black{
            r7c5Btn.backgroundColor = UIColor.white
            btnRow7Clicked[4] = true
        }else{
            r7c5Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[4] = false
        }
    }

    @objc func r7c6Action(sender: UIButton!) {
        if r7c6Btn.backgroundColor == UIColor.gray || r7c6Btn.backgroundColor == UIColor.black{
            r7c6Btn.backgroundColor = UIColor.white
            btnRow7Clicked[5] = true
        }else{
            r7c6Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[5] = false
        }
    }

    @objc func r7c7Action(sender: UIButton!) {
        if r7c7Btn.backgroundColor == UIColor.gray || r7c7Btn.backgroundColor == UIColor.black{
            r7c7Btn.backgroundColor = UIColor.white
            btnRow7Clicked[6] = true
        }else{
            r7c7Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[6] = false
        }
    }

    @objc func r7c8Action(sender: UIButton!) {
        if r7c8Btn.backgroundColor == UIColor.gray || r7c8Btn.backgroundColor == UIColor.black{
            r7c8Btn.backgroundColor = UIColor.white
            btnRow7Clicked[7] = true
        }else{
            r7c8Btn.backgroundColor = UIColor.gray
            btnRow7Clicked[7] = false
        }
    }
    
    
    @objc func r8c1Action(sender: UIButton!) {
        if r8c1Btn.backgroundColor == UIColor.gray || r8c1Btn.backgroundColor == UIColor.black{
            r8c1Btn.backgroundColor = UIColor.white
            btnRow8Clicked[0] = true
        }else{
            r8c1Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[0] = false
        }
    }

    @objc func r8c2Action(sender: UIButton!) {
        if r8c2Btn.backgroundColor == UIColor.gray || r8c2Btn.backgroundColor == UIColor.black{
            r8c2Btn.backgroundColor = UIColor.white
            btnRow8Clicked[1] = true
        }else{
            r8c2Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[1] = false
        }
    }

    @objc func r8c3Action(sender: UIButton!) {
        if r8c3Btn.backgroundColor == UIColor.gray || r8c3Btn.backgroundColor == UIColor.black{
            r8c3Btn.backgroundColor = UIColor.white
            btnRow8Clicked[2] = true
        }else{
            r8c3Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[2] = false
        }
    }

    @objc func r8c4Action(sender: UIButton!) {
        if r8c4Btn.backgroundColor == UIColor.gray || r8c4Btn.backgroundColor == UIColor.black{
            r8c4Btn.backgroundColor = UIColor.white
            btnRow8Clicked[3] = true
        }else{
            r8c4Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[3] = false
        }
    }

    @objc func r8c5Action(sender: UIButton!) {
        if r8c5Btn.backgroundColor == UIColor.gray || r8c5Btn.backgroundColor == UIColor.black{
            r8c5Btn.backgroundColor = UIColor.white
            btnRow8Clicked[4] = true
        }else{
            r8c5Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[4] = false
        }
    }

    @objc func r8c6Action(sender: UIButton!) {
        if r8c6Btn.backgroundColor == UIColor.gray || r8c6Btn.backgroundColor == UIColor.black{
            r8c6Btn.backgroundColor = UIColor.white
            btnRow8Clicked[5] = true
        }else{
            r8c6Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[5] = false
        }
    }

    @objc func r8c7Action(sender: UIButton!) {
        if r8c7Btn.backgroundColor == UIColor.gray || r8c7Btn.backgroundColor == UIColor.black{
            r8c7Btn.backgroundColor = UIColor.white
            btnRow8Clicked[6] = true
        }else{
            r8c7Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[6] = false
        }
    }

    @objc func r8c8Action(sender: UIButton!) {
        if r8c8Btn.backgroundColor == UIColor.gray || r8c8Btn.backgroundColor == UIColor.black{
            r8c8Btn.backgroundColor = UIColor.white
            btnRow8Clicked[7] = true
        }else{
            r8c8Btn.backgroundColor = UIColor.gray
            btnRow8Clicked[7] = false
        }
    }

    
    @objc func r9c1Action(sender: UIButton!) {
        if r9c1Btn.backgroundColor == UIColor.gray || r9c1Btn.backgroundColor == UIColor.black{
            r9c1Btn.backgroundColor = UIColor.white
            btnRow9Clicked[0] = true
        }else{
            r9c1Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[0] = false
        }
    }

    @objc func r9c2Action(sender: UIButton!) {
        if r9c2Btn.backgroundColor == UIColor.gray || r9c2Btn.backgroundColor == UIColor.black{
            r9c2Btn.backgroundColor = UIColor.white
            btnRow9Clicked[1] = true
        }else{
            r9c2Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[1] = false
        }
    }

    @objc func r9c3Action(sender: UIButton!) {
        if r9c3Btn.backgroundColor == UIColor.gray || r9c3Btn.backgroundColor == UIColor.black{
            r9c3Btn.backgroundColor = UIColor.white
            btnRow9Clicked[2] = true
        }else{
            r9c3Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[2] = false
        }
    }

    @objc func r9c4Action(sender: UIButton!) {
        if r9c4Btn.backgroundColor == UIColor.gray || r9c4Btn.backgroundColor == UIColor.black{
            r9c4Btn.backgroundColor = UIColor.white
            btnRow9Clicked[3] = true
        }else{
            r9c4Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[3] = false
        }
    }

    @objc func r9c5Action(sender: UIButton!) {
        if r9c5Btn.backgroundColor == UIColor.gray || r9c5Btn.backgroundColor == UIColor.black{
            r9c5Btn.backgroundColor = UIColor.white
            btnRow9Clicked[4] = true
        }else{
            r9c5Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[4] = false
        }
    }

    @objc func r9c6Action(sender: UIButton!) {
        if r9c6Btn.backgroundColor == UIColor.gray || r9c6Btn.backgroundColor == UIColor.black{
            r9c6Btn.backgroundColor = UIColor.white
            btnRow9Clicked[5] = true
        }else{
            r9c6Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[5] = false
        }
    }

    @objc func r9c7Action(sender: UIButton!) {
        if r9c7Btn.backgroundColor == UIColor.gray || r9c7Btn.backgroundColor == UIColor.black{
            r9c7Btn.backgroundColor = UIColor.white
            btnRow9Clicked[6] = true
        }else{
            r9c7Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[6] = false
        }
    }

    @objc func r9c8Action(sender: UIButton!) {
        if r9c8Btn.backgroundColor == UIColor.gray || r9c8Btn.backgroundColor == UIColor.black{
            r9c8Btn.backgroundColor = UIColor.white
            btnRow9Clicked[7] = true
        }else{
            r9c8Btn.backgroundColor = UIColor.gray
            btnRow9Clicked[7] = false
        }
    }


    
    
    
    @objc func option1Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound1"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option2Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound2"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option3Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound3"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option4Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound4"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option5Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound5"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option6Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound18"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option7Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound7"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option8Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound8"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option9Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound9"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option10Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound10"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option11Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound11"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option12Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound12"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option13Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound13"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option14Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound14"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option15Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound15"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option16Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound16"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option17Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound17"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option18Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound19"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option19Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound20"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option20Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound21"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option21Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound22"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option22Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound23"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    @objc func option23Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound24"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }

    @objc func option24Action(sender: UIButton!) {
        guard id > 7 else {
            choose[id].option = "sound25"
            playSound(soundData: choose[id].option)
            dismiss()
            return
        }
    }
    
    func btnAction(){
        
        inputSound1Btn.addTarget(self, action: #selector(input1), for: .touchUpInside)
        inputSound2Btn.addTarget(self, action: #selector(input2), for: .touchUpInside)
        inputSound3Btn.addTarget(self, action: #selector(input3), for: .touchUpInside)
        inputSound4Btn.addTarget(self, action: #selector(input4), for: .touchUpInside)
        inputSound5Btn.addTarget(self, action: #selector(input5), for: .touchUpInside)
        inputSound6Btn.addTarget(self, action: #selector(input6), for: .touchUpInside)
        inputSound7Btn.addTarget(self, action: #selector(input7), for: .touchUpInside)
        inputSound8Btn.addTarget(self, action: #selector(input8), for: .touchUpInside)
        
        r1c1Btn.addTarget(self, action: #selector(r1c1Action), for: .touchUpInside)
        r1c2Btn.addTarget(self, action: #selector(r1c2Action), for: .touchUpInside)
        r1c3Btn.addTarget(self, action: #selector(r1c3Action), for: .touchUpInside)
        r1c4Btn.addTarget(self, action: #selector(r1c4Action), for: .touchUpInside)
        r1c5Btn.addTarget(self, action: #selector(r1c5Action), for: .touchUpInside)
        r1c6Btn.addTarget(self, action: #selector(r1c6Action), for: .touchUpInside)
        r1c7Btn.addTarget(self, action: #selector(r1c7Action), for: .touchUpInside)
        r1c8Btn.addTarget(self, action: #selector(r1c8Action), for: .touchUpInside)
        
        
        r2c1Btn.addTarget(self, action: #selector(r2c1Action), for: .touchUpInside)
        r2c2Btn.addTarget(self, action: #selector(r2c2Action), for: .touchUpInside)
        r2c3Btn.addTarget(self, action: #selector(r2c3Action), for: .touchUpInside)
        r2c4Btn.addTarget(self, action: #selector(r2c4Action), for: .touchUpInside)
        r2c5Btn.addTarget(self, action: #selector(r2c5Action), for: .touchUpInside)
        r2c6Btn.addTarget(self, action: #selector(r2c6Action), for: .touchUpInside)
        r2c7Btn.addTarget(self, action: #selector(r2c7Action), for: .touchUpInside)
        r2c8Btn.addTarget(self, action: #selector(r2c8Action), for: .touchUpInside)
        
        
        r3c1Btn.addTarget(self, action: #selector(r3c1Action), for: .touchUpInside)
        r3c2Btn.addTarget(self, action: #selector(r3c2Action), for: .touchUpInside)
        r3c3Btn.addTarget(self, action: #selector(r3c3Action), for: .touchUpInside)
        r3c4Btn.addTarget(self, action: #selector(r3c4Action), for: .touchUpInside)
        r3c5Btn.addTarget(self, action: #selector(r3c5Action), for: .touchUpInside)
        r3c6Btn.addTarget(self, action: #selector(r3c6Action), for: .touchUpInside)
        r3c7Btn.addTarget(self, action: #selector(r3c7Action), for: .touchUpInside)
        r3c8Btn.addTarget(self, action: #selector(r3c8Action), for: .touchUpInside)
        
        
        
        r4c1Btn.addTarget(self, action: #selector(r4c1Action), for: .touchUpInside)
        r4c2Btn.addTarget(self, action: #selector(r4c2Action), for: .touchUpInside)
        r4c3Btn.addTarget(self, action: #selector(r4c3Action), for: .touchUpInside)
        r4c4Btn.addTarget(self, action: #selector(r4c4Action), for: .touchUpInside)
        r4c5Btn.addTarget(self, action: #selector(r4c5Action), for: .touchUpInside)
        r4c6Btn.addTarget(self, action: #selector(r4c6Action), for: .touchUpInside)
        r4c7Btn.addTarget(self, action: #selector(r4c7Action), for: .touchUpInside)
        r4c8Btn.addTarget(self, action: #selector(r4c8Action), for: .touchUpInside)
        
        
        r5c1Btn.addTarget(self, action: #selector(r5c1Action), for: .touchUpInside)
        r5c2Btn.addTarget(self, action: #selector(r5c2Action), for: .touchUpInside)
        r5c3Btn.addTarget(self, action: #selector(r5c3Action), for: .touchUpInside)
        r5c4Btn.addTarget(self, action: #selector(r5c4Action), for: .touchUpInside)
        r5c5Btn.addTarget(self, action: #selector(r5c5Action), for: .touchUpInside)
        r5c6Btn.addTarget(self, action: #selector(r5c6Action), for: .touchUpInside)
        r5c7Btn.addTarget(self, action: #selector(r5c7Action), for: .touchUpInside)
        r5c8Btn.addTarget(self, action: #selector(r5c8Action), for: .touchUpInside)
        
        
        r6c1Btn.addTarget(self, action: #selector(r6c1Action), for: .touchUpInside)
        r6c2Btn.addTarget(self, action: #selector(r6c2Action), for: .touchUpInside)
        r6c3Btn.addTarget(self, action: #selector(r6c3Action), for: .touchUpInside)
        r6c4Btn.addTarget(self, action: #selector(r6c4Action), for: .touchUpInside)
        r6c5Btn.addTarget(self, action: #selector(r6c5Action), for: .touchUpInside)
        r6c6Btn.addTarget(self, action: #selector(r6c6Action), for: .touchUpInside)
        r6c7Btn.addTarget(self, action: #selector(r6c7Action), for: .touchUpInside)
        r6c8Btn.addTarget(self, action: #selector(r6c8Action), for: .touchUpInside)
        
        
        
        r7c1Btn.addTarget(self, action: #selector(r7c1Action), for: .touchUpInside)
        r7c2Btn.addTarget(self, action: #selector(r7c2Action), for: .touchUpInside)
        r7c3Btn.addTarget(self, action: #selector(r7c3Action), for: .touchUpInside)
        r7c4Btn.addTarget(self, action: #selector(r7c4Action), for: .touchUpInside)
        r7c5Btn.addTarget(self, action: #selector(r7c5Action), for: .touchUpInside)
        r7c6Btn.addTarget(self, action: #selector(r7c6Action), for: .touchUpInside)
        r7c7Btn.addTarget(self, action: #selector(r7c7Action), for: .touchUpInside)
        r7c8Btn.addTarget(self, action: #selector(r7c8Action), for: .touchUpInside)
        
        
        r8c1Btn.addTarget(self, action: #selector(r8c1Action), for: .touchUpInside)
        r8c2Btn.addTarget(self, action: #selector(r8c2Action), for: .touchUpInside)
        r8c3Btn.addTarget(self, action: #selector(r8c3Action), for: .touchUpInside)
        r8c4Btn.addTarget(self, action: #selector(r8c4Action), for: .touchUpInside)
        r8c5Btn.addTarget(self, action: #selector(r8c5Action), for: .touchUpInside)
        r8c6Btn.addTarget(self, action: #selector(r8c6Action), for: .touchUpInside)
        r8c7Btn.addTarget(self, action: #selector(r8c7Action), for: .touchUpInside)
        r8c8Btn.addTarget(self, action: #selector(r8c8Action), for: .touchUpInside)
        
        
        r9c1Btn.addTarget(self, action: #selector(r9c1Action), for: .touchUpInside)
        r9c2Btn.addTarget(self, action: #selector(r9c2Action), for: .touchUpInside)
        r9c3Btn.addTarget(self, action: #selector(r9c3Action), for: .touchUpInside)
        r9c4Btn.addTarget(self, action: #selector(r9c4Action), for: .touchUpInside)
        r9c5Btn.addTarget(self, action: #selector(r9c5Action), for: .touchUpInside)
        r9c6Btn.addTarget(self, action: #selector(r9c6Action), for: .touchUpInside)
        r9c7Btn.addTarget(self, action: #selector(r9c7Action), for: .touchUpInside)
        r9c8Btn.addTarget(self, action: #selector(r9c8Action), for: .touchUpInside)

        
        
        option1.addTarget(self, action: #selector(option1Action), for: .touchUpInside)
        option2.addTarget(self, action: #selector(option2Action), for: .touchUpInside)
        option3.addTarget(self, action: #selector(option3Action), for: .touchUpInside)
        option4.addTarget(self, action: #selector(option4Action), for: .touchUpInside)
        option5.addTarget(self, action: #selector(option5Action), for: .touchUpInside)
        option6.addTarget(self, action: #selector(option6Action), for: .touchUpInside)
        option7.addTarget(self, action: #selector(option7Action), for: .touchUpInside)
        option8.addTarget(self, action: #selector(option8Action), for: .touchUpInside)
        option9.addTarget(self, action: #selector(option9Action), for: .touchUpInside)
        option10.addTarget(self, action: #selector(option10Action), for: .touchUpInside)
        option11.addTarget(self, action: #selector(option11Action), for: .touchUpInside)
        option12.addTarget(self, action: #selector(option12Action), for: .touchUpInside)
        option13.addTarget(self, action: #selector(option13Action), for: .touchUpInside)
        option14.addTarget(self, action: #selector(option14Action), for: .touchUpInside)
        option15.addTarget(self, action: #selector(option15Action), for: .touchUpInside)
        option16.addTarget(self, action: #selector(option16Action), for: .touchUpInside)
        option17.addTarget(self, action: #selector(option17Action), for: .touchUpInside)
        option18.addTarget(self, action: #selector(option18Action), for: .touchUpInside)
        option19.addTarget(self, action: #selector(option19Action), for: .touchUpInside)
        option20.addTarget(self, action: #selector(option20Action), for: .touchUpInside)
        option21.addTarget(self, action: #selector(option21Action), for: .touchUpInside)
        option22.addTarget(self, action: #selector(option22Action), for: .touchUpInside)
        option23.addTarget(self, action: #selector(option23Action), for: .touchUpInside)
        option24.addTarget(self, action: #selector(option24Action), for: .touchUpInside)
        
        speedBtn.addTarget(self, action: #selector(speedAction), for: .touchUpInside)
        speed1Btn.addTarget(self, action: #selector(speed1Action), for: .touchUpInside)
        speed2Btn.addTarget(self, action: #selector(speed2Action), for: .touchUpInside)
        speed3Btn.addTarget(self, action: #selector(speed3Action), for: .touchUpInside)
        speed4Btn.addTarget(self, action: #selector(speed4Action), for: .touchUpInside)
        speed5Btn.addTarget(self, action: #selector(speed5Action), for: .touchUpInside)
        speed6Btn.addTarget(self, action: #selector(speed6Action), for: .touchUpInside)
        
        resetBtn.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
        
        helpBtn.addTarget(self, action: #selector(helpAction), for: .touchUpInside)
        
        closeBtn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        closeHelpBtn.addTarget(self, action: #selector(closeHelpAction), for: .touchUpInside)
    }

}

