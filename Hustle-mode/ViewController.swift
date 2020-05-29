//
//  ViewController.swift
//  Hustle-mode
//
//  Created by Urmat on 5/8/19.
//  Copyright © 2019 Asia Store. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")! //Указываем файл который нам нужен и где он находится
        let url = URL(fileURLWithPath: path)//Нахождение файла
        do{
            player = try AVAudioPlayer(contentsOf: url) //Присваивание файла hustle-on.wav к переменной player
            player.prepareToPlay() //Подготавливаенм к воспроизведению
        }
        catch let error as NSError {
            print (error.description)
        }
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3 /* Длительность анимации */ , animations: {
            self.rocket.frame = CGRect (x: 20, y: 140, width: 375, height: 402) // Движение ракеты
        }) { (finished) in // При прохождение анимации
            self.hustleLbl.isHidden = false// Показываем надпись hustle mode
            self.onLbl.isHidden = false// Показыввем надпись On
        }
    }
}

