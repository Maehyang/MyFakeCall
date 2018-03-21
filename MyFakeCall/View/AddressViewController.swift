//
//  ViewController.swift
//  MyFakeCall
//
//  Created by Maehyang Lee on 2018. 3. 20..
//  Copyright © 2018년 Maehyang Lee. All rights reserved.
//

import UIKit

class AddressViewController: UITableViewController, UITabBarControllerDelegate {
    
    var addressmodel = AddressModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavBar()
        
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "검색"
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressmodel.contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = addressmodel.contacts(indexPath.row).name
        
        
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods

    // 셀 선택시 연결된 전화번호로 전화하는 화면으로 넘김
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

    

    
    
}

