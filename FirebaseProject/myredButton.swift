//
//  myredButton.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit
import CoreGraphics

class myredButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder : NSCoder) {
        super.init(coder: coder)!
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.height/2
    }
    
}
