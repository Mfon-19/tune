//
//  LibraryViewModel.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

/// View model for the library view.
final class LibraryViewModel: ObservableObject {
    @Published var library = MusicLibrary.shared

    var songs: [Song] {
        library.songs
    }
}


