//
//  SignInView.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            VStack(spacing: 28) {
                Image("logo")
                    .appLogoStyle()
                Text("Идеи, цели, успех")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(ApplicationColors.labelColor))
                    .padding(.top, 20)
                Text("Ставьте задачи, делитесь идеями, создавайте презентации и вдохновляйте других на развитие.")
                    .font(.system(size: 18))
                    .foregroundStyle(Color(ApplicationColors.labelColor))
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "envelope.fill"), text: $email)
                    .frame(height: 50)
                CustomTextFieldWrapper(placeholder: "Электронная почта", image: UIImage(systemName: "lock.fill"), text: $password)
                    .frame(height: 50)
                
                Button {} label: {
                    Text("Войти")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(ApplicationColors.chocolateMartiny))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                }
                Button {} label: {
                    Text("Зарегистрироваться")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(ApplicationColors.chocolateMartiny))
                }
                Button {} label: {
                    Text("Забыли пароль?")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(ApplicationColors.chocolateMartiny))
                }
            }
            .padding(20)
        }
        
    }
}

//#Preview {
//    SignInView()
//}
