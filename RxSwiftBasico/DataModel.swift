//
//  DataModel.swift
//  RxSwiftBasico
//
//  Created by Edmilson vieira da silva on 14/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation

struct Datamodel: Codable {
  
  let page: Int?
  let per_page: Int?
  let total: Int?
  let total_page: Int?
  let data: [UserDetails]?
}

struct UserDetails: Codable {
  let id: Int?
  let email: String?
  let first_name: String?
  let last_name: String?
  let avatar: String?
}
