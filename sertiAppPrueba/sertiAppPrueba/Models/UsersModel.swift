//
//  UsersModel.swift
//  sertiAppPrueba
//
//  Created by Cesar on 28/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation

// MARK: - GetUsers
struct GetUsers: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [DatUsr]?


    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - DatUsr
struct DatUsr: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: URL?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
