//
//  ViewControllerMakeMeme.swift
//  LoL App
//
//  Created by Jai Jethani on 2/2/19.
//  Copyright © 2019 Neitek. All rights reserved.
//
import SocketIO
import UIKit
var datas = [Data]()
class ViewControllerMakeMeme: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var memeImageBox: UIImageView!
    @IBOutlet var submitMeme: UIButton!
    @IBOutlet var bottomMemeComment: UITextField!
    @IBOutlet var topMemeComment: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        topMemeComment.delegate = self
        bottomMemeComment.delegate = self
        
        let urlString: String = (Page2ViewController.GlobalVariable.imageUrl?.absoluteString)!;
        
        let start = urlString.index(urlString.startIndex, offsetBy: 3)
        let end = urlString.index(urlString.endIndex, offsetBy: -3)
        let range = start..<end
        let mySubstring = urlString[range]  // play
        let myString = String(mySubstring)
        let fileUrl = URL(string: "\(myString)")!
        
        downloadImage(with: fileUrl)
        
        submitMeme.addTarget(self, action:#selector (self.buttonClicked), for: .touchUpInside)
        
    }
    func downloadImage(with url: URL){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print("Error!")
                return
            }
            DispatchQueue.main.async {
                self.memeImageBox.image = UIImage(data: data!)
            }
            }.resume()
    }
    
    @objc func buttonClicked() {
        let topC = String(topMemeComment.text!);
        let bottomC = String(bottomMemeComment.text!);
        let nameO = String(describing: ViewController.GlobalVariable.userName)
        let data = Data(name: nameO, topText: topC, bottomText: bottomC)
        
        socket.emit("mobile-uploadMeme", "\(data)")
        
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topMemeComment.resignFirstResponder()
        bottomMemeComment.resignFirstResponder()
        return true
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
struct Data {
    var name :String
    var topText :String
    var bottomText :String
    
    init(name: String, topText: String, bottomText: String){
        self.name = name
        self.bottomText = bottomText
        self.topText = topText
        datas.append(self)
    }
}
