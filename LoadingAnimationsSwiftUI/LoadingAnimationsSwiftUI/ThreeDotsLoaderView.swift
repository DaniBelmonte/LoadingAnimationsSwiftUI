//
//  ContentView.swift
//  LoadingAnimationsSwiftUI
//
//  Created by Dani on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var leftDotOffset: CGFloat = 5.0
    @State private var middleDotYOffset: CGFloat = 0
    @State private var rightDotYOffset: CGFloat = 5

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Dot()
                    .offset(y: leftDotOffset)
                Dot()
                    .offset(y: middleDotYOffset)
                Dot()
                    .offset(y: rightDotYOffset)
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.42).repeatForever()) {
                    self.leftDotOffset = -5
                    self.middleDotYOffset = 10
                    self.rightDotYOffset = -5
                }
            }
        }
    }
}

struct Dot: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 15, height: 15)
    }
}

#Preview {
    ContentView()
}
