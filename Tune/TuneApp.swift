//
//  TuneApp.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

@main
struct TuneApp: App {
    @StateObject private var musicLibrary = MusicLibrary.shared
    @StateObject private var audioPlayer = AudioPlayerManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(musicLibrary)
                .environmentObject(audioPlayer)
        }
    }
}
