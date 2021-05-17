//
//  LargeItem.swift
//  USC Films
//
//  Created by Key on 2021/4/30.
//

import SwiftUI
import Kingfisher
struct LargeItem: View {
    var data:mediaData
    var w:CGFloat
    var h:CGFloat
    var body: some View {
        ZStack{
            KFImage(URL(string: "http://image.tmdb.org/t/p/w780"+data.poster_path)!)
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
                .frame(width: w,height: h)
            
            KFImage(URL(string: "http://image.tmdb.org/t/p/w780"+data.poster_path)!)
                .resizable()
                .frame(width: w*0.5,height: h)
                .scaledToFill()
        }
        .frame(width: w,height: h)
        .clipped()
    }
}

