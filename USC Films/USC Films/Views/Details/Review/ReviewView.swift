//
//  ReviewView.swift
//  USC Films
//
//  Created by Key on 2021/4/22.
//

import SwiftUI

struct ReviewView: View {
    var reviews:[Review]
    var title:String
    let title2 = Font.system(size: 23).weight(.bold)
    var body: some View {
        VStack(alignment:.leading){
            Text("Reviews:")
                .font(title2)
                .frame(alignment:.leading)
                .padding(.top,20)
            ForEach(reviews){review in
                ReviewCard(review:review,title:title)
                    .padding(.bottom,5)
                    

            }
            Spacer()
        }
        
    }
}

