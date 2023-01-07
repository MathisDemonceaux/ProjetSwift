//
//  TableViewCell.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 07/11/2022.
//

import UIKit


class TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var SwitchValue: UISwitch!
    @IBOutlet weak var name: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}
