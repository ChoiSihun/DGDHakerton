//
//  signinAPI.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import Foundation
 
struct LoginData: Decodable, Hashable {
    let status: Int
    let message: String
    let data: LoginDatas
}

struct LoginDatas: Decodable, Hashable {
    let token: String
}

