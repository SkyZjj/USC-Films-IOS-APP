//
//  Search.swift
//  test
//
//  Created by Key on 2021/4/19.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var WatchListM:WatchlistModel
    @State private var showCancelButton: Bool = false
    @StateObject var searchModel = SearchModel()
    let display = Font.system(size: 25)
//    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                                    HStack {
                                        Image(systemName: "magnifyingglass")

                                        TextField("Search Movies, TVs...", text: $searchModel.query, onEditingChanged: { isEditing in
                                            self.showCancelButton = true
                                        }, onCommit: {
                                            print("onCommit")
                                        }).foregroundColor(.primary)

                                        Button(action: {
                                            searchModel.query = ""
                                        }) {
                                            Image(systemName: "xmark.circle.fill").opacity(searchModel.query == "" ? 0 : 1)
                                        }
                                    }
                                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                                    .foregroundColor(.secondary)
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(10.0)

                                    if showCancelButton  {
                                        Button("Cancel") {
                                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                            searchModel.query = ""
                                                self.showCancelButton = false
                                            searchModel.noResult = false
                                        }
                                        .foregroundColor(Color(.systemBlue))
                                    }
                                }
                                .padding(.horizontal)
//                .navigationBarHidden(showCancelButton)
                
                if !searchModel.searchResult.isEmpty{
                    ScrollView(.vertical,showsIndicators:true){
                        LazyVStack{
                            ForEach(searchModel.searchResult) { item in
                                NavigationLink(destination:DetailPage( data:item)){
                                    SearchCard(item: item)
                                    
                                }
                            }
                        }
                    }
                }else if searchModel.noResult && showCancelButton{
                    Text("No Results").frame(alignment: .center).font(display).foregroundColor(.gray).padding()
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Search"))
        }.onChange(of: searchModel.query, perform: { (newData) in
            DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
                if (newData == searchModel.query){
                    searchModel.searchResult.removeAll()
                    if (searchModel.query.count>2) && (searchModel.query != ""){
                        searchModel.search()
                    }
                }
            }
        })
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Search()
//                .environment(\.colorScheme, .light)
//
//            Search()
//                .environment(\.colorScheme, .dark)
//        }
//    }
//}
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
