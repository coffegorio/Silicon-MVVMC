//
//  LogoModifier.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI

extension Image {
    func appLogoStyle(width: CGFloat = 200, height: CGFloat = 60) -> some View {
        self
            .resizable()
            .frame(width: width, height: height)
    }
}

extension Image {
    func imageConfiguration(width: CGFloat = 50, height: CGFloat = 50) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}
