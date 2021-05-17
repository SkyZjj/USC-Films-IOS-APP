//
//  WatchList.swift
//  test
//
//  Created by Key on 2021/4/19.
//

import SwiftUI
import Kingfisher
struct WatchList: View {
    @StateObject var WatchListM=WatchlistModel()
    @Namespace var animation
    let display = Font.system(size: 25)
    var flexibleColumn = Array(repeating: GridItem(.flexible(), spacing: 5), count: 3)
    @State private var list = [mediaData]()
    var body: some View {
        VStack{
            if self.WatchListM.watchlist.count == 0{
                VStack{
                    Spacer()
                    Text("Watchlist is empty").font(display).foregroundColor(.gray)
                    Spacer()
                }
                
            }else{
                NavigationView{
                    
                    ScrollView {
                        LazyVGrid(columns: flexibleColumn, spacing: 5){
                            ForEach(self.WatchListM.watchlist){ item in
                                NavigationLink(destination:DetailPage(data:item)){

                                WatchCard(item: item)
                                    
                                    .onDrag({
                                                WatchListM.currentCard = item
                                        return NSItemProvider(contentsOf:URL(string: "\(item.id)")! )!
                                
                            })
                                    .onDrop(of:[.url],delegate:DropViewDelegate(meidadata: item, WatchListM: WatchListM))
                                    .contextMenu {
                                        Button {
                                                WatchListM.remove(item:item)
                                        } label: {
                                                Label("Remove from Watchlist", systemImage: "bookmark.fill")
                                        }
                                    }
                                }.buttonStyle(PlainButtonStyle())
                                                        }
                        Spacer()
                    }.navigationTitle("Watchlist")
                    .padding(.horizontal)
                        .onAppear(perform: {WatchListM.reload()})
                    
                }
            }
        }
        }.onAppear(perform: {WatchListM.reload()})
        
    }
    
}

//struct WatchList_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchList()
//    }
//}
