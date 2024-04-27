//
//  ProgressBarView.swift
//  LoadingAnimationsSwiftUI
//
//  Created by Dani on 27/4/24.
//

import SwiftUI

struct ProgressBar: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0
    var barWidth: CGFloat = 200

    var body: some View {
        VStack {
            Text("LOADING... \(Int(progress * 100))%")
            VStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: barWidth, height: 15)
                        .overlay {
                            Rectangle()
                                .stroke(.black, lineWidth: 5)
                        }

                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: barWidth * progress, height: 10)
                }
                .frame(height: 10)
                .onAppear {
                    startAnimation()
                }
            }
        }
        .background(Color.white)
    }

    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation(.linear(duration: 0.1)) {
                progress += 0.01
                if progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ProgressBarView: View {
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(barWidth: UIScreen.main.bounds.width)
        }    }
}

#Preview {
    ProgressBarView()
}
