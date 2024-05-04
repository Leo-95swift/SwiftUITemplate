//
//  AlertView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 30.04.24.
//

import SwiftUI

struct AlertView: View {
    
    // MARK: - Constants
        
    enum Constants {
        static let title = "Alert & ActionSheet"
        static let alertExample = "Пример Alert"
        static let alertExampleWithLogic = "Пример Alert с 2\nкнопками и логикой"
        static let actionSheetExample = "Пример ActionSheet"
        static let ActionSheetExampleWithLogic = "Пример ActionSheet\nкнопками и логикой"
        static let dialogMessage = "Вы залили в ветку main"
        static let actionErrorText1 = "Поздравляю !!! Вы \n удалили репо."
        static let actionErrorText2 = "Жалкий трус"
        static let dialogError = "Проблемы в Github"

        static let dialogCancelButtonText = "Нет, это опасно "
        static let dialogOkButtonText = "Удалить репозиторий"
        static let showButtonText = "Показать"
        static let okButtonText = "Ок"
        static let cancelButtonText = "Cancel"
    }
    
    // MARK: - @State Private Properties
    
    @State private var isTimeToShowAlert = false
    @State private var isTimeToShowSecondAlert = false
    @State private var isTimeToShowActionSheet = false
    @State private var isAnyProblem = false
    @State private var alertWarningText = Constants.alertExampleWithLogic
    @State private var actionErrorText = Constants.alertExampleWithLogic
    
    // MARK: - Body
    
    var body: some View {
        
        Text(Constants.title)
            .font(Font.custom("Inter", size: 22))
            .fontWeight(.bold)
            .padding(.bottom, 70)
        
            .offset(x: 0, y: 40)
        
        HStack(alignment: .top , spacing: 58){
            texts
            
            VStack(alignment: .leading, spacing: 25){
                firstButton
                secondButton
                thirdButton
                fouthButton
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        Spacer()
        
    }
    
    // MARK: - UI Elements
    
    private var texts: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text(Constants.alertExample)
                .font(Font.system(size: 14, weight: .bold))
                .frame(width: 150, height: 48, alignment: .leading)
            
            Text(alertWarningText)
                .frame(width: 150, height: 48,  alignment: .leading)
                .font(Font.system(size: 14, weight: .bold))
            
            Text(Constants.actionSheetExample)
                .frame(width: 150, height: 48, alignment: .leading)
                .font(Font.system(size: 14, weight: .bold))
            
            Text(actionErrorText)
                .frame(width: 150, height: 48, alignment: .leading)
                .font(Font.system(size: 14, weight: .bold))
        }
    }
    
    private var firstButton: some View {
        Button(action: {
            isTimeToShowAlert = true
        }, label: {
            Text(Constants.showButtonText)
                .frame(width: 150, height: 48)
                .foregroundColor(Color.white)
                .background(Color(.buttonBackground))
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                .alert(isPresented: $isTimeToShowAlert,content: {
                    Alert(title: Text("Возьмите пример \n у Алерта"))
                })
        })
    }
    
    private var secondButton: some View {
        Button(action: {
            isTimeToShowSecondAlert = true
        }, label: {
            Text(Constants.showButtonText)
                .frame(width: 150, height: 48)
                .foregroundColor(Color.white)
                .background(Color(.buttonBackground))
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                .alert("Пример Alert с 2 кнопками и логикой", isPresented: $isTimeToShowSecondAlert) {
                    Button(Constants.okButtonText, role: .destructive) {
                        alertWarningText = "Всем на пол !!! Работает Алерт"
                    }
                    Button(Constants.cancelButtonText, role: .cancel) {}
                }
        })
    }
    
    private var thirdButton: some View {
        Button(action: {
            isTimeToShowActionSheet = true
        }, label: {
            Text(Constants.showButtonText)
                .frame(width: 150, height: 48)
                .foregroundColor(Color.white)
                .background(Color(.buttonBackground))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 0.0, y: 3.0)
        }).confirmationDialog("Action sheet",
                              isPresented: $isTimeToShowActionSheet) {
            Button("Здесь могла быть ваша реклама") {}
        }
    }
    
    private var fouthButton: some View {
        Button(action: {
            isAnyProblem = true
        }, label: {
            Text(Constants.showButtonText)
                .frame(width: 150, height: 48)
                .foregroundColor(Color.white)
                .background(Color(.buttonBackground))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 0.0, y: 3.0)
            
        }).confirmationDialog(Constants.dialogError,
                              isPresented: $isAnyProblem,
                              titleVisibility: .visible) {
            Button(Constants.dialogOkButtonText, role: .destructive, action: {
                actionErrorText = Constants.actionErrorText1
            })
            Button(Constants.dialogCancelButtonText, role: .none, action: {
                actionErrorText = Constants.actionErrorText2
            })
        } message: {
            Text(Constants.dialogMessage)
        }
    }

}

#Preview {
    AlertView()
}
