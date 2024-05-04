//
//  ToggleView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 02.05.24.
//

import SwiftUI

struct ToggleView: View {
    
    // MARK: - @State Properties

    @State var isOn = false
    
    // MARK: - Body

    var body: some View {
        Toggle(isOn: $isOn, label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 30, height: 30)
                        .foregroundColor(iconColor)
                    image
                }
                
                Text(title)
                    .font(.system(size: 18))
            }
        })
        .padding([.top, .bottom], 3)
    }
    
    // MARK: - Public Properties
    
    var title: String
    var image: Image
    var iconColor: Color
}

#Preview {
    ToggleView(isOn: false, title: "AirMode", image: Image(systemName: "xmark"), iconColor: Color.orange)
}
