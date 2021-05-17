//
//  SmallItem.swift
//  USC Films
//
//  Created by Key on 2021/4/19.
//

import SwiftUI
import Kingfisher
struct SmallItem: View {
    var data: mediaData
    var date:String {
        data.release_date.components(separatedBy: "-")[0]
    }
    let font3 = Font.system(size: 13).weight(.bold)

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
            Text(data.title)
                .lineLimit(nil)
                .font(font3)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            Text("(\(date))")
                .font(font3)
                .foregroundColor(.gray)
        }
        .background(Color.white)
        .frame(width: 100,alignment: .center)
        .foregroundColor(.primary)
        .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
        
    }
}

struct SmallItem_Previews: PreviewProvider {
    static var previews: some View {
        SmallItem(data: Fetch().topRatedMovies[0])
        
    }
}
