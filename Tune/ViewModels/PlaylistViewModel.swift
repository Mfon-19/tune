//
//  PlaylistViewModel.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

/// Manages playlists in the app.
final class PlaylistViewModel: ObservableObject {
    @Published var playlists: [Playlist] = []

    func addPlaylist(name: String, songs: [Song] = []) {
        playlists.append(Playlist(name: name, songs: songs))
    }
}


