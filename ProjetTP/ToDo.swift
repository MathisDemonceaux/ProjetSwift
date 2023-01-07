//
//  ToDo.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 07/11/2022.
//

import Foundation

class ToDo {
    var nom: String
    var desc: String
    var aFaire: Bool
    var date: Date = Date.init()
    
    init(nom: String, desc: String) {
        self.nom = nom
        self.desc = desc
        self.aFaire = false
    }
    
    init(nom:String,desc: String, date:Date){
        self.nom = nom
        self.desc = desc
        self.aFaire = false
        self.date = date
    }
}
