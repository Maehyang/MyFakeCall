//
//  AddressModel.swift
//  MyFakeCall
//
//  Created by Maehyang Lee on 2018. 3. 20..
//  Copyright © 2018년 Maehyang Lee. All rights reserved.
//

import Foundation
import Contacts

class AddressModel {
    
    var store = CNContactStore()
    var contacts = [CNContact]()
    
    let name = CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
    let phoneNumber = CNContactPhoneNumbersKey as CNKeyDescriptor

    
//    func addressData() {
//        let keys = [name, phoneNumber]
//        let request = CNContactFetchRequest(keysToFetch: keys)
//
//        store.requestAccess(for: .contacts) {(granted, err) in
//            if(granted) {
//                do {
//                    try self.store.enumerateContacts(with: request) {(contact, stop) in
//                        if !contact.phoneNumbers.isEmpty {
//                            contacts.append(contentsOf: contact)
//                        }
//                    }
//                    for info in contacts {
//                        guard let phone = info.phone
//                    }
//            }
//        }
//
//        do {
//            try store.enumerateContacts(with: request) { (contact, stop) in
//                self.contacts.append(contact)
//            }
//        } catch {
//            print("Error saving fullName \(error)")
//        }
        
    

}
