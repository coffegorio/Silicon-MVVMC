//
//  MainAuthView.swift
//  SiliconApplication
//
//  Created by Егорио on 19.02.2025.
//

import SwiftUI

struct MainAuthView: View {
    
    @ObservedObject var viewModel: MainAuthViewModel
    
    var body: some View {
        ZStack {
//            Color(.white)
//                .ignoresSafeArea(.all)
            VStack(spacing: 35) {
                Image("logo")
                    .appLogoStyle(width: 200, height: 60)
                Text("Войдите или зарегистрируйстесь, что бы начать")
                    .font(.title)
                    .fontWeight(.bold)
//                    .foregroundStyle(Color(ApplicationColors.labelColor))
                    .multilineTextAlignment(.center)
                Button {} label: {
                    HStack(spacing: 10) {
                        Text("Войти с помощью Google")
                            .mainAuthNavigationButton()
                        Image("googleIcon")
                            .imageConfiguration(width: 25, height: 25)
                    }
                    
                }
                Button {} label: {
                    HStack(spacing: 10) {
                        Text("Войти с помощью Apple")
                            .mainAuthNavigationButton()
                        Image(systemName: "apple.logo")
                            .imageConfiguration(width: 25, height: 25)
                            .foregroundStyle(.blue)
                    }
                }
                Button {
                    viewModel.showSignIn()
                } label: {
                    HStack(spacing: 10) {
                        Text("Войти с помощью e-mail")
                            .mainAuthNavigationButton()
                        Image(systemName: "envelope.fill")
                            .imageConfiguration(width: 25, height: 25)
                            .foregroundStyle(Color(ApplicationColors.mochaMousse))
                    }
                }
            }
            .padding(20)
        }
    }
}

extension View {
    func mainAuthNavigationButton() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(ApplicationColors.mochaMousse), lineWidth: 2)
            )
            .foregroundStyle(Color(.label))
    }
}

