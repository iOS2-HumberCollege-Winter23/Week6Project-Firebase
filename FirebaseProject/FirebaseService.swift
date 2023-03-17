//
//  FirebaseService.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-03-10.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class FireBaseService {
   
    static var shared = FireBaseService()
    var allToDos = [ToDo]()
    
    
    let db = Firestore.firestore()
    
    func insertIntoFirestore(t : ToDo) {
        var ref: DocumentReference? = nil
       
        ref = db.collection("AllToDos").addDocument(data: ["task":t.task,"isUrgent": true])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func getAllToDos(completionHandler : @escaping ([ToDo])->Void){
        
        var allTodoFormFirebase = [ToDo]()
        db.collection("AllToDos").getDocuments { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    var dID = document.documentID
                    var t = document.data()["task"] as! String
                    var b = document.data()["isUrgent"] as! Bool
                    allTodoFormFirebase.append(ToDo(t: t,isU: b, dID: dID))
                }
                completionHandler(allTodoFormFirebase)
            }
        }
                        }
    
    
    func deleteOneToDo(todelete : ToDo){
        
        db.collection("AllToDos").document(todelete.docID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    
    }
    
    

