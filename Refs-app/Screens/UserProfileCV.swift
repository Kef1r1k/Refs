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
        VStack{
            Section {
                ChangableAvatarView(viewModel: viewModel)
            }.frame(width: 136, height: 136, alignment: .center).padding(.top, 50)
            Form {
                List{
                    
                    Section {
                        HStack(spacing: 12){
                            Image("NameIcon")
                            VStack(alignment: .leading, spacing: 2){
                                Text("Имя").foregroundStyle(Color.gray).font(.custom("Fugue-Regular", size: 12))
                                TextField("Name", text: $viewModel.name, prompt: Text("Имя")).frame(alignment: .center).font(Font.custom("Fugue-Regular", size: 16))
                            }
                        }
                    }
                    
                    Section{
                        HStack(spacing: 12){
                            Image("NicknameIcon")
                            VStack(alignment: .leading, spacing: 2){
                                Text("Ник").foregroundStyle(Color.gray).font(.custom("Fugue-Regular", size: 12))
                                TextField("Nickname", text: $viewModel.nickname, prompt: Text("Nickname")).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16))
                            }
                        }
                    }
                    
                    Section {
                        HStack(spacing: 12){
                            Image("EmailIcon")
                            VStack(alignment: .leading, spacing: 2){
                                Text("Почта").foregroundStyle(Color.gray).font(.custom("Fugue-Regular", size: 12))
                                TextField("Email", text: $viewModel.email, prompt: Text("Email name")).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16))
                            }
                        }
                    }
                }.listSectionSpacing(.compact)
                
                List{
                    Section{
                        HStack(spacing: 12){
                            Image("TgIcon")
                            VStack(alignment: .leading, spacing: 2){
                                Text("Телеграм").foregroundStyle(Color.gray).font(.custom("Fugue-Regular", size: 12))
                                TextField("Telegram", text: $viewModel.tg, prompt: Text("Telegram")).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16))
                            }
                        }
                    }
                    
                    Section{
                        HStack(spacing: 12){
                            Image("BirthdayIcon")
                            //                        TextField("Birthday", text: $viewModel.birthday, prompt: Text("День рождения")).frame(alignment: .center)
                            VStack(alignment: .leading, spacing: 2){
                                Text("Дата рождения").foregroundStyle(Color.gray).font(.custom("Fugue-Regular", size: 12))
                                DatePicker("", selection: $viewModel.birthday, displayedComponents: .date).datePickerStyle(.compact).font(.custom("Fugue-Regular", size: 16))
                            }
                        }
                    }
                }.listSectionSpacing(.compact)
            }.scrollContentBackground(.hidden)
                .padding().onAppear{
                    restore(viewModel: viewModel)
                }
            
            HStack(alignment: .center, spacing: 12){
                SecondaryButton(text: "сбросить") {
                    restore(viewModel: viewModel)
                }
                
                PrimaryButton(text: "сохранить") {
                    viewModel.saveInUserDefaults()
                }
            }.padding().padding(.bottom, 52)
        }.background(Color.lightGray)
    }
    
    @MainActor
    func restore(viewModel: UserModel) {
        let data = UserDefaults.standard.data(forKey: "Avatar") ?? UIImage(named: "Warning")!.jpegData(compressionQuality: 1)!
        let image = UIImage(data: data)!
        viewModel.setImageStateSuccess(image: Image(uiImage: image))
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        var birthdayString = df.string(from: viewModel.birthday)
        
        for key in viewModel.keyValues {
            switch key {
                case "Name": viewModel.name = UserDefaults.standard.string(forKey: key) ?? ""
                case "Email": viewModel.email = UserDefaults.standard.string(forKey: key) ?? ""
                case "Nickname": viewModel.nickname = UserDefaults.standard.string(forKey: key) ?? ""
                case "TG": viewModel.tg = UserDefaults.standard.string(forKey: key) ?? ""
                case "Birthday": viewModel.birthday = UserDefaults.standard.object(forKey: key) as! Date

            default: print("Unknown value")

            }
        }
    }
}

