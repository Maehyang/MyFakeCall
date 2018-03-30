//
//  ViewController.swift
//  MyFakeCall
//
//  Created by Maehyang Lee on 2018. 3. 20..
//  Copyright © 2018년 Maehyang Lee. All rights reserved.
//

import UIKit
import Contacts
import ChameleonFramework

//protocol CellNameDelegate {
//    func userNamePressed(name: String)
//}


class AddressViewController: UITableViewController, UISearchResultsUpdating {

//    var delegate: CellNameDelegate?
    var addressArray = [AddressModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        fetchContacts()
    }
    
    
    //MARK: - Setup Navigation Bar
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "검색"
        searchController.searchResultsUpdater = self
        
        print("Setup Nav Bar Success!")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        let fullName = addressArray.con
//        self.addressArray.filter { (fullName: String) -> Bool in
//            <#code#>
//        }
    }
    
    
    //MARK: - Fetch Contacts: Name & PhoneNumbers
    
    private func fetchContacts() {
        print("Attempting to fetch contacts today")

        let store = CNContactStore()
        
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to request access:", err)
                return
            }
            if granted {
                print("Access granted")

                let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey] as [Any]
                let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])

                request.sortOrder = CNContactSortOrder.userDefault

                do {
                    var addressContact = [AddressContact]()

                    try store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                        addressContact.append(AddressContact(contact: contact))
                    })
                    let nameAndPhone = AddressModel(nameAndPhone: addressContact)
                    self.addressArray = [nameAndPhone]

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } catch let err {
                    print("Failed to enumerate contacts:", err)
                }
            } else {
                print("Access denied..")
            }
        }
    }
    
    
    //MARK: - TableView Section Control

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

//        let label = UILabel()
////        label.text = "\(section)"
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.backgroundColor = UIColor.init(hexString: "#f2f2f2")
//
//        label.tag = section
//
//        return label
//    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        let fistLetters = addressArray.map { $0.nameAndPhone}

        
        return "Section \(section)"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.addressArray.count
    }

    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addressArray[section].nameAndPhone.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let nameAndPhone = addressArray[indexPath.section].nameAndPhone[indexPath.row]
        
        let fullName = nameAndPhone.contact.familyName + nameAndPhone.contact.givenName
        cell.textLabel?.text = fullName
        
//        delegate?.userNamePressed(name: cell.textLabel?.text)
        
        return cell
    }

    
    //MARK: - Perform Segue to SendingViewController

    // 셀 선택시 연결된 전화번호로 전화하는 화면으로 넘김
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SendingCall", sender: self)
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendingCall" {
            let nextScene = segue.destination as! SendingCallViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let nameOfSelectedPerson = addressArray[indexPath.section].nameAndPhone[indexPath.row].contact.familyName + addressArray[indexPath.section].nameAndPhone[indexPath.row].contact.givenName
                
                print(nameOfSelectedPerson) // 여기까지는 됨
//                nextScene.nameLabel?.text = nameOfSelectedPerson
                nextScene.preName = nameOfSelectedPerson
            }
            
            
            
//
//        if let indexPath == tableView.indexPathForSelectedRow {
//            let nameOfSelectedPerson = addressArray[indexPath.section].nameAndPhone[indexPath.row].contact.familyName + addressArray[indexPath.section].nameAndPhone[indexPath.row].contact.givenName
//            //            nextScene.nameLable?.text = nameOfSelectedPerson
//            //
//            print(nameOfSelectedPerson)
//            //            print("\(nextScene.NameLable?.text)")
//        }
    }
    }

}
