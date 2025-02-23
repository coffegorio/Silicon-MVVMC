//
//  SignUpView.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 28) {
                Image("logo")
                    .appLogoStyle()
                Text("Регистрация")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("Создайте учетную запись, чтобы получить полный доступ к возможностям Silicon.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "envelope.fill"), text: $email)
                    .frame(height: 50)
                CustomTextFieldWrapper(placeholder: "Пароль", image: UIImage(systemName: "lock.fill"), text: $password)
                    .frame(height: 50)
                Button {
                    viewModel.finishSignUp(email: email, password: password)
                } label: {
                    Text("Зарегистрироваться")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(email.isEmpty || password.isEmpty ? Color.gray : Color(ApplicationColors.chocolateMartiny))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(email.isEmpty || password.isEmpty ? Color.white.opacity(0.5) : .white)
                }
                .disabled(email.isEmpty || password.isEmpty)
                
                Button {
                    viewModel.backToLogin()
                } label: {
                    Text("Назад")
                        .foregroundStyle(Color(.label))
                }
            }
            .padding(20)
            
            if viewModel.isLoading {
                Color.black.opacity(0.4).ignoresSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Регистрация"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
