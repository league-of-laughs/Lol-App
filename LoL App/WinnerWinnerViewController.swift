//
//  WinnerWinnerViewController.swift
//  LoL App
//
//  Created by Carlos Neira on 2/3/19.
//  Copyright © 2019 Neitek. All rights reserved.
//

import UIKit
import SocketIO

class WinnerWinnerViewController: UIViewController {

    @IBOutlet var labelWinner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelWinner.text = "\(String(describing: ViewControllerDecideVictor.GlobalVariable.winnerName))"
        
        socket.on("restart") {data, ack in
            self.performSegue(withIdentifier: "restart", sender: self)
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
