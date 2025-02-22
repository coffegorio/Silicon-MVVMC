//
//  ProfileView.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Button {
            viewModel.logOut() // Вызываем метод logOut при нажатии на кнопку
        } label: {
            Text("Выйти")
                .padding()
                .background(Color(ApplicationColors.mochaMousse))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
        }
    }
}


