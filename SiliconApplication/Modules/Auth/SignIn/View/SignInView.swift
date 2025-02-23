//
//  SignInView.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 28) {
                Image("logo")
                    .appLogoStyle()
                Text("Идеи, цели, успех")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("Ставьте задачи, делитесь идеями, создавайте презентации и вдохновляйте других на развитие.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "envelope.fill"), text: $email)
                    .frame(height: 50)
                
                CustomTextFieldWrapper(placeholder: "Пароль", image: UIImage(systemName: "lock.fill"), text: $password)
                    .frame(height: 50)
                
                Button {
                    viewModel.finishAuth(email: email, password: password)
                } label: {
                    Text("Войти")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(email.isEmpty || password.isEmpty ? Color.gray : Color(ApplicationColors.chocolateMartiny))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(email.isEmpty || password.isEmpty ? Color.white.opacity(0.5) : .white)
                }
                .disabled(email.isEmpty || password.isEmpty)
                
                Button {
                    viewModel.showSignUp()
                } label: {
                    Text("Зарегистрироваться")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.label))
                }
                
                Button {
                    viewModel.showResetPassword()
                } label: {
                    Text("Забыли пароль?")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.label))
                }
                
                Button {
                    viewModel.showMainAuth()
                } label: {
                    Text("Назад")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.label))
                }
            }
            .padding(20)
            .disabled(viewModel.isLoading)
            
            if viewModel.isLoading {
                Color.black.opacity(0.4).ignoresSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}
