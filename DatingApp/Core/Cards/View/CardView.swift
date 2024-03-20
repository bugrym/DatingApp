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
            ZStack(alignment: .top) {
                Image(.photo1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth,
                           height: SizeConstants.cardHeight)
                
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
            xOffset = 0
            degrees = 0
        }
    }
}

#Preview {
    CardView()
}
