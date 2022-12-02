//
//  tableview API.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/03.
//

import Foundation

public let decoder: JSONDecoder = JSONDecoder()

struct PostData: Decodable {
    var status: Int
    var message: String
    var data: [PostDatas]
}

struct PostDatas: Decodable {
    var postId: Int?
    var userName: String?
//    var isMine: Boolean?
    let title: String?
    var content: String?
    var comment: String?
}

struct HomeResponse: Decodable{
    var posts: [PostData]
}
