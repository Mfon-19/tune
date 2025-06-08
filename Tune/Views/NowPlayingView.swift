//
//  NowPlayingView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

/// Displays details for the currently playing song.
struct NowPlayingView: View {
    @EnvironmentObject var audioPlayer: AudioPlayerManager

    var body: some View {
        VStack {
            if let song = audioPlayer.currentSong {
                Text(song.title)
                    .font(.title)
                    .padding(.bottom, 1)
                Text(song.artist)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Spacer()

                PlayerControlsView()
                    .environmentObject(audioPlayer)
            } else {
                Text("Nothing Playing")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    NowPlayingView()
        .environmentObject(AudioPlayerManager.shared)
}

