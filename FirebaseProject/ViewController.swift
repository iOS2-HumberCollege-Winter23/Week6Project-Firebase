//
//  ViewController.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mytable: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let db = Firestore.firestore()

      
    }
  
    func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
        return 5
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! mycell
        
//        cell.firtImg.image
//        cell.secondImg
//        cell.switchCell
//
        return cell
        
    }
    

}

