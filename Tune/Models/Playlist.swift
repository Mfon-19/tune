//
//  Playlist.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

/// A simple collection of songs.
struct Playlist: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var songs: [Song]
}

