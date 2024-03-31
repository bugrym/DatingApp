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
    @State private var currentImageIndex: Int = 0
    
    @State private var mockImages = ["photo_1", "photo_2", "photo_3"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(mockImages[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth,
                           height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: mockImages.count)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex,
                                       imageCount: mockImages.count)
                
                SwipeIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView()
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
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
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

private extension CardView {
    private func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    private func swipeRight() {
        xOffset = 500
        degrees = 12
    }
    
    private func swipeLeft() {
        xOffset = -500
        degrees = -12
    }
}

#Preview {
    CardView()
}
