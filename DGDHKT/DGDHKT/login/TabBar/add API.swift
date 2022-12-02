//
//  add API.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/03.
//

import Foundation
struct contentData: Decodable, Hashable {
    let status: String
    let message: String
    let data: contentDatas
}
struct contentDatas: Decodable, Hashable {
    let token: String
}

