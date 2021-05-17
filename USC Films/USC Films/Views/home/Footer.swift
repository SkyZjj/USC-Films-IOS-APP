//
//  Footer.swift
//  USC Films
//
//  Created by Key on 2021/4/22.
//

import SwiftUI

struct Footer: View {
    let font3 = Font.system(size: 12).weight(.medium)
    var body: some View {
        
        VStack{
            Link(destination: URL(string: "https://www.themoviedb.org/")!) {
            Text("Powered by TMDB")
            }
            Text("Developed by Jingji Zang")
        }
        .padding(.bottom,20)
        .font(font3)
        .frame(alignment: .center)
        .foregroundColor(.gray)
        
        
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
