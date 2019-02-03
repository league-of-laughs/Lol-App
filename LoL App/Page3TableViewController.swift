//
//  Page3TableViewController.swift
//  LoL App
//
//  Created by Jai Jethani on 2/2/19.
//  Copyright © 2019 Neitek. All rights reserved.
//

import UIKit

class Page3TableViewController: UITableViewController {
    let imageUrl = URL(string: "https://www.memecreator.org/static/images/memes/4220286.jpg")!
    @IBOutlet var memeBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage(with: imageUrl)
        
    }
    
    
    func downloadImage(with url: URL){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print("Error!")
                return
            }
            DispatchQueue.main.async {
                self.memeBox.image = UIImage(data: data!)
            }
            }.resume()
    }
    
    
    
    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


