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
                ChangableAvatarView(viewModel: viewModel)
            }
            
            List{

                Section {
                    HStack(spacing: 12){
                        Image("NameIcon").foregroundColor(.black)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Имя").foregroundStyle(Color.gray).font(.system(size: 12))
                            TextField("Name", text: $viewModel.name, prompt: Text("Имя")).frame(alignment: .center)
                        }
                    }
                }
                
                Section{
                    HStack(spacing: 12){
                        Image("NicknameIcon").foregroundColor(.black)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Ник").foregroundStyle(Color.gray).font(.system(size: 12))
                            TextField("Nickname", text: $viewModel.nickname, prompt: Text("Nickname")).frame(alignment: .center)
                        }
                    }
                }
                
                Section {
                    HStack(spacing: 12){
                        Image("EmailIcon").foregroundColor(.black)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Почта").foregroundStyle(Color.gray).font(.system(size: 12))
                            TextField("Email", text: $viewModel.email, prompt: Text("Email name")).frame(alignment: .center)
                        }
                    }
                }
            }.listSectionSpacing(.compact)
            
            List{
                Section{
                    HStack(spacing: 12){
                        Image("TgIcon").foregroundColor(.black)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Телеграм").foregroundStyle(Color.gray).font(.system(size: 12))
                            TextField("Telegram", text: $viewModel.tg, prompt: Text("Telegram")).frame(alignment: .center)
                        }
                    }
                }
                
                Section{
                    HStack(spacing: 12){
                        Image("BirthdayIcon").foregroundColor(.black)
                        //                        TextField("Birthday", text: $viewModel.birthday, prompt: Text("День рождения")).frame(alignment: .center)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Дата рождения").foregroundStyle(Color.gray).font(.system(size: 12))
                            DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date).datePickerStyle(.compact)
                        }
                    }
                }
            }.listSectionSpacing(.compact)
                
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
        }.background(Color.lightGray)
        .scrollContentBackground(.hidden)
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
            //case "Birthday": viewModel.birthday = UserDefaults.standard.
                
            default: print("Unknown value")

            }
        }
    }
}

