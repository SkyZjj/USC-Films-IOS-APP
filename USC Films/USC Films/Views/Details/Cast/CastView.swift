//
//  CastView.swift
//  USC Films
//
//  Created by Key on 2021/4/22.
//

import SwiftUI
import Kingfisher
struct CastView: View {
    var casts:[Cast]
    let title2 = Font.system(size: 23).weight(.bold)
    let body2 = Font.system(size: 15)
    var body: some View {
            VStack(alignment: .leading){
                Text("Cast & Crew:")
                    .font(title2)
                    .frame(alignment:.leading)
                    .padding(.top,20)
                ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(casts){ cast in
                        VStack(alignment:.center){
                            if cast.profile_path=="" {
                                Image("cast_placeholder")
                                    .resizable()
                                    .frame(width: 80, height: 130)
                                    .clipShape(Circle())
                                    .padding(.trailing,5)
                                    .clipped()
                            }else{
                                KFImage(URL(string:"https://image.tmdb.org/t/p/w780"+cast.profile_path )!)
                                    .resizable()
                                    .frame(width: 80, height: 130)
                                    .clipShape(Circle())
                                    .padding(.trailing,5)
                                    .clipped()
                            }
                            
                            Text(cast.name)
                                .frame(width:80)
                                .font(body2)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .frame(alignment:.center)
                                .fixedSize(horizontal: false, vertical: true)
                                
                        }.frame(width:90)
                        
                    }
                }
            }
        }
    }
}
