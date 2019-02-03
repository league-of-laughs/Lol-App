//
//  ViewControllerDecideVictor.swift
//  LoL App
//
//  Created by Jai Jethani on 2/2/19.
//  Copyright © 2019 Neitek. All rights reserved.
//

import UIKit
import SocketIO
var datasVote = [VoteData]()
class ViewControllerDecideVictor: UIViewController {
    
    struct GlobalVariable{
        static var winnerName:String?
    }

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button1.addTarget(self, action:#selector (self.buttonClicked1), for: .touchUpInside)
        
        
        button2.addTarget(self, action:#selector (self.buttonClicked2), for: .touchUpInside)
        
        socket.on("gameWinner") {data, ack in
            GlobalVariable.winnerName = data as? String;
            self.performSegue(withIdentifier: "moveWinner", sender: self)
        }
    }
    
    
    @objc func buttonClicked1() {
        
        let nameV = String(describing: ViewController.GlobalVariable.userName)
        
        let data = VoteData(name: nameV, vote: 1)
        
        socket.emit("mobile-voteMeme", "\(data)")
        
    }
    
    @objc func buttonClicked2() {
        
        let nameV = String(describing: ViewController.GlobalVariable.userName)
        
        let data = VoteData(name: nameV, vote: 2)
        
        socket.emit("mobile-voteMeme", "\(data)")
        
    }
    

}
struct VoteData {
    var name :String
    var vote : Int
    
    init(name: String, vote: Int){
        self.name = name
        self.vote = vote
        datasVote.append(self)
    }
}
