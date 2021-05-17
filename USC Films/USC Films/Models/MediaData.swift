//
//  MediaData.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import Foundation
struct mediaData:Identifiable,Hashable,Codable{
    var id:Int
    var media_type:String
    var backdrop_path:String
    var poster_path:String
    var title:String
    var release_date:String
    var average_rate:Double
//    var isAdd:Bool = false
}
