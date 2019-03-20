//
//  SecondViewController.swift
//  ContactApplication
//
//  Created by SHILEI CUI on 3/19/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

//protocol firstClassDelegate: class {
//    //delegate required method
//    func updateContactListList(personObjc : PersonData, isnewValue: Bool)
//}

public typealias UpdateContactBlock = (_ obj1 : Any, _ obj2 : Any) -> ()

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var tblView: UITableView!
    var personObj : PersonData?
    var isNew : Bool = true
    
    var didUpdateContactBlock : UpdateContactBlock?
    //var delegate : firstClassDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNew{
            personObj = PersonData(n: "", p: "", e: "", a: "", c: "")
        }
        title = "Detail Controller"
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! CustomTableViewCell
        cell.txtField.tag = indexPath.row
        switch cell.txtField.tag {
        case 0:
            cell.txtField.placeholder = "Name"
            cell.txtField?.text = personObj?.name
        case 1:
            cell.txtField.placeholder = "Email"
            cell.txtField?.text = personObj?.Email
        case 2:
            cell.txtField.placeholder = "Phone"
            cell.txtField?.text = personObj?.phone
        case 3:
            cell.txtField.placeholder = "Address"
            cell.txtField?.text = personObj?.address
        case 4:
            cell.txtField.placeholder = "Company"
            cell.txtField?.text = personObj?.company
        default:
            print("do nothing")
        }
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            personObj?.name = textField.text
        case 1:
            personObj?.phone = textField.text
        case 2:
            personObj?.Email = textField.text
        case 3:
            personObj?.address = textField.text
        case 4:
            personObj?.company = textField.text
        default:
            print("Do nothing")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        //to avoid last textfield not trigger textfieldDidEndEditing
        view.endEditing(true)
        
        didUpdateContactBlock?(personObj!, isNew)
        //tblView.reloadData()
        //delegate?.updateContactListList(personObjc: personObj!, isnewValue: isNew)
        
        navigationController?.popViewController(animated: true)
    }
}
