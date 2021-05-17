//
//  DetailData.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import Foundation

struct Cast:Hashable, Codable, Identifiable{
    var id:Int
    var name:String
    var profile_path:String
}
struct Review:Hashable, Codable, Identifiable {
    var id:String
    var username: String
    var date_of_review:String
    var rating:String
    var content:String
}
