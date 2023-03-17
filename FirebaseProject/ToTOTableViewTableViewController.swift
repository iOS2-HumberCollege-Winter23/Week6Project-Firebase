//
//  ToTOTableViewTableViewController.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-03-10.
//

import UIKit

class ToToTableViewController: UITableViewController {

    @IBAction func addNewTodo(_ sender: Any) {
        var alert = UIAlertController(title: "Add New ToDo", message: "Enter the new task", preferredStyle: .alert)
        
        var taskTextField = UITextField()
       
        alert.addTextField { text in
            taskTextField.placeholder = "Enter the task!"
            taskTextField = text
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { alert in
        
            
            var newTask = ToDo(t: taskTextField.text!, isU: true)
            
            // insert into firebase
            FireBaseService.shared.insertIntoFirestore(t: newTask)
            self.updateUI()
            
        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
        
    }
    
    func updateUI(){
        
        FireBaseService.shared.getAllToDos { list in
            FireBaseService.shared.allToDos = list
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FireBaseService.shared.allToDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = FireBaseService.shared.allToDos[indexPath.row].task

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            FireBaseService.shared.deleteOneToDo(todelete: FireBaseService.shared.allToDos[indexPath.row])
            updateUI()
            
            
            
        }
    }
    

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
