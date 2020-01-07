//
//  TableTableViewController.swift
//  Pull To Refresh
//
//  Created by clicklabs on 03/01/20.
//  Copyright © 2020 clicklabs. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
 var names = ["Shiva", "Udit", "Piyush", "Komal", "Sandeep"]
    var receiveArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func refreshTriggered(_ sender: UIRefreshControl) {
       
        if(receiveArray.count < names.count)
        {
            let randomName = receiveArray.count
               
                     receiveArray.append(names[randomName])
                        sender.endRefreshing()
                        tableView.reloadData()
        }
        
        else{
            
            let alert = UIAlertController(title: "Alert", message: "Don't pull and refresh now", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))

            self.present(alert, animated: true)

            
        }
     
        
   
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return receiveArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let nameCell = receiveArray[indexPath.row]
        cell.textLabel?.text = nameCell
        return cell
    }
    
}
