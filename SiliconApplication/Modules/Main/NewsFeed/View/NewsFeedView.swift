//
//  NewsFeedView.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var viewModel: NewsFeedViewModel
    @State private var localUserName: String = ""

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().greetings)
                    .font(.title2)
                
                HStack {
                    if viewModel.isUserNameEmpty {
                        CustomTextFieldWrapper(placeholder: "Как Вас зовут?", image: UIImage(systemName: "person.fill"), text: $localUserName)
                            .frame(height: 50)
                        
                        Button("Сохранить") {
                            viewModel.updateUserName(newName: localUserName)
                        }
                        .disabled(localUserName.trimmingCharacters(in: .whitespaces).isEmpty)
                    } else {
                        Text(viewModel.userName ?? "Имя не задано")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            // Блокируем взаимодействие с основным интерфейсом во время загрузки
            .disabled(viewModel.isLoading)
            
            if viewModel.isLoading {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}
