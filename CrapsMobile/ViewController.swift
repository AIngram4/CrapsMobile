//
//  ViewController.swift
//  CrapsMobile
//
//  Created by Andrew Ingram on 2017-05-18.
//  Copyright © 2017 Sabring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    var gc: GameController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gc = GameController(vc: self)
        
        
        
    }

    @IBAction func rollButtonPressed(_ sender: Any){
        gc.gamePlay()
        
    }
    


}

