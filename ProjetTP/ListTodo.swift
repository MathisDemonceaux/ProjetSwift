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
    
    func add(todo: ToDo){
        self.liste.append(todo)
        
    }
    
    func remove(todo: ToDo){
        for i in 0...self.liste.count - 1 {
            if(liste[i].nom == todo.nom && liste[i].aFaire == todo.aFaire && liste[i].date == todo.date && liste[i].desc == todo.desc){
                print("suppr")
                liste.remove(at: i)
            }
        }
    }

}
