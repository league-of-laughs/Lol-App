//
//  ViewController.swift
//  LoL App
//
//  Created by Carlos Neira on 2/1/19.
//  Copyright © 2019 Neitek. All rights reserved.
//

import UIKit
import SocketIO

let manager = SocketManager(socketURL: URL(string: "https://af7af856.ngrok.io/")!, config: [.log(true), .compress])
let socket = manager.defaultSocket

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextBox: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameTextBox.delegate = self
        nameTextBox.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        submitButton.layer.cornerRadius = 8
        submitButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
        
        print("Loaded")
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected");
            //socket.emit("mobile-addPlayer", "Bob sagget");
        }
        socket.on("mobile-start") {data, ack in
            print("Conntect i guess");
        }
        
        submitButton.addTarget(self, action:#selector (self.buttonClicked), for: .touchUpInside)
        
        
        socket.connect()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func buttonClicked() {
        let userName = String(nameTextBox.text!);
        print("\(userName)");
        socket.emit("mobile-addPlayer", "\(userName)");
        
    }
    
    //UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return pressed")
        nameTextBox.resignFirstResponder()
        return true
    }
    
}

