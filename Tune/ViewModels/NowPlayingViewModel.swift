//
//  NowPlayingViewModel.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

/// Exposes state from `AudioPlayerManager` to the UI.
final class NowPlayingViewModel: ObservableObject {
    @Published var player = AudioPlayerManager.shared
}


