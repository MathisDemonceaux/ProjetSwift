//
//  TableViewCell.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 07/11/2022.
//

import UIKit


class TableViewCellMain: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var NameCategory: UILabel!
    
    @IBOutlet weak var NbelementCategory: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}
