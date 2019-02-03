//
//  VoteRoomViewController.swift
//  LoL App
//
//  Created by Carlos Neira on 2/3/19.
//  Copyright © 2019 Neitek. All rights reserved.
//
import SocketIO
import UIKit

class VoteRoomViewController: UIViewController {
    struct GlobalVariable{
        static var winnerName2:String?
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        socket.on("mobile-startVoting") {data, ack in
            self.performSegue(withIdentifier: "backVote", sender: self)
        }
        
        socket.on("gameWinner") {data, ack in
            GlobalVariable.winnerName2 = data as? String;
            self.performSegue(withIdentifier: "chickenDinner", sender: self)
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

}
