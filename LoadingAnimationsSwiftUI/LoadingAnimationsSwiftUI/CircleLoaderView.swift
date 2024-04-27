//
//  CircleLoader.swift
//  LoadingAnimationsSwiftUI
//
//  Created by Dani on 27/4/24.
//

import SwiftUI

struct CircleLoader: View {
    @State private var isLoading = false

    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.blue, lineWidth: 3)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(isLoading ? 360 : 0))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.isLoading = true
                    }
                }
        }
    }
}

#Preview {
    CircleLoader()
}
