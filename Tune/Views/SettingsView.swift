//
//  SettingsView.swift
//  Tune
//
//  Created by Mfon Udoh on 2025-05-31.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var cellularDownloads = false

    var body: some View {
        NavigationView {
            Form {
                Toggle("Enable Notifications", isOn: $notificationsEnabled)
                Toggle("Download Over Cellular", isOn: $cellularDownloads)
            }
            .navigationTitle("Settings")
        }
    }
}
