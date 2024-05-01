//
//  ContentView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 29.04.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Constants
    
    private enum Constants {
        static let switchTitleText = "Показать мой кошелек"
        static let fontType = "Inter"
        static let moneyStatus = "доступно"
        static let fillUpOptionButton = "fillUp"
        static let fillUpOptionText = "Пополнить"
        static let transferOptionButton = "transfer"
        static let transferOptionText = "Перевести"
        static let openOptionButton = "open"
        static let openOptionText = "Открыть\nкарту"

    }
    
    // MARK: - Body

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                backgroundView
                toggleView
            }
            VStack(alignment: .leading, spacing: 30) {
                cardNameView
                cardView
                optionsView
            }.padding(40)
        }

    }
    
    // MARK: - @State Private Properties

    @State var isOnToggle = false
    
    // MARK: - Visual Elements
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.viewBackground)
    }
    
    private var toggleView: some View {
        Toggle(isOn: $isOnToggle, label: {
            Text(Constants.switchTitleText)
                .font(Font.custom(Constants.fontType, size: 21))
                .fontWeight(.bold)
        }).frame(width: 340, height: 40)
    }
    
    private var cardNameView: some View {
        Text("Карта1")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(width: 360, height: 30, alignment: .leading)
    }
    
    private var cardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 360, height: 200)
                .foregroundColor(Color.cardBackground)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("50000")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Text(Constants.moneyStatus)
                            .font(.system(size: 16))
                            .foregroundColor(Color(.statusForeground))
                    }.padding(20)
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image("cardName")
                        .padding()
                }
            }
        }
        .frame(width: 360, height: 200)
    }
    
    private var optionsView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .frame(width: 360, height: 88)
            HStack(spacing: 14) {
                VStack(spacing: 8) {
                    Image(Constants.fillUpOptionButton)
                    Text(Constants.fillUpOptionText)
                        .frame(width: 110, height: 34)
                        .font(.system(size: 14))
                }
                VStack(spacing: 8) {
                    Image(Constants.transferOptionButton)
                    Text(Constants.transferOptionText)
                        .frame(width: 110, height: 34)
                        .font(.system(size: 14))
                }
                VStack(spacing: 8) {
                    Image(Constants.openOptionButton)
                    Text(Constants.openOptionText)
                        .multilineTextAlignment(.center)
                        .frame(width: 110, height: 34)
                        .font(.system(size: 14))
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
