//
//  AlertView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 30.04.24.
//

import SwiftUI

struct AlertView: View {
    
    @State var isTimeToShowAlert = false
    @State var isTimeToShowSecondAlert = false
    @State var isTimeToShowActionSheet = false
    @State var isAnyProblem = false
    @State var alertWarningText = "Пример Alert с 2 \nкнопками и логикой"
    @State var actionErrorText = "Пример ActionSheet кнопками и логикой"

    var body: some View {
        
        Text("Alert & ActionSheet")
            .font(Font.custom("Inter", size: 22))
            .fontWeight(.bold)
            .padding(.bottom, 70)
        
            .offset(x: 0, y: 40)
        
        HStack(alignment: .top , spacing: 58){
            VStack(alignment: .leading, spacing: 25) {
                Text("Пример Alert")
                    .font(Font.system(size: 14, weight: .bold))
                    .frame(width: 150, height: 48, alignment: .leading)
                
                Text(alertWarningText)
                    .frame(width: 150, height: 48,  alignment: .leading)
                    .font(Font.system(size: 14, weight: .bold))
                
                Text("Пример ActionSheet")
                    .frame(width: 150, height: 48, alignment: .leading)
                    .font(Font.system(size: 14, weight: .bold))
                
                Text(actionErrorText)
                    .frame(width: 150, height: 48, alignment: .leading)
                    .font(Font.system(size: 14, weight: .bold))
            }
            
            VStack(alignment: .leading, spacing: 25){
                Button(action: {
                    isTimeToShowAlert = true
                }, label: {
                    Text("Показать")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.buttonBackground))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                        .alert(isPresented: $isTimeToShowAlert,content: {
                            Alert(title: Text("Возьмите пример \n у Алерта"))
                        })
                })
                
                Button(action: {
                    isTimeToShowSecondAlert = true
                }, label: {
                    Text("Показать")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.buttonBackground))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                        .alert("Пример Alert с 2 кнопками и логикой", isPresented: $isTimeToShowSecondAlert) {
                            Button("Ok", role: .destructive) {
                                alertWarningText = "Всем на пол !!! Работает Алерт"
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                })
                
                Button(action: {
                    isTimeToShowActionSheet = true
                }, label: {
                    Text("Показать")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.buttonBackground))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0.0, y: 3.0)
                }).confirmationDialog("Action sheet",
                    isPresented: $isTimeToShowActionSheet) {
                    Button("Здесь могла быть ваша реклама") {}
                }
                
                Button(action: {
                    isAnyProblem = true
                }, label: {
                    Text("Показать")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.buttonBackground))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0.0, y: 3.0)

                }).confirmationDialog("Проблемы в Github",
                    isPresented: $isAnyProblem,
                    titleVisibility: .visible) {
                    Button("Удалить репозиторий", role: .destructive, action: {
                        actionErrorText = "Поздравляю !!! Вы \n удалили репо."
                    })
                    Button("Нет, это опасно ", role: .none, action: {
                        actionErrorText = "Жалкий трус"
                    })
                } message: {
                    Text("Вы залили в ветку main")
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        Spacer()
        
    }
}

#Preview {
    AlertView()
}
