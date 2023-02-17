//
//  mycell.swift
//  FirebaseProject
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit

class mycell: UITableViewCell {

    @IBOutlet weak var switchCell: UISwitch!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var firtImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
