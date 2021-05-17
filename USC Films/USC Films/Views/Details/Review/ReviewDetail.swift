//
//  ReviewDetail.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import SwiftUI

struct ReviewDetail: View {
    var review:Review
    var title:String
    let fonttitle2 = Font.system(size: 23).weight(.bold)
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                Text(title).font(fonttitle2)
                Text("By \(review.username) on \(review.date_of_review)")
                    .foregroundColor(.gray)
                    .padding(.vertical,1)
                HStack{
                    Image(systemName:"star.fill")
                        .foregroundColor(.red)
                    Text("\(review.rating)/5.0")
                        .frame(alignment:.leading)
                        .foregroundColor(.black)
                }
                Divider()
                Text(review.content)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }.padding()
            Spacer()
        }
    }
}
