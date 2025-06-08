//
//  MusicLibrary.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation
import Combine
import AVFoundation

class MusicLibrary: ObservableObject {
    static let shared = MusicLibrary()
    
    @Published var songs: [Song] = []
    @Published var isLoading = false
    
    private init() {
        loadLibraryFromDisk()
        if songs.isEmpty {
            loadDemoSongs()
        }
    }

    /// Scans the user's documents directory for audio files and loads them into the library.
    func loadLibraryFromDisk() {
        isLoading = true

        let fm = FileManager.default
        let directory = FileManager.documentsDirectory

        let supportedExtensions = ["mp3", "m4a", "mp4", "wav"]
        var loadedSongs: [Song] = []

        let urls: [URL]
        do {
            urls = try fm.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
        } catch {
            print("Failed to read directory: \(error)")
            urls = []
        }

        for url in urls where supportedExtensions.contains(url.pathExtension.lowercased()) {
            let asset = AVURLAsset(url: url)
            let duration = CMTimeGetSeconds(asset.duration)

            var title = url.deletingPathExtension().lastPathComponent
            var artist = "Unknown Artist"
            var album: String? = nil

            for item in asset.commonMetadata {
                guard let key = item.commonKey?.rawValue else { continue }
                switch key {
                case "title":
                    if let value = item.stringValue { title = value }
                case "artist":
                    if let value = item.stringValue { artist = value }
                case "albumName":
                    if let value = item.stringValue { album = value }
                default:
                    break
                }
            }

            loadedSongs.append(
                Song(
                    title: title,
                    artist: artist,
                    album: album,
                    duration: duration,
                    fileURL: url,
                    artworkData: nil
                )
            )
        }

        DispatchQueue.main.async {
            self.songs = loadedSongs
            self.isLoading = false
        }
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
