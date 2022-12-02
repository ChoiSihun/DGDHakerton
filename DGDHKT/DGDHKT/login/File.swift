//
//  SignupAPI.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/03.
//

import Foundation
struct signupData: Decodable, Hashable {
    let status: Int
    let message: String
    let data: LoginDatas
}

struct signupDatas: Decodable, Hashable {
    let token: String
}
