//
//  ViewController.swift
//  LoL App
//
//  Created by Carlos Neira on 2/1/19.
//  Copyright © 2019 Neitek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextBox: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameTextBox.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        submitButton.layer.cornerRadius = 8
        submitButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

