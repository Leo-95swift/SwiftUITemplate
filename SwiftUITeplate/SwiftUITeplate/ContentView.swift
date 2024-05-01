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
        static let transferAlertText = "Завершено"
        static let transferAlertMessage = "Перевод исполнен"
        static let transferMessage = "Перевод будет сделан \nна карту MIR  **0002"
        static let moneyStatus = "доступно"
        static let fontType = "Inter"
        static let fillUpOptionButton = "fillUp"
        static let fillUpOptionText = "Пополнить"
        static let transferOptionButton = "transfer"
        static let transferOptionText = "Перевести"
        static let openOptionButton = "open"
        static let openOptionText = "Открыть\nкарту"
        static let card = "card"
        static let cardInfo1 = "MIR  **0001"
        static let cardInfo2 = "MIR  **0002"
        static let cardInfo3 = "MIR  **0003"
    }
    
    // MARK: - Body

    var body: some View {
        ZStack(alignment: .topLeading) {
            cardsView
            VStack {
                backgroundView
                    .offset(x: isOnToggle ? 185 : 0)
                toggleView
            }
            VStack(alignment: .leading, spacing: 30) {
                cardNameView
                cardView
                optionsView
            }
            .padding(40)
            .offset(x: isOnToggle ? 185 : 0)
        }
        .alert("Перевод", isPresented: $showTransferAlert) {
            TextField("Введите сумму перевода", text: $amountTextField)
                .keyboardType(.numberPad)
            Button("Cancel") { }
            Button("OK") {
                firstAccountBalance -= Double(amountTextField) ?? 0.0
                currentAccountBalance -= Double(amountTextField) ?? 0.0
                secondAccountBalance += Double(amountTextField) ?? 0.0
            }
        } message: {
            Text(Constants.transferMessage)
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text(Constants.transferAlertText),
                message: Text(Constants.transferAlertMessage),
                buttons: [.default(Text("OK"))])
        }

    }
    
    // MARK: - @State Private Properties

    @State private var isOnToggle = false
    @State private var amountTextField = ""
    @State private var firstAccountBalance = 50000.0
    @State private var secondAccountBalance = 100000.0
    @State private var thirdAccountBalance = 1000.0
    @State private var currentAccountBalance = 50000.0
    @State private var currentCardName = Constants.cardInfo1
    @State private var showActionSheet = false
    @State private var showTransferAlert = false

    // MARK: - Visual Elements
    
    private var cardsView: some View {
        VStack(alignment: .leading) {
            cardView(amount: CurrencyFormatter
                .formatCurrency(amount: firstAccountBalance))
            Divider()
            cardView(amount: CurrencyFormatter
                .formatCurrency(amount: secondAccountBalance))
            Divider()
            cardView(amount: CurrencyFormatter
                .formatCurrency(amount: thirdAccountBalance))
            Divider()
        }
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.viewBackground)
    }
    
    private var toggleView: some View {
        Toggle(isOn: $isOnToggle.animation(.spring(
            response: 0.6,
            dampingFraction: 0.7,
            blendDuration: 0.6
        )), label: {
            Text(Constants.switchTitleText)
                .font(Font.custom(Constants.fontType, size: 21))
                .fontWeight(.bold)
        }).frame(width: 340, height: 40)
    }
    
    private var cardNameView: some View {
        Text("Карта \(currentCardName)")
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
                        Text(CurrencyFormatter
                            .formatCurrency(amount: currentAccountBalance))
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
                    Button(action: topUpBalance) {
                        VStack(spacing: 8) {
                        Image(Constants.fillUpOptionButton)
                        Text(Constants.fillUpOptionText)
                            .frame(width: 110, height: 34)
                            .font(.system(size: 14))
                    }
                }
                Button(action: transferMoney) {
                    VStack(spacing: 8) {
                        Image(Constants.transferOptionButton)
                        Text(Constants.transferOptionText)
                            .frame(width: 110, height: 34)
                            .font(.system(size: 14))
                    }
                }
                Button(action: topUpBalance) {
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
    
    // MARK: - Private Methods
    
    private func topUpBalance() {
        switch currentCardName {
        case Constants.cardInfo1:
            firstAccountBalance += 1000
        case Constants.cardInfo2:
            secondAccountBalance += 1000
        case Constants.cardInfo3:
            thirdAccountBalance += 1000
        default:
            break
        }
        currentAccountBalance += 1000
        showActionSheet = true
    }
    
    private func transferMoney() {
        showTransferAlert = true
    }
    
    private func cardView(amount: String) -> some View {
        VStack {
            HStack {
                Image(Constants.card)
                    .frame(width: 25, height: 25)
                    .padding(.leading, 20)
                VStack(alignment: .leading) {
                    Text(amount)
                        .font(Font.custom(Constants.fontType, size: 12))
                        .fontWeight(.bold)
                    Text(Constants.cardInfo1)
                        .font(Font.custom(Constants.fontType, size: 10))
                }
            }
        }.padding(10)
    }

}

#Preview {
    ContentView()
}
