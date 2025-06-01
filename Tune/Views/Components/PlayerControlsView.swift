//
//  PlayerControlsView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

struct PlayerControlsView: View {
    @EnvironmentObject var audioPlayer: AudioPlayerManager
    
    var body: some View {
        HStack(spacing: 40) {
            // Previous
            Button(action: audioPlayer.previousSong) {
                Image(systemName: "backward.fill")
                    .font(.title)
            }
            
            // Play/Pause
            Button(action: audioPlayer.togglePlayPause) {
                Image(systemName: audioPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 60))
            }
            
            // Next
            Button(action: audioPlayer.nextSong) {
                Image(systemName: "forward.fill")
                    .font(.title)
            }
        }
        .foregroundColor(.primary)
    }
}
