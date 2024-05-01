//
//  ContentView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 29.04.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                ProfileSectionView()
                SoftwareUpdateSectionView()
                ConnectionSectionView()
            }
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    ContentView()
}
