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
