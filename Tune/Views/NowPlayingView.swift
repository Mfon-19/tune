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

                Slider(value: Binding(
                    get: { audioPlayer.currentTime },
                    set: { newValue in
                        audioPlayer.seekTo(time: newValue)
                    }
                ), in: 0...audioPlayer.duration)

                HStack {
                    Text(formattedTime(audioPlayer.currentTime))
                    Spacer()
                    Text(formattedTime(audioPlayer.duration))
                }
                .font(.caption)

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

    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    NowPlayingView()
        .environmentObject(AudioPlayerManager.shared)
}

