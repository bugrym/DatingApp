//
//  CardView.swift
//  DatingApp
//
//  Created by vbugrym on 12.03.2024.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.photo1)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
            
            UserInfoView()
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

// MARK: - Gesture helpers
private extension CardView {
    private func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        xOffset = width
        degrees = Double(width / 25)
    }
    
    private func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(screenCutoff) {
            xOffset = 0
            degrees = 0
        }
    }
}

private extension CardView {
    private var screenCutoff: CGFloat {
        return (UIScreen.main.bounds.width / 2) * 0.8
    }
    private var cardWidth: CGFloat {
        return UIScreen.main.bounds.width - 20
    }
    
    private var cardHeight: CGFloat {
        return UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
