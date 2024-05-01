//
//  PickerView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 02.05.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct PickerView: View {
    
    // MARK: - @State Properties

    @State var selection: Int
    
    // MARK: - Body

    var body: some View {
        Picker(selection: $selection) {
            ForEach(0..<options.count) {
                Text(options[$0])
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 30, height: 30)
                        .foregroundColor(iconColor)
                    image
                        .foregroundColor(.white)
                }
                
                Text(title)
                    .foregroundStyle(.primary)
            }
        }
        .pickerStyle(.navigationLink)
        .padding([.top, .bottom], 3)
    }
    
    // MARK: - Public Properties

    var title: String
    var options: [String]
    var image: Image
    var iconColor: Color

}

#Preview {
    PickerView(selection: 1, title: "Wi-Fi", options: ["On", "Off"], image: Image(systemName: "xmark"), iconColor: Color.orange)
}
