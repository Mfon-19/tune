//
//  FileManager+Extensions.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import Foundation

extension FileManager {
    /// Returns the user's documents directory on iOS or macOS.
    static var documentsDirectory: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}


