//
//  LibraryView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//
import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var musicLibrary: MusicLibrary
    
    var body: some View {
        NavigationView {
            List(musicLibrary.songs) { song in
                Text("\(song.title) - \(song.artist)")
            }
            .navigationTitle("Library")
        }
    }
}

#Preview {
    LibraryView()
        .environmentObject(MusicLibrary.shared)
}
