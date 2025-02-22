//
//  SignUpView.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 28) {
                Image("logo")
                    .appLogoStyle()
                Text("Регистрация")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("Создайте учетную запись, что бы получить полный доступ к возможностям Silicon.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "envelope.fill"), text: $email)
                    .frame(height: 50)
                CustomTextFieldWrapper(placeholder: "Пароль", image: UIImage(systemName: "lock.fill"), text: $password)
                    .frame(height: 50)
                Button {} label: {
                    Text("Зарегистрироваться")
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
