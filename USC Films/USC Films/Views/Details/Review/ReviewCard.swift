//
//  ReviewCard.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import SwiftUI

struct ReviewCard: View {
    var review:Review
    var title:String
    let title2 = Font.system(size: 18).weight(.bold)
    let body2 = Font.system(size: 15)
    var body: some View {
        NavigationLink(destination:ReviewDetail(review:review,title:title)){
            
                VStack(alignment:.leading){
                    Text("A review by \(review.username)").font(title2).foregroundColor(.black).padding(.top,5).fixedSize(horizontal: false, vertical: true)
                    Text("Written by \(review.username) on \(review.date_of_review)").foregroundColor(.gray).font(body2).fixedSize(horizontal: false, vertical: true)
                    HStack{
                        Image(systemName:"star.fill").foregroundColor(.red)
                        Text("\(review.rating)/5.0").frame(alignment:.leading).foregroundColor(.black).font(body2).fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.vertical,1).padding(.leading,1)
                    HStack{
                        Text(review.content).lineLimit(3).multilineTextAlignment(.leading).foregroundColor(.black).font(body2).fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer()
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topLeading
                    )
             .padding(.horizontal,8)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
        }
        
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: Review(id:"1", username: "msnfsdjkf", date_of_review: "nejkfnjke", rating: "4.5", content: "efhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; ffgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewysjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewyefhwqjfgqew,gfelrf  gf eqfgqiegfeuqfg gefgef euuf hejfhg ej efgef gsjdh  fg; feglqfequgfewyf wey iegfewyfgdsjh yewg fyew ewgfsj ewy"), title: "test title")
    }
}
