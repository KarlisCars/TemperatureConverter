//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Karlis Cars on 29/10/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var folderBar: UIBarButtonItem!
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var farhenheitLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider!{
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        farhenheitLabel.text = "32 F"
        darkModeStyle()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    override func viewDidLayoutSubviews() {
        darkModeStyle()
    }
    
    @objc func appMovedToBackground(){
        print("appMovedToBackGround")
        
    }
    @objc func appMovedtoForeground(){
        print("appMovedtoForeground")
    }
    func darkModeStyle(){
        if self.traitCollection.userInterfaceStyle == .light{
            print("Light mode")
            folderBar.tintColor = UIColor.black
        }else{
            folderBar.tintColor = UIColor.white
            tempSlider.maximumTrackTintColor = UIColor.white
            
            print("Dark mode")
        }
        
    }
    
    @IBAction func tempSlider(_ sender: UISlider, forEvent event: UIEvent) {
        let tempCelsius = Int(sender.value)
            celsiusLabel.text = "\(tempCelsius) C"
        let tempFarhenheit = Int((sender.value * 9 / 5) + 32)
        farhenheitLabel.text = "\(tempFarhenheit) F"
    }
    
    
    
}

