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

class AddressViewController: UITableViewController {
    
    var addressArray = [AddressModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        fetchContacts()

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        setupNavBar()
//        fetchContacts()
//    }
    
    
    //MARK: - Setup Navigation Bar
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "검색"
        
        print("Setup Nav Bar Success!")
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

                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        print("viewForHeadeInSection Success!")

        let label = UILabel()
        label.text = "  Header"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor.init(hexString: "#f2f2f2")

        label.tag = section

        return label
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

        return cell
    }

    
    //MARK: - TableView Delegate Methods

    // 셀 선택시 연결된 전화번호로 전화하는 화면으로 넘김
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

    
}

