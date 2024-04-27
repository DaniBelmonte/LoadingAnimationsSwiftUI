//
//  LoadingTextMovingView.swift
//  LoadingAnimationsSwiftUI
//
//  Created by Dani on 28/4/24.
//

import SwiftUI

struct LoadingTextMovingView: View {

    @State var isLoading = true

    var body: some View {
        HStack(spacing: 2) {
            ForEach(Array("LOADING..."), id: \.self) {
                character in
                Text(character.uppercased())
                    .font(Font.system(size: 20))
                    .fontWeight(.semibold)
                    .keyframeAnimator(initialValue: AnimationValues(), repeating: true) { content, value in
                        content
                            .rotationEffect(value.angle)
                            .scaleEffect(value.scale)
                            .offset(y: value.verticalTranslation)
                    } keyframes: { _ in
                        let randomAngle1 = Double.random(in: -4...(-0.5))
                        let randomAngle2 = Double.random(in: -0.5...3)
                        let randomTranslation1 = Double.random(in: -4...(-0.5))
                        let randomTranslation2 = Double.random(in: -0.5...3)

                        KeyframeTrack(\.angle) {
                            CubicKeyframe(.degrees(randomAngle1), duration: 0.5)
                            CubicKeyframe(.degrees(randomAngle2), duration: 0.5)
                            CubicKeyframe(.degrees(randomAngle1), duration: 0.5)
                            CubicKeyframe(.degrees(1), duration: 0.5)
                        }

                        KeyframeTrack(\.scale) {
                            CubicKeyframe(1, duration: 0.5)
                            CubicKeyframe(1.1, duration: 0.5)
                            SpringKeyframe(1.2, duration: 0.5)
                            CubicKeyframe(1, duration: 0.5)
                        }

                        KeyframeTrack(\.verticalTranslation) {
                            CubicKeyframe(randomTranslation1, duration: 0.5)
                            CubicKeyframe(randomTranslation2, duration: 0.5)
                            CubicKeyframe(randomTranslation1, duration: 0.5)
                            CubicKeyframe(1, duration: 0.5)
                        }
                    }

            }
        }
    }
}

struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
}




#Preview {
    LoadingTextMovingView()
}
