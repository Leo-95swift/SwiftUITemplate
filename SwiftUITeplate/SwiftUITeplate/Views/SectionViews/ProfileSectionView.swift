//
//  ProfileSectionView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 01.05.24.
//

import SwiftUI
@available(iOS 16.0, *)
struct ProfileSectionView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let profileImageName = "profile"
        static let numberThree = "3"
        static let profileName = "Evgeny"
        static let profileDescription = "Apple ID, iCloud, контент и покупки"
        static let appleSuggestions = "Предложения Apple ID"

    }
    
    // MARK: - @State Private Properties
    
    @State private var selectionProfile = 0
    @State private var selectionOffers = 0
    
    // MARK: - Body
    
    var body: some View {
        Section {
            HStack {
                Image(Constants.profileImageName)
                Picker(selection: $selectionProfile) {
                    ForEach(0..<settingsProfile.count) {
                        Text(settingsProfile[$0])
                    }
                } label: {
                    VStack(alignment: .leading) {
                        Text(Constants.profileName)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.primary)
                            .padding(.bottom, 5)
                        Text(Constants.profileDescription)
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                            
                    }
                    .padding()
                }.pickerStyle(.navigationLink)
            }
            
            HStack {
                Picker(selection: $selectionProfile) {
                    ForEach(0..<settingsProfile.count) {
                        Text(settingsProfile[$0])
                    }
                } label: {
                    HStack() {
                        Text(Constants.appleSuggestions)
                            .font(.system(size: 18))
                            .foregroundColor(.primary)
                        Spacer()
                        ZStack {
                            Circle().foregroundColor(.red).frame(width: 25)
                            Text(Constants.numberThree).foregroundStyle(.white)
                        }
                    }
                }.pickerStyle(.navigationLink)
            }
        }
    }
    // MARK: - Private Properties

    private var settingsProfile: [String] = []
    private var settingsOffers: [String] = []
}

// MARK: - Preview

#Preview {
    ProfileSectionView()
}
