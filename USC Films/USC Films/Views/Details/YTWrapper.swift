//
//  YTWrapper.swift
//  USC Films
//
//  Created by Key on 2021/4/22.
//

import SwiftUI
import youtube_ios_player_helper
struct YTWrapper : UIViewRepresentable {
    var videoID : String
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        let playvarsDic = ["controls": 1, "playsinline": 1, "autohide": 1, "showinfo": 1, "autoplay": 1, "modestbranding": 1,"fs":0 ]
//        let playvarsDic = [ "playsinline": 1]

        playerView.load(withVideoId: videoID,playerVars: playvarsDic)
        return playerView
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        //
    }
}
