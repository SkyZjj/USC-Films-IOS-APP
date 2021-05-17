//
//  SmallRow.swift
//  USC Films
//
//  Created by Key on 2021/4/19.
//

import SwiftUI

struct SmallRow: View {
    var rowTitle:String
    var items:[mediaData]
    
    let font2 = Font.system(size: 16).weight(.bold)
    let font3 = Font.system(size: 10).weight(.bold)
    let title2 = Font.system(size: 23).weight(.bold)
    @Binding var showTitle: String
    @Binding var showToast:Bool
    @Binding var isAdd:Bool
    @StateObject var WatchListM=WatchlistModel()
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(rowTitle)
                .font(title2)
//                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink(destination:DetailPage(data:item)) {
                            SmallItem(data: item)

                                .contextMenu {
                                    Button {
                                        isAdd = WatchListM.checkAdded(item: item)
                                        if WatchListM.checkAdded(item: item){
                                            WatchListM.remove(item:item)
                                           }
                                        else if !WatchListM.checkAdded(item: item){
                                            WatchListM.add(item:item)
                                        }
                                        showTitle = item.title
                                        withAnimation {
                                            showToast.toggle()
                                    }
                                    } label: {
                                        if WatchListM.checkAdded(item: item){
                                            Label("Remove from Watchlist", systemImage: "bookmark.fill")
                                        }else{
                                            Label("Add to Watchlist", systemImage: "bookmark")
                                        }
                                    }
                                    Button(action: {
                                        let formattedString = "https://www.facebook.com/sharer/sharer.php?u=https://www.themoviedb.org/"+item.media_type+"/"+String(item.id)
                                        guard let url = URL(string: formattedString) else { return }
                                        UIApplication.shared.open(url)

                                    }, label: {
                                        HStack{
                                            Text("Share on Facebook")
                                            Image("facebook-app-symbol")
                                        }

                                    }

                                    )
                                    Button(action: {
                                  let originalString = "https://twitter.com/intent/tweet?text=https://www.themoviedb.org/"+item.media_type+"/"+String(item.id)+" #CSCI571USCFilms"
                                        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                        guard let url = URL(string: urlString!) else { return }
                                        UIApplication.shared.open(url)

                                    }, label: {
                                        HStack{
                                            Text("Share on Twitter")
                                            Image("twitter")
                                        }

                                    }

                                    )

                                }
                                .padding(.trailing,20)

                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
           
        }.onAppear(perform: {WatchListM.reload()})
        
    }
}
