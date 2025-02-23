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
            }
            .padding()
        }
    }
}

