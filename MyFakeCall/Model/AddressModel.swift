//
//  AddressModel.swift
//  MyFakeCall
//
//  Created by Maehyang Lee on 2018. 3. 20..
//  Copyright © 2018년 Maehyang Lee. All rights reserved.
//

import Foundation
import Contacts

struct AddressModel { //var addressmodel
    let nameAndPhone: [AddressContact]
}

struct AddressContact {
    let contact: CNContact
}
