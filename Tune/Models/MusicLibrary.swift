//
//  MusicLibrary.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation
import Combine

class MusicLibrary: ObservableObject {
    static let shared = MusicLibrary()
    
    @Published var songs: [Song] = []
    @Published var isLoading = false
    
    private init() {
        loadDemoSongs()
    }
    
    private func loadDemoSongs() {
        // Add some demo songs for testing
        songs = [
            Song(
                title: "Demo Song 1",
                artist: "Demo Artist",
                album: "Demo Album",
                duration: 180,
                fileURL: URL(string: "file://demo1.mp3")!,
                artworkData: nil
            ),
            Song(
                title: "Demo Song 2",
                artist: "Another Artist",
                album: "Another Album",
                duration: 240,
                fileURL: URL(string: "file://demo2.mp3")!,
                artworkData: nil
            )
        ]
    }
}
