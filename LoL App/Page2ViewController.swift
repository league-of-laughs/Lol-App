//
//  Page2ViewController.swift
//  LoL App
//
//  Created by Jai Jethani on 2/2/19.
//  Copyright © 2019 Neitek. All rights reserved.
//
import SocketIO
import UIKit

var overlayView = UIView()
var activityIndicator = UIActivityIndicatorView()

class Page2ViewController: UIViewController {
    struct GlobalVariable{
        static var imageUrl: URL?
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected");
            //socket.emit("mobile-addPlayer", "Bob sagget");
        }
        
        socket.on("mobile-start") {data, ack in
            GlobalVariable.imageUrl = URL(string: "\(data)")!
            self.performSegue(withIdentifier: "toMake", sender: self)

        }
        
    }
   
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

