//
//  CircleDotsLoaderView.swift
//  LoadingAnimationsSwiftUI
//
//  Created by Dani on 27/4/24.
//

import SwiftUI

struct CircleDotsLoaderView: View {
    @State private var isLoading = false
    private let duration: Double = 1 // Duración de la animación en segundos
    private let dotCount = 10

    var body: some View {
        ZStack {
            ForEach(0..<dotCount) { index in
                Circle()
                    .fill(Color.blue)
                    .frame(width: 5, height: 5)
                    .opacity(opacity(for: index))
                    .offset(y: -25)
                    .rotationEffect(rotationAngle(for: index))
                    .onAppear {
                        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(Double(index) * (duration / Double(dotCount)))) {
                            self.isLoading = true
                        }
                    }
            }
        }
    }

    private func opacity(for index: Int) -> Double {
        guard isLoading else { return 0 }
        return index == 0 ? 0 : Double(index) / Double(dotCount - 1)
    }

    private func rotationAngle(for index: Int) -> Angle {
        guard isLoading else { return .degrees(0) }
        let newIndex = Double(index) / Double(dotCount)
        return .degrees(newIndex * 360)
    }
}


#Preview {
    CircleDotsLoaderView()
}
