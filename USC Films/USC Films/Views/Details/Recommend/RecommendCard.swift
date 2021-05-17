//
//  RecommendCard.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import SwiftUI
import Kingfisher

struct RecommendCard: View {
    var data: mediaData
    var date:String {
        data.release_date.components(separatedBy: "-")[0]
    }
    var body: some View {
        VStack(alignment: .center) {
            if data.poster_path == ""{
                Image("movie_placeholder")
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }else{
                KFImage(URL(string:"https://image.tmdb.org/t/p/w780"+data.poster_path )!)
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }
        }
        .background(Color.white)
        .frame(width: 100,alignment: .center)
        .foregroundColor(.primary)
        .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.trailing,20)
    }
}
