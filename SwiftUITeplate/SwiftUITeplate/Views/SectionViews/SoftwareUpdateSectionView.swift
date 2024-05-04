//
//  SoftwareUpdateSectionView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 01.05.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct SoftwareUpdateSectionView: View {
    
    // MARK: - Constants
    
    enum Constants {
            static let availableVersions = "IOS 17.2: уже доступно"
    }
    
    // MARK: - @State Private Properties
    
    @State private var selectionUpdates = 0
    
    // MARK: - Body

    var body: some View {
        
        Section {
            Picker(selection: $selectionUpdates) {
                ForEach(0..<settingsUpdates.count) {
                    Text(settingsUpdates[$0])
                }
            } label: {
                HStack() {
                    Text(Constants.availableVersions)
                        .font(.system(size: 18))
                        .foregroundColor(.primary)
                    Spacer()
                    ZStack {
                        Circle().foregroundColor(.red).frame(width: 25)
                        Text("3").foregroundStyle(.white)
                    }
                }
            }.pickerStyle(.navigationLink)
        }
    }
    
    // MARK: - Private Properties
    
    private var settingsUpdates: [String] = []
}

// MARK: - Preview

#Preview {
    SoftwareUpdateSectionView()
}
