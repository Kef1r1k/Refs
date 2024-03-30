//
//  StartAuthS.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import SwiftUI

struct MainAuthS: View {
    @State private var errorState: ErrorState = .None
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightGray.ignoresSafeArea()
                VStack {
                    // Sign in button
                    NavigationLink(destination: SigninS(errorState: $errorState)) {
                        Text("Войти").frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.mainBlue)
                            .cornerRadius(30)
                    }.padding(.horizontal, 30)
                    
                    
                    
                    // Sign up button
                    NavigationLink(destination: SignupS(errorState: $errorState)) {
                        Text("Зарегистрироваться").frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
                            .foregroundColor(Color.mainBlue)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(30)
                    }.padding(.horizontal, 30)
                    
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
    }

