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
            VStack {
                // Sign in button
                NavigationLink(destination: SigninS(errorState: $errorState)) {
                    Text("Sign in")
                }
                .font(.system(size: 25, weight: .bold))
                .frame(width: 200, height: 50)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
                }
                    
                    
                    // Sign up button
                    NavigationLink(destination: SignupS(errorState: $errorState)) {
                        Text("Sign up")
                    }
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 200, height: 30).padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
                    }
                    
                }.navigationTitle("Auth")
            }
        }
    }

