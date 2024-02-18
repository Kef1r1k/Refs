//
//  RegistrationCV.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 06.02.2024.
//

import SwiftUI

struct RegistrationCV: View {
    
    @StateObject var viewModel = RegistrationModel()
    
    var body: some View {
        ZStack{
            Color.lightGray.ignoresSafeArea()
            
            VStack(spacing: 18){
                
                Image("Logo-black").font(.system(size: 40))
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    TextField("Name", text: $viewModel.name, prompt: Text("Name")).font(.system(size: 16))
                        .foregroundColor(.blue)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    TextField("Nickname", text: $viewModel.nickname, prompt: Text("Nickname")).font(.system(size: 16))
                        .foregroundColor(.blue)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    TextField("Email", text: $viewModel.email, prompt: Text("Email")).frame(alignment: .center).font(.system(size: 16))
                        .foregroundColor(.blue)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    TextField("Password", text: $viewModel.password, prompt: Text("Password")).frame(alignment: .center).font(.system(size: 16))
                        .foregroundColor(.blue)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                }.padding()
            }.padding()
        }
    }
}
