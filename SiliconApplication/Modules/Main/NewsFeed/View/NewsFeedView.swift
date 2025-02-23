//
//  NewsFeedView.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import SwiftUI

struct NewsFeedView: View {
    
    @ObservedObject var viewModel: NewsFeedViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(Date().greetings)
                        .font(.title2)
                    
                    if viewModel.isUserNameEmpty {
                        // Если имя пустое, показываем поле ввода
                        CustomTextFieldWrapper(placeholder: "Как Вас зовут?", image: UIImage(systemName: "person.fill"), text: Binding(
                            get: { "" },
                            set: { newValue in
                                viewModel.updateUserName(newName: newValue)
                            }
                        ))
                        .frame(height: 50)
                    } else {
                        // Иначе показываем имя
                        Text(viewModel.userName ?? "Имя не задано")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
    }
}


