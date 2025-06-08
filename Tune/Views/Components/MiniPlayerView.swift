//
//  MiniPlayerView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

struct MiniPlayerView: View {
    @EnvironmentObject var audioPlayer: AudioPlayerManager

    var body: some View {
        VStack(spacing: 4) {
            if let song = audioPlayer.currentSong {
                HStack {
                    Text("\(song.title) - \(song.artist)")
                        .lineLimit(1)

                    Spacer()

                    Button(action: audioPlayer.togglePlayPause) {
                        Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                            .padding(.horizontal, 8)
                    }
                }
            } else {
                Text("No song playing")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(8)
        .background(.thinMaterial)
    }
}

#Preview {
    MiniPlayerView()
        .environmentObject(AudioPlayerManager.shared)
}
