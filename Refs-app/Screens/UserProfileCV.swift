//
//  UserProfileCV.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 18.02.2024.
//

import SwiftUI

struct UserProfileCV: View {
    
    @StateObject var viewModel = UserModel()
    
    var body: some View {
        Form {
            Section {
                HStack{
                    ChangableAvatarView(viewModel: viewModel)
                    VStack{
                        TextField("Name", text: $viewModel.name, prompt: Text("Имя")).frame(alignment: .center)
                    }.padding(.leading, 30)
                }
            }
            
            Section {
                TextField("Email", text: $viewModel.email, prompt: Text("Email name")).frame(alignment: .center)
            }
            
            Section{
                TextField("Telegram", text: $viewModel.tg, prompt: Text("Telegram")).frame(alignment: .center)
            }
                
                TextField("Nickname", text: $viewModel.nickname, prompt: Text("Nickname")).frame(alignment: .center)
                
                TextField("Birthday", text: $viewModel.birthday, prompt: Text("День рождения")).frame(alignment: .center)
                
            
            
            Section {
                Button(action: {
                    viewModel.saveInUserDefaults()
                }, label: {
                    Text("Save")
                })
                
                Button(action: {
                    restore(viewModel: viewModel)
                }, label: {
                    Text("Cancel")
                })
                
            }
        }
        .padding().onAppear{
            restore(viewModel: viewModel)
        }
        
    }
    
    @MainActor
    func restore(viewModel: UserModel) {
        let data = UserDefaults.standard.data(forKey: "Avatar") ?? UIImage(named: "Warning")!.jpegData(compressionQuality: 1)!
        let image = UIImage(data: data)!
        viewModel.setImageStateSuccess(image: Image(uiImage: image))
        
        for key in viewModel.keyValues {
            switch key {
                case "Name": viewModel.name = UserDefaults.standard.string(forKey: key) ?? ""
                case "Email": viewModel.email = UserDefaults.standard.string(forKey: key) ?? ""
                case "Nickname": viewModel.nickname = UserDefaults.standard.string(forKey: key) ?? ""
                case "TG": viewModel.tg = UserDefaults.standard.string(forKey: key) ?? ""
                case "Birthday": viewModel.birthday = UserDefaults.standard.string(forKey: key) ?? ""
                
            default: print("Unknown value")

            }
        }
    }
}

