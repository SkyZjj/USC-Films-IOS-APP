//
//  DetailPage.swift
//  USC Films
//
//  Created by Key on 2021/4/19.
//

import SwiftUI
import youtube_ios_player_helper

struct DetailPage: View {
    @StateObject var fetchDetail:FetchDetails = FetchDetails()
    @StateObject var WatchListM=WatchlistModel()
    var data:mediaData
    let title = Font.system(size: 23).weight(.bold)
    @State private var showToast = false
    @State var didAppear = false
    @State var isChange = ""
    init(data:mediaData){
        self.data = data
    }
    var body: some View {
        VStack{
            if fetchDetail.isFetched==false{
                ProgressView("Fetching Data...")
            }else{
                ScrollView{
                    VStack(alignment:.leading){
                        if (fetchDetail.video != ""){
                            YTWrapper(videoID: fetchDetail.video).frame(height: 200, alignment: .center)
                        }
                        
                        Text(fetchDetail.title).font(title).padding(.vertical,5)
                            .frame(alignment:.leading)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(fetchDetail.secondline).padding(.vertical,5)
                            .frame(alignment:.leading)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack{
                            Image(systemName:"star.fill").foregroundColor(.red)
                            Text(fetchDetail.rating)
                        }.padding(.vertical,10)

                        DescriptionView(description:fetchDetail.overview)
                        
                        if fetchDetail.cast.count>0{
                            CastView(casts:fetchDetail.cast)
                        }
                        
                        if fetchDetail.review.count>0{
                            ReviewView(reviews:fetchDetail.review,title:fetchDetail.title)
                        }
                        
                        if fetchDetail.recommended.count>0{
                            if fetchDetail.media_type == "movie"{
                                RecommendRow(rowTitle:"Recommended Movies",items:fetchDetail.recommended)
                            }else{
                                RecommendRow(rowTitle:"Recommended TV shows",items:fetchDetail.recommended)
                            }
                        }
                        Spacer()
                    }
                    .frame(
                          minWidth: 0,
                          maxWidth: .infinity,
                          minHeight: 0,
                          maxHeight: .infinity,
                          alignment: .topLeading
                        )
                    .navigationBarItems(
                        trailing:
                            HStack{
                                
                                Button(action: {
                                    if WatchListM.checkAdded(item: data){
                                        WatchListM.remove(item:data)
                                       }
                                    else{
                                        WatchListM.add(item:data)
                                    }
                                    withAnimation {
                                        showToast.toggle()
                                }
                                    fetchDetail.fetchDetails(mediadata: data)
                                }
                                ){
                                    if WatchListM.checkAdded(item: data){
                                        Image(systemName: "bookmark.fill").foregroundColor(.blue)
                                        
                                    }else{
                                            Image(systemName: "bookmark").foregroundColor(.black)
                                        }
                                }
                                
                                Button(action: {
                                    let formattedString = "https://www.facebook.com/sharer/sharer.php?u=https://www.themoviedb.org/"+fetchDetail.media_type+"/"+String(fetchDetail.id)
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)
                                }) {
                                    Image("facebook-app-symbol").resizable().frame(width: 18, height: 18 )
                                }
                                Button(action: {
                                    let originalString = "https://twitter.com/intent/tweet?text=https://www.themoviedb.org/"+fetchDetail.media_type+"/"+String(fetchDetail.id)+" #CSCI571USCFilms"
                                    let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                    guard let url = URL(string: urlString!) else { return }
                                    UIApplication.shared.open(url)
                                }) {
                                    Image("twitter").resizable().frame(width: 18, height: 18 )
                                }
                            }
                    )
                    }
                .toast(isPresented: $showToast) {
                    HStack {
                        Text("\(fetchDetail.title) \(WatchListM.checkAdded(item: data) ? "was added to" : "was removed from") the WatchList").foregroundColor(.white)
                        
                    }
                }
            }
        }
        .onAppear(
            perform: {
                onLoad()
                WatchListM.reload()
                
            })
        }

    func onLoad(){
        if !didAppear{
            fetchDetail.fetchDetails(mediadata: data)
            didAppear = true
        }
        
    }
    }

