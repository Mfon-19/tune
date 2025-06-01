//
//  Song.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

struct Song: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    let artist: String
    let album: String?
    let duration: TimeInterval
    let fileURL: URL
    let artworkData: Data?
    
    var durationString: String {
        let minutes = Int(duration.truncatingRemainder(dividingBy: 3600)) / 60
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
