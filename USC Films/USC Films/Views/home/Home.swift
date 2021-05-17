//
//  Home.swift
//  test
//
//  Created by Key on 2021/4/19.
//

import SwiftUI

struct Home: View {
    @State private var isMovie = true
    @StateObject var fetchData = Fetch()
    @State private var showToast: Bool = false
    @State private var showtitle: String = ""
    @State private var isAdd:Bool = false
//    @S var WatchListM:WatchlistModel
    var change:String {
        if isMovie{
            return "TV Shows"
        }else{
            return "Movies"
        }
    }
    var body: some View {
        if fetchData.isFetched == false{
            ProgressView("Fetching Data...")
        }else {
            NavigationView{
                ScrollView{
                    LazyVStack{
                    if isMovie{
                        LargeRow(LargeRowTitle:"Now Playing",datas:fetchData.currentPlayMovies)
                        SmallRow(rowTitle:"Top Rated",items:fetchData.topRatedMovies,showTitle:$showtitle,showToast:$showToast, isAdd: $isAdd)
                        SmallRow(rowTitle:"Pouplar",items:fetchData.popularMovies,showTitle:$showtitle,showToast:$showToast, isAdd: $isAdd)
                    }else{
                            LargeRow(LargeRowTitle:"Trending",datas:fetchData.trendingTVShows)
                        SmallRow(rowTitle:"Top Rated",items:fetchData.topRatedTVShows,showTitle:$showtitle,showToast:$showToast, isAdd: $isAdd)
                        SmallRow(rowTitle:"Pouplar",items:fetchData.popularTVShows,showTitle:$showtitle,showToast:$showToast, isAdd: $isAdd)
                    }
                    Footer()
                }
                .navigationTitle("USC Films")
                .navigationBarItems(
                    trailing:
                        Button("\(change)"){
                            isMovie.toggle()
                        }
                )
                }
                .toast(isPresented: self.$showToast) {
                    HStack {
                        Text("\(showtitle) \(self.isAdd ? "was removed from" : "was added to") the WatchList").foregroundColor(.white)

                    }
                }
            }
        }
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
