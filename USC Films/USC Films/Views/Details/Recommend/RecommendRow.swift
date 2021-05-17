//
//  RecommendRow.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import SwiftUI

struct RecommendRow: View {
    @StateObject var WatchListM=WatchlistModel()
    var rowTitle:String
    var items:[mediaData]
    let title2 = Font.system(size: 23).weight(.bold)
    var body: some View {
        VStack(alignment: .leading) {
            Text(rowTitle)
                .font(title2)
                .padding(.top, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink(destination:DetailPage(data:item)) {
                            RecommendCard(data: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.onAppear(perform: {WatchListM.reload()})
    }
}
