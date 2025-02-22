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
                Text(Date().greetings)
                    .font(.title2)
                if viewModel.isUsernameEntered {
                    Text(viewModel.user.username)
                        .font(.title2)
                } else {
                    CustomTextFieldWrapper(placeholder: "Как Вас зовут?", image: UIImage(systemName: "person.fill"), text: $viewModel.user.username)
                        .frame(height: 50)
                }
            }
            .padding()
        }
    }
}

