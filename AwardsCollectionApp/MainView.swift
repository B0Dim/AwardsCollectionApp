//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by  BoDim on 16.02.2022.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
//                        .animation(.default)
                }
            }
            
            Spacer()
            if showAward {
                GradientRectangles()
                    .frame(width: 250, height: 250)
                    .transition(.transition)
//                    .transition(.scale)
            }
            Spacer()
//            GradientRectangles()
//                .frame(width: 250, height: 250)
//                .offset(x: showAward ? 0 : -UIScreen.main.bounds.width)
//                .animation(.easeInOut(duration: 0.7))
//                .animation(
//                    .spring().repeatCount(2, autoreverses: false)
//                    .spring(
//                        response: 0.55,
//                        dampingFraction: 0.45,
//                        blendDuration: 0
//                        )
//                    .interpolatingSpring(
//                        mass: 1.0,
//                        stiffness: 100,
//                        damping: 10,
//                        initialVelocity: 0
//                      )
//                    )

            
        }
        .font(.headline)
        .padding()
    }

    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
    
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
