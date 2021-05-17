//
//  TosatTest.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import SwiftUI

struct TosatTest: View {
    @State private var lightsOn: Bool = false
    @State private var showToast: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                        Button(action: {
                            if (!self.showToast) {
                                self.lightsOn.toggle()

                                withAnimation {
                                    self.showToast = true
                                }
                            }
                        }){
                            Text("switch")
                        } //Button
                        .padding(.top)
                Text("brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew wefebrfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,rjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  ebrfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,lgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg ,brfej k bfre hgek  gej jw lbflekw fekjgfnew efhejhj rgej  rejg l b gb  elgbejgre fekljwbrfewhrj fhekrjw hfewlkg gkjew weferjkg  wngjkewbg krew gberbg , ").frame(width: 300).lineLimit(nil).multilineTextAlignment(.center)
                Spacer()
                        Image(systemName: self.lightsOn ? "lightbulb" : "lightbulb.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                            
                    } //VStack
            
            
        }.toast(isPresented: self.$showToast) {
            HStack {
                Text("Lights: \(self.lightsOn ? "ON" : "OFF")")
                Image(systemName: self.lightsOn ? "lightbulb" : "lightbulb.fill")
            } //HStack
        } //toast
       
    }
}

struct TosatTest_Previews: PreviewProvider {
    static var previews: some View {
        TosatTest()
    }
}
