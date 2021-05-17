//
//  DropViewDelegate.swift
//  USC Films
//
//  Created by Key on 2021/4/25.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    var meidadata: mediaData
    var WatchListM: WatchlistModel
//    @Binding var changedView: Bool
    func performDrop(info:DropInfo) -> Bool {
        WatchListM.currentCard = nil
        return true
    }
    func dropEntered(info:DropInfo) {
        if WatchListM.currentCard == nil{
            WatchListM.currentCard = meidadata
        }
        let fromIndex = WatchListM.watchlist.firstIndex{(item)->Bool in
            return item.id == WatchListM.currentCard?.id
        } ?? 0
        let toIndex = WatchListM.watchlist.firstIndex{(item) ->Bool in
            return item.id == self.meidadata.id
        } ?? 0
        if fromIndex != toIndex{
            withAnimation(.default){
                let temp = WatchListM.watchlist[fromIndex]
                WatchListM.watchlist[fromIndex] = WatchListM.watchlist[toIndex]
                WatchListM.watchlist[toIndex] = temp
            }
        }
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
//        changedView = false
        return DropProposal(operation: .move)
    }
}
