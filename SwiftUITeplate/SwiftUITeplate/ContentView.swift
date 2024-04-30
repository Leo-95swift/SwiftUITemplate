//
//  ContentView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 29.04.24.
//

import SwiftUI

struct ContentView: View {
    @State var isTimeToShowAlert = false
    @State var isTimeToShowSecondAlert = false
    @State var isTimeToShowActionSheet = false
    @State var defaultTextColor = Color.black
    @State var selectedTextColor = Color.red

    var body: some View {
            Text("Alert & ActionSheet")
                .font(.system(
                    size: 20, weight: .bold))
                .padding(.top, 40)
                .offset(x: 0, y: 10)
            
        HStack(alignment: .top, spacing: 60) {
                VStack(spacing: 24) {
                    Text("Пример Alert")
                        .font(.system(
                            size: 14, weight: .bold))
                    Text("Пример Alert с 2\nкнопками и логикой")
                        .font(.system(
                            size: 14, weight: .bold))
                    Text("Пример ActionSheet")
                        .font(.system(
                            size: 14, weight: .bold))
                    Text("Пример ActionSheet\nкнопками и логикой")
                        .font(.system(
                            size: 14, weight: .bold))
                }
                VStack {
                    Button(action: {
                        self.isTimeToShowAlert = true
                    }, label: {
                        Text("Показать")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 48)
                            .background(
                                Color.buttonBackground)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 1,
                                    x: 0, y: 3)
                    }).alert("Пример Alert", isPresented: $isTimeToShowAlert) {
                        Button("Ok", role: .destructive) {}
                    }
                    
                    Button(action: {
                        self.isTimeToShowSecondAlert = true
                    }, label: {
                        Text("Показать")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 48)
                            .background(
                                Color.buttonBackground)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 1,
                                    x: 0, y: 3)
                    }).alert("Пример Alert с 2 \nкнопками и логикой", isPresented: $isTimeToShowSecondAlert) {
                        Button("Ok", role: .destructive) {
                            
                        }
                        Button("Cancel", role: .cancel) {}
                    }
                    
                    Button(action: {
                        self.isTimeToShowActionSheet = true
                    }, label: {
                        Text("Показать")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 48)
                            .background(
                                Color.buttonBackground)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 1,
                                    x: 0, y: 3)
                    }).alert("Пример Alert с 2 \nкнопками и логикой", isPresented: $isTimeToShowActionSheet) {
                        Button("Ok", role: .destructive) {
                            
                        }
                        Button("Cancel", role: .cancel) {}
                    }
                    
                    Button(action: {
                        self.isTimeToShowActionSheet = true
                    }, label: {
                        Text("Показать")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 48)
                            .background(
                                Color.buttonBackground)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 1,
                                    x: 0, y: 3)
                    }).alert("Пример Alert с 2 \nкнопками и логикой", isPresented: $isTimeToShowActionSheet) {
                        Button("Ok", role: .destructive) {
                            
                        }
                        Button("Cancel", role: .cancel) {}
                    }
                }
            }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

#Preview {
    ContentView()
}
