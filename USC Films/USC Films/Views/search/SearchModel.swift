//
//  SearchModel.swift
//  USC Films
//
//  Created by Key on 2021/4/24.
//

import Foundation
import Alamofire
import SwiftyJSON
class SearchModel: ObservableObject {
    private let baseurl:String = "https://csci571-backend-jingjizang.azurewebsites.net/apis/searchs/"
//    private let baseurl:String = "http://localhost:8000/apis/searchs/"
    @Published var searchResult = [mediaData]()
    @Published var query = ""
    @Published var noResult:Bool = false
    func search(){
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        AF.request(baseurl+searchQuery).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let codes = json["results"].array {
                    DispatchQueue.main.async {
                        self.searchResult = [mediaData]()
                        
                        for eachCode in codes {
                            self.noResult = false
                            if eachCode["backdrop_path"] != JSON.null {
                                if eachCode["media_type"].stringValue == "movie"{
                                    
                                    self.searchResult.append(mediaData(id:eachCode["id"].intValue,media_type:eachCode["media_type"].stringValue,backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["title"].stringValue,release_date:eachCode["release_date"].stringValue,average_rate: eachCode["vote_average"].doubleValue))
                                }else{
                                    self.searchResult.append(mediaData(id:eachCode["id"].intValue,media_type:eachCode["media_type"].stringValue,backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["name"].stringValue,release_date:eachCode["first_air_date"].stringValue,average_rate: eachCode["vote_average"].doubleValue))
                                }
                            }
                            
                            
                        }
                        if self.searchResult.count == 0{
                            self.noResult = true
                        }else{
                            self.noResult = false
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
//        print(searchResult)
    }
}
