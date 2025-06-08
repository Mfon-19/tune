//
//  ContentView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

struct ContentView: View {
    @State private var showNowPlaying = false

    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Library")
                }
            
            PlaylistView()
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Playlists")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .overlay(alignment: .bottom) {
            MiniPlayerView {
                showNowPlaying = true
            }
        }
        .sheet(isPresented: $showNowPlaying) {
            NowPlayingView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MusicLibrary.shared)
        .environmentObject(AudioPlayerManager.shared)
        .environmentObject(PlaylistViewModel())
}
