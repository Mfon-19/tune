//
//  LibraryView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//
import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var musicLibrary: MusicLibrary
    @EnvironmentObject var audioPlayer: AudioPlayerManager
    
    var body: some View {
        NavigationView {
            List(musicLibrary.songs) { song in
                SongRowView(song: song)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        audioPlayer.play(song: song)
                    }
            }
            .navigationTitle("Library")
        }
    }
}

#Preview {
    LibraryView()
        .environmentObject(MusicLibrary.shared)
        .environmentObject(AudioPlayerManager.shared)
}
