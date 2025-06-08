//
//  SongRowView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

/// A simple row that displays basic song information.
struct SongRowView: View {
    let song: Song

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(song.title)
                    .font(.headline)
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(song.durationString)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SongRowView(song: Song(
        title: "Preview",
        artist: "Artist",
        album: nil,
        duration: 200,
        fileURL: URL(string: "file://preview.mp3")!,
        artworkData: nil
    ))
}

