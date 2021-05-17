//
//  LargeRow.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import SwiftUI
import Kingfisher
struct LargeRow: View {
    @StateObject var WatchListM=WatchlistModel()
    var LargeRowTitle:String
    var datas:[mediaData]=[mediaData]()
    let font2 = Font.system(size: 23).weight(.bold)
    var body: some View {
        VStack(alignment: .leading){
            Text(LargeRowTitle)
                .font(font2)
                .padding(.top, 5)
            ScrollView() {
                GeometryReader { geometry in
                    ImageCarouselView(numberOfImages: datas.count) {
                        ForEach(datas){data in
                            NavigationLink(destination:DetailPage(data:data)) {
                                LargeItem(data: data, w: geometry.size.width, h: geometry.size.height)
                            }
                        }
                    }
                }
                .frame(height: 300)
            }
            .frame( height: 300)
        }.onAppear(perform: {WatchListM.reload()})
    }
}
