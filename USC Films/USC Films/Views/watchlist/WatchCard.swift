//
//  WatchCard.swift
//  USC Films
//
//  Created by Key on 2021/4/25.
//

import SwiftUI
import Kingfisher
struct WatchCard: View {
//    @StateObject var WatchListM:WatchlistModel
    var item:mediaData
    var body: some View {

            KFImage(URL(string:"https://image.tmdb.org/t/p/w780"+item.poster_path )!)
                .resizable()
                .scaledToFill()


        
        
    }
}

struct WatchCard_Previews: PreviewProvider {
    static var previews: some View {
        WatchCard(item: mediaData(id: 1399, media_type: "tv", backdrop_path: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg", poster_path: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg", title: "Game of Thrones", release_date: "2011-04-17",average_rate:8.9))
    }
}
