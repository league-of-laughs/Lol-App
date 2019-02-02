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

class ViewController: UIViewController {
    @IBOutlet var nameTextBox: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    
    var nameText  = "Mike";
    
    func buttonCicked() {
            
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameTextBox.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        submitButton.layer.cornerRadius = 8
        submitButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        //submitButton.addTarget(self, action: "buttonClicked", for: .touchUpInside)
       
        print("Loaded")
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected");
            socket.emit("mobile-addPlayer", "Bob sagget");
            
        }
        socket.on("ios") {data, ack in
            print("Conntect i guess");
            
        }
        
        
        
        
        socket.connect()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

