//
//  SearchCard.swift
//  USC Films
//
//  Created by Key on 2021/4/24.
//

import SwiftUI
import Kingfisher
struct SearchCard: View {
    var item:mediaData
    let font2 = Font.system(size: 20).weight(.bold)
    var mediaType:[String:String] = ["tv":"TV Show","movie":"MOVIE"]
    var body: some View {
        
        ZStack{
            KFImage(URL(string:"https://image.tmdb.org/t/p/w780"+item.backdrop_path)!)
                .resizable()
                .scaledToFit()
                .cornerRadius(20).overlay(
                    VStack{
                    HStack{
                        Text("\(mediaType[item.media_type]!)(\(item.release_date.components(separatedBy: "-")[0]))").foregroundColor(.white).font(font2)
                        Spacer()
                        HStack{
                            Image(systemName:"star.fill").foregroundColor(.red).font(font2)
                            Text(String(item.average_rate/2)).foregroundColor(.white).font(font2)
                        }
                        
                    }
                    Spacer()
                    HStack{
                        Text(item.title).foregroundColor(.white).font(font2)
                        Spacer()
                    }
                    }.padding()
                )
            
        }.padding().cornerRadius(10)
        
    }
}

struct SearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(item: mediaData(id: 1399, media_type: "tv", backdrop_path: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg", poster_path: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg", title: "Game of Thrones", release_date: "2011-04-17",average_rate:8.9))
    }
}
