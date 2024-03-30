//
//  MainS.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import SwiftUI

struct MainS: View
{
    @StateObject private var viewModel = AuthViewModel()
    @Binding var errorState: ErrorState
    @State private var authorized = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            ZStack{
                Image("Welcome").frame(maxWidth: .infinity).ignoresSafeArea()
                VStack(spacing: 90) {
                    Spacer()
                    
                    VStack(spacing: 14){
                        Text("Добро пожаловать!").frame(maxWidth: .infinity, alignment: .center).font(.custom("Fugue-Regular", size: 36))
                        Text("Выполняй задания и развивай свою креативность").frame(width: 320, alignment: .center).font(.custom("Fugue-Regular", size: 16)).multilineTextAlignment(.center)
                    }
                    NavigationLink(destination: ContentView()) {
                        Text("К заданиям!").frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.mainBlue)
                            .cornerRadius(30)
                    }.isDetailLink(false).padding(.horizontal, 30)
                    
                }.padding(.bottom, 60)
            }.padding(.bottom, 60)
                .padding()
                .onReceive(viewModel.$errorState) { newState in
                    if case .Success(_) = errorState {
                        if case .None = newState {
                            return
                        }
                    }
                    withAnimation {
                        errorState = newState
                    }
                }
    }
}

