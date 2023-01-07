//
//  DescController.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 07/11/2022.
//

import UIKit

class DescController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = data {
            desc.text = person.desc
            let french       = DateFormatter()
            french.dateStyle = .medium
            french.timeStyle = .medium
            french.locale    = Locale(identifier: "FR-fr")
            Date.text = french.string(from: person.date)
        }
        else {
            desc.text = "error"
        }
    }
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var Date: UILabel!
    var data: ToDo?
}
