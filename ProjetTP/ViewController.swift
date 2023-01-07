//
//  ViewController.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 06/12/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMyData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCellMain
        cell.NameCategory.text = filteredMyData[indexPath.row].nom
        cell.NbelementCategory.text = filteredMyData[indexPath.row].liste.count.description
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVue.dataSource = self
        tableVue.delegate = self
        barreRecherche.delegate = self
        }

    @IBOutlet var barreRecherche: UISearchBar!

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMyData = []
        for category in myData
        {
            if searchText == ""
            {
                filteredMyData = myData
            }
            if category.nom.contains(searchText.lowercased())
            {
                filteredMyData.append(category)
            }
        }
        tableVue.reloadData()
    }
    
    @IBOutlet weak var tableVue: UITableView!
    var myData: [ListTodo]  = []
    var filteredMyData: [ListTodo] = []

    @IBAction func add(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddListController{
            if let nomListe = vc.NomListe{
                if(!nomListe.text!.isEmpty){
                    let liste = ListTodo(liste: [], nom: nomListe.text!)
                    myData.append(liste)
                    filteredMyData.append(liste)
                    tableVue.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewToDo{
            let row = tableVue.indexPathForSelectedRow!.row
            vc.data = filteredMyData[row]
            vc.MainController = self
        }
        
    }
    override func viewDidAppear(_ animated: Bool) { 
             tableVue.reloadData()
    }
    

}
