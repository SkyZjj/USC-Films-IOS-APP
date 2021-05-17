//
//  WatchlistModel.swift
//  USC Films
//
//  Created by Key on 2021/4/23.
//

import Foundation
let KeyForUserDefaults = "watchlist"
func load() -> [mediaData] {
//    let domain = Bundle.main.bundleIdentifier!
//    UserDefaults.standard.removePersistentDomain(forName: domain)
//    UserDefaults.standard.synchronize()
    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
        return []
    }
    return encodedData.map { try! JSONDecoder().decode(mediaData.self, from: $0) }
}
func save(_ item: [mediaData]) {
    let data = item.map { try? JSONEncoder().encode($0) }
    
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
    print("++++++++++++++++++++++++")
    print(item.count)
    for i in item{
        print(i.title)
    }
    print("++++++++++++++++++++++++")
}
class WatchlistModel: ObservableObject {
    @Published var selectedTab = "tabs"
    @Published var currentCard: mediaData?
    @Published var watchlist:[mediaData] = [mediaData]()
    func reload(){
        watchlist = load()
    }
    
    func add(item: mediaData) {
        if !watchlist.contains(item){
            self.watchlist.append(item)
            save(watchlist)
            reload()
        }
    }

    func remove(item: mediaData) {
        if let index = watchlist.firstIndex(of: item) {
            self.watchlist.remove(at: index)
            save(watchlist)
            reload()
        }
    }

    func checkAdded(item: mediaData)->Bool{
        return watchlist.contains(item)
    }
}
