import SwiftUI

struct PlaylistDetailView: View {
    @EnvironmentObject var audioPlayer: AudioPlayerManager
    let playlist: Playlist

    var body: some View {
        List(playlist.songs) { song in
            SongRowView(song: song)
                .contentShape(Rectangle())
                .onTapGesture {
                    audioPlayer.play(song: song)
                }
        }
        .navigationTitle(playlist.name)
    }
}

#Preview {
    PlaylistDetailView(playlist: Playlist(name: "Preview", songs: []))
        .environmentObject(AudioPlayerManager.shared)
}
