//
//  ViewController.swift
//  ProjetTP
//
//  Created by Mathis Demonceaux on 07/11/2022.
//

import UIKit

class ViewToDo: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.name.text = filteredMyData[indexPath.row].nom
        cell.SwitchValue.setOn(filteredMyData[indexPath.row].aFaire, animated: true)
        cell.SwitchValue.tag = indexPath.row
        return cell
    }
    
    @IBOutlet var barreRecherche: UISearchBar!
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMyData = []
        print("test")
        for faire in myData
        {
            if searchText == ""
            {
                filteredMyData = myData
            }
            if faire.nom.contains(searchText.lowercased())
            {
                filteredMyData.append(faire)
            }
        }
        tableVue.reloadData()
    }

    
    @IBOutlet weak var tableVue: UITableView!

    var myData: [ToDo] = []
    var data: ListTodo?
    var filteredMyData:[ToDo] = []


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(myData[indexPath.row].desc)
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVue.dataSource = self
        barreRecherche.delegate = self
        // Do any additional setup after loading the view.
        if let valeur  = data{
            for todo in valeur.liste
            {
                myData.append(todo)
                filteredMyData.append(todo)
                print("sucess")
            }
            
        }
        else{
            
            let d = ToDo(nom: "error", desc: "error")
            myData.append(d)
            filteredMyData.append(d)
        }
        myData.sort{$0.date.description < $1.date.description}
        tableVue.reloadData()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DescController{
            let row = tableVue.indexPathForSelectedRow!.row
            vc.data = filteredMyData[row]
        }
    }
    
    
    
    
    
    @IBAction func add(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddController{
            if let nameActivity = vc.AddNewNameActivity, let descActivity = vc.AddNewDescActivity, let dateActivity = vc.AddNewDateActivity {
                if (!nameActivity.text!.isEmpty) {
                    let newTodo = ToDo(nom: nameActivity.text!, desc: descActivity.text!, date: dateActivity.date)
                        myData.append(newTodo)
                    myData.sort{$0.date.description < $1.date.description}
                        tableVue.reloadData()
                    }

                }
                
            }
        }

    
@IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
    if let vc = unwindSegue.source as? AddController {
        vc.dismiss(animated: true, completion: nil)
    }
}
    
    @IBAction func supprimerActivite(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? DescController{
            let row = tableVue.indexPathForSelectedRow!.row
            myData.remove(at: row)
            filteredMyData.remove(at: row)
            myData.sort{$0.date.description < $1.date.description}
            tableVue.reloadData()
        }
    }
    
    
    @IBAction func ClickSwitch(_ sender: UISwitch) {
        let row = sender.tag
        myData[row].aFaire = sender.isOn
    }
    

    

}




	
