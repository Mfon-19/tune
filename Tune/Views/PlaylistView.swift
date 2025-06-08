//
//  PlaylistView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

struct PlaylistView: View {
    @EnvironmentObject var playlistViewModel: PlaylistViewModel
    @State private var showCreate = false
    @State private var newPlaylistName = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(playlistViewModel.playlists) { playlist in
                    NavigationLink(destination: PlaylistDetailView(playlist: playlist)) {
                        Text(playlist.name)
                    }
                }
            }
            .navigationTitle("Playlists")
            .toolbar {
                Button(action: { showCreate = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showCreate) {
                NavigationStack {
                    Form {
                        TextField("Playlist Name", text: $newPlaylistName)
                    }
                    .navigationTitle("New Playlist")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") { showCreate = false }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                playlistViewModel.addPlaylist(name: newPlaylistName)
                                newPlaylistName = ""
                                showCreate = false
                            }.disabled(newPlaylistName.isEmpty)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PlaylistView()
        .environmentObject(PlaylistViewModel())
        .environmentObject(AudioPlayerManager.shared)
}
