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
   
    enum CodingKeys : String, CodingKey {
            case id
            case name_ru
            case showingNow = "current"
            case image
      }
    
    var id: Int
    var name_ru: String
    var showingNow: ShowingNow?
    var image: String?
    
}
struct ShowingNow : Decodable{
    var desc: String
}
