//
//  ToDo.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-03-10.
//

import Foundation
class ToDo {
    
    var task: String
    var isUrgent : Bool
    var docID: String
    
    init(t: String, isU : Bool){
        task = t
        isUrgent = isU
        docID = ""
    }
   
    init(t: String, isU : Bool, dID: String){
        task = t
        isUrgent = isU
        docID = dID
    }
}
