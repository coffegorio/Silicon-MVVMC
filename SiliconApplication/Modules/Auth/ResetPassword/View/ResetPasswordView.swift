//
//  ResetPasswordView.swift
//  SiliconApplication
//
//  Created by Егорио on 19.02.2025.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @ObservedObject var viewModel: ResetPasswordViewModel
    @State private var email: String = ""
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 28) {
                Image("logo")
                    .appLogoStyle()
                Text("Забыли пароль?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("Не страшно, мы вышлем инструкцию по восстановлению на почту!")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "envelope.fill"), text: $email)
                    .frame(height: 50)
                Button {} label: {
                    Text("Восстановить")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(ApplicationColors.chocolateMartiny))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                }
                Button {
                    viewModel.backToLogin()
                } label: {
                    Text("Назад")
                        .foregroundStyle(Color(.label))
                }
            }
            .padding(20)
        }
    }
}
