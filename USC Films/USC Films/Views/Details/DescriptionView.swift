//
//  DescriptionView.swift
//  USC Films
//
//  Created by Key on 2021/4/22.
//

import SwiftUI

struct DescriptionView: View {
    @State private var isExpanded: Bool = false
    var description:String
    var body: some View {
        VStack{

                Text(description)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                    .lineLimit(isExpanded ? nil : 3)
                    .overlay(
                        GeometryReader { proxy in
                            Button(action: {
                                isExpanded.toggle()
                            }) {
                                Text(isExpanded ? "Show Less" : "Show More")
                                    .foregroundColor(Color.gray)
                                    .font(.caption).bold()
                                    .padding(.leading, 8.0)
                                    .padding(.top, 4.0)
                                    .background(Color.white)
                            }
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                            .offset(y:20)
                        }
                    )
        }
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView(description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatatbfddbbfhjfbskbfsfbjdksbfbfskjfbjskbffbsjkfbsjkbfsjkfwjkafbwabfjwbffbjs non proident, sunt in culpa qui officia deserunt mollit anim id est .Lorem ipsum dolor sit amet, consectetur adipiscing elit,  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, qonsequate cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est labofsnjkfbajkbfjksbfjsbfsjfbjsfbjsbrum.")
//    }
//}
