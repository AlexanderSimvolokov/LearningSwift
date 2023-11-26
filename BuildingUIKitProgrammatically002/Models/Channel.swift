//
//  Channel.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 26.11.2023.
//

import Foundation

struct ResponseData: Decodable {
    var channels: [Channel]
}
struct Channel : Decodable {
    var id: Int
    var name_ru: String
    var current: Current
    var image: String
}
struct Current : Decodable{
    var desc: String
}
