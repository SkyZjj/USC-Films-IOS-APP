//
//  Fetch.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI
class Fetch:ObservableObject{
    @Published var currentPlayMovies = [mediaData]()
    @Published var topRatedMovies = [mediaData]()
    @Published var popularMovies = [mediaData]()
    @Published var trendingTVShows = [mediaData]()
    @Published var topRatedTVShows = [mediaData]()
    @Published var popularTVShows = [mediaData]()
    @Published var isFetched:Bool = false
    private let baseurl:String = "https://csci571-backend-jingjizang.azurewebsites.net/apis/"
//    private let baseurl:String = "http://localhost:8000/apis/"
    init(){
        FetchAll()

    }
    func FetchAll(){
        AF.request(baseurl+"currentPlayMovies").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let codes = json["results"].array {
                    for eachCode in codes {
                        self.currentPlayMovies.append(mediaData(id:eachCode["id"].intValue,media_type:"movie",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["title"].stringValue,release_date:eachCode["release_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                    }
                }
            case .failure(let error):
                print(error)
        
        
            }
            AF.request(self.baseurl+"topRatedMovies").responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let codes = json["results"].array {
                        for eachCode in codes.prefix(20) {
                            self.topRatedMovies.append(mediaData(id:eachCode["id"].intValue,media_type:"movie",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["title"].stringValue,release_date:eachCode["release_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                        }
                    }
                case .failure(let error):
                    print(error)
            
            
                }
                AF.request(self.baseurl+"popularMovies").responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        if let codes = json["results"].array {
                            for eachCode in codes.prefix(20) {
                                self.popularMovies.append(mediaData(id:eachCode["id"].intValue,media_type:"movie",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["title"].stringValue,release_date:eachCode["release_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                            }
                        }
                    case .failure(let error):
                        print(error)
                
                
                    }
                    AF.request(self.baseurl+"topRatedTVShows").responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            if let codes = json["results"].array {
                                for eachCode in codes.prefix(20) {
                                    self.topRatedTVShows.append(mediaData(id:eachCode["id"].intValue,media_type:"tv",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["name"].stringValue,release_date:eachCode["first_air_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                                }
                            }
                        case .failure(let error):
                            print(error)
                    
                    
                        }
                        AF.request(self.baseurl+"trendingTVShows").responseJSON { response in
                            switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                if let codes = json["results"].array {
                                    for eachCode in codes {
                                        self.trendingTVShows.append(mediaData(id:eachCode["id"].intValue,media_type:"tv",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["name"].stringValue,release_date:eachCode["first_air_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                                    }
                                }
                            case .failure(let error):
                                print(error)
                        
                        
                            }
                            AF.request(self.baseurl+"popularTVShows").responseJSON { response in
                                switch response.result {
                                case .success(let value):
                                    let json = JSON(value)
                                    if let codes = json["results"].array {
                                        for eachCode in codes.prefix(20) {
                                            self.popularTVShows.append(mediaData(id:eachCode["id"].intValue,media_type:"tv",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:eachCode["poster_path"].stringValue,title:eachCode["name"].stringValue,release_date:eachCode["first_air_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                                        }
                                    }
                                case .failure(let error):
                                    print(error)
                            
                            
                                }
                                self.isFetched = true
                            }
                        }
                    }
                }
            }
        }
        
    }
    
}
