//
//  ListTodo.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 06/12/2022.
//

import Foundation

class ListTodo{
    var liste: [ToDo] = []
    var nom: String
    
    init(liste: [ToDo], nom : String) {
        self.liste = liste
        self.nom = nom
    }

}
