//
//  ContentView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 29.04.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Constants
    
    enum Constants {
            static let settings = "Настройки"
    }
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            Form {
                ProfileSectionView()
                SoftwareUpdateSectionView()
                ConnectionSectionView()
            }
            .navigationTitle(Constants.settings)
        }
    }
}

#Preview {
    ContentView()
}
