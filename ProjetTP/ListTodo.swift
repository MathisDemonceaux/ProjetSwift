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
        var fin = false
        var index:Int = 0
        while (index < self.liste.count-1 && fin == false ){
            index = index + 1
            if(liste[index].nom == todo.nom && liste[index].aFaire == todo.aFaire && liste[index].date == todo.date && liste[index].desc == todo.desc){
                print("suppr")
                liste.remove(at: index)
                fin = true

        }
    }

        }

}
