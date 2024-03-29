//
//  SignInS.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import SwiftUI

struct SigninS: View {
    @StateObject private var viewModel = AuthViewModel()
    @Binding var errorState: ErrorState
    
    @State private var authorized = false
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            NavigationView {
                ZStack{
                    Color.lightGray.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                    
                    VStack(spacing: 40) {
                        Spacer()
                        Image("Logo-black").font(.system(size: 40))
                        VStack(spacing: 20){
                            Section {
                                HStack(spacing: 12){
                                    Image("EmailIcon")
                                    TextField("Почта", text: $email).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16)).onAppear {
                                        email = ""
                                        password = ""
                                    }
                                    
                                }.padding(16).frame(maxWidth: .infinity).background(Color.white).cornerRadius(10)
                            }.padding(.horizontal, 30)
                            
                            Section{
                                PasswordTextField("Пароль", text: $password, isSecure: !isPasswordVisible)
                                    .overlay {
                                        HStack {
                                            Spacer()
                                            Button {
                                                isPasswordVisible.toggle()
                                            } label: {
                                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                                    .foregroundColor(.secondary)
                                            }
                                            .padding(.trailing, 8)
                                        }
                                    }
                                Spacer()
                            }.padding(.horizontal, 30)
                        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.lightGray).ignoresSafeArea()
                        
                        Button {
                            let body: [String: Any] = [
                                "user": [
                                    "email": email,
                                    "password": password
                                ]
                            ]
                            viewModel.postRequest(endpoint: "sign_in", body: body, callback: { jwt in
                                if jwt.count > 0 {
                                    print(jwt)
                                    authorized = true
                                    errorState = .Success(message: "You are signed in successfully.")
                                }
                            })
                        } label: {
                            Text("Войти").frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
                                .foregroundColor(Color.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal)
                                    .background(Color.mainBlue)
                                    .cornerRadius(30)
                        }.padding(.horizontal, 30).padding(.bottom, 60)
                    }.background(Color.lightGray).navigate(to: MainS(errorState: $errorState), when: $authorized)
                }.ignoresSafeArea()
            }.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea().background(Color.lightGray)
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
            .overlay (
                ErrorView(errorState: $errorState)
            )
        }
        
    }


extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

