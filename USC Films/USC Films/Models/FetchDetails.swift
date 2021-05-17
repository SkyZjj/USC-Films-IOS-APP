//
//  FetchDetails.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class FetchDetails:ObservableObject{
    @Published var isFetched:Bool = false
    @Published var video:String = ""
    @Published var recommended:[mediaData] = [mediaData]()
    @Published var cast:[Cast] = [Cast]()
    @Published var review:[Review] = [Review]()
    @Published var overview = ""
    @Published var id:Int = 0
    @Published var gens:[String] = []
    @Published var date = ""
    @Published var media_type = "movie"
    @Published var title = ""
    @Published var secondline = ""
    @Published var rating = ""
    
    let monthFormatter:[String:String] = [
        "01" : "Jan",
        "02" : "Feb",
        "03" : "Mar",
        "04" : "Apr",
        "05" :"May",
        "06":"Jun",
        "07":"Jul",
        "08":"Agu",
        "09":"Sept",
        "10":"Oct",
        "11":"Nov",
        "12":"Dec"
    ]
    private let baseurl:String = "https://csci571-backend-jingjizang.azurewebsites.net/apis/"
//    private let baseurl:String = "http://localhost:8000/apis/"
    func formateData(date:String) -> String {
        let dataarray = date.components(separatedBy: "-")
        let year:String = dataarray[0]
        let month:String = dataarray[1]
        let day:String = String(dataarray[2].prefix(2))
        let formate:String = monthFormatter[month]! + " " + day + ", " + year
        return formate
    }
    func intial(){
        self.gens = []
        self.review = [Review]()
        self.cast = [Cast]()
        self.recommended = [mediaData]()
    }
    func fetchDetails(mediadata:mediaData){
//        intial()
        let newUrl = mediadata.media_type+"/"+String(mediadata.id)
        AF.request(self.baseurl+"details/"+newUrl).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var genresult:[String] = []
                if let codes  = json["genres"].array{
                    for code in codes{
                        genresult.append(code["name"].stringValue)
                    }
                }
                self.id = mediadata.id
                self.title = mediadata.title
                self.media_type = mediadata.media_type
                self.date = mediadata.release_date
                self.gens = genresult
                self.overview = json["overview"].stringValue
                self.rating = String(json["vote_average"].doubleValue/2)+"/5.0"
            case .failure(let error):
                print(error)
                
                
            }
            AF.request(self.baseurl+"video/"+newUrl).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let codes  = json["results"].array{
                        if codes.count>0{
                            self.video = codes[0]["key"].stringValue
                        }else{
                            self.video = ""
                        }
                        
                    }
                case .failure(let error):
                    print(error)
                    
                    
                }
                
                AF.request(self.baseurl+"cast/"+newUrl).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        var cas = [Cast]()
                        if let codes  = json["cast"].array{
                            for code in codes.prefix(10){
                                if code["profile_path"] == JSON.null{
                                    cas.append(Cast(id:code["id"].intValue,name:code["name"].stringValue,profile_path:""))
                                }else{
                                    cas.append(Cast(id:code["id"].intValue,name:code["name"].stringValue,profile_path:code["profile_path"].stringValue))
                                }
                                
                            }
                        }
                        self.cast = cas
                    case .failure(let error):
                        print(error)
                        
                        
                    }
                    AF.request(self.baseurl+"reviews/"+newUrl).responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            var revi = [Review]()
                            if let codes  = json["results"].array{
                                for code in codes.prefix(3){
                                    let date = self.formateData(date: code["created_at"].stringValue)
                                    revi.append(Review(id:code["id"].stringValue,username:code["author_details"]["username"].stringValue,date_of_review:date,rating:String(Double(code["author_details"]["rating"].intValue)/2),content:code["content"].stringValue))
                                    
                                }
                                
                            }
                            self.review = revi
                        case .failure(let error):
                            print(error)
                            
                            
                        }
                        AF.request(self.baseurl+"recommended/"+newUrl).responseJSON { response in
                            switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                var recomm = [mediaData]()
                                if let codes  = json["results"].array{
                                    for eachCode in codes.prefix(20){
                                        var path = ""
                                        if eachCode["backdrop_path"] != JSON.null{
                                            path = eachCode["poster_path"].stringValue
                                        }
                                        
                                        if mediadata.media_type=="tv"{
                                           
                                            recomm.append(mediaData(id:eachCode["id"].intValue,media_type:"tv",backdrop_path:eachCode["backdrop_path"].stringValue,poster_path:path,title:eachCode["name"].stringValue,release_date:eachCode["first_air_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
//                                            print(self.recommended)
                                        }else{
                                            recomm.append(mediaData(id:eachCode["id"].intValue,media_type:"movie",backdrop_path:path,poster_path:eachCode["poster_path"].stringValue,title:eachCode["title"].stringValue,release_date:eachCode["release_date"].stringValue,average_rate:eachCode["vote_average"].doubleValue))
                                        }
                                        
                                        
                                    }
                                }
                                self.recommended = recomm
                            case .failure(let error):
                                print(error)
                                
                                
                            }
                            self.secondline = self.date.components(separatedBy: "-")[0]+" | "
                            for ge in self.gens{
                                self.secondline += ge+", "
                            }
                            self.secondline.removeLast(2)
                            self.isFetched = true
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    
}
