//
//  ViewController.swift
//  ContactApplication
//
//  Created by SHILEI CUI on 3/19/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate{

    @IBOutlet weak var tblView: UITableView!
    
    
    @IBOutlet weak var searchBarOut: UISearchBar!
    var personOriginal = [PersonData(n: "", p: "", e: "", a: "", c: "")]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Master Controller"
        personOriginal = pdata
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "masterCell", for: indexPath)
        let obj = pdata[indexPath.row]
        cell.textLabel?.text = obj.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            let obj = pdata[indexPath.row]
            vc.personObj = obj
            vc.isNew = false
            //vc.delegate = self
            vc.didUpdateContactBlock = {(obj1, obj2) in
                vc.personObj = obj1 as? PersonData
                vc.isNew = obj2 as! Bool
                self.personOriginal = [obj1 as! PersonData]
                self.tblView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    func updateContactListList(personObjc: PersonData, isnewValue: Bool) {
//        if isnewValue{
//            pdata.append(personObjc)
//        }
//        tblView.reloadData()
//    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            //vc.delegate = self
            vc.didUpdateContactBlock = {(obj1, obj2) in
                if obj2 as! Bool{
                    pdata.append(obj1 as! PersonData)
                }
                self.personOriginal = pdata
                self.tblView.reloadData()
                
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        pdata = personOriginal
        tblView.reloadData()
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            pdata = personOriginal
            tblView.reloadData()
        }
        searchBar.text = searchText.uppercased()
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !(searchBar.text?.isEmpty)!{
            pdata = personOriginal.filter({($0.name?.uppercased().contains(searchBar.text!))!})
            tblView.reloadData()
        }
        searchBar.resignFirstResponder()
        
    }
    

}

