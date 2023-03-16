//
//  Bai4View.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 15/03/2023.
//

import SwiftUI

enum TypeSquare: CaseIterable {
    case red
    case green
    case purple
    case yellow
    case none
}

struct Bai4View: View {

    var sizeSquare = UIScreen.main.bounds.height - 75
    @State var type: TypeSquare = .none

    var body: some View {
        VStack (spacing: 15) {
            Bai4SquareView(type: .red, color: .red, size: (sizeSquare - getSizeSafeArea().top - getSizeSafeArea().bottom) / 4, typeZoomIn: type)
                .onTapGesture {
                    type = .red
                }
                .padding(.top, 15)
            Bai4SquareView(type: .green, color: .green, size: (sizeSquare - getSizeSafeArea().top - getSizeSafeArea().bottom) / 4, typeZoomIn: type)
                .onTapGesture {
                    type = .green
                }
            Bai4SquareView(type: .purple, color: .purple, size: (sizeSquare - getSizeSafeArea().top - getSizeSafeArea().bottom) / 4, typeZoomIn: type)
                .onTapGesture {
                    type = .purple
                }
            Bai4SquareView(type: .yellow, color: .yellow, size: (sizeSquare - getSizeSafeArea().top - getSizeSafeArea().bottom) / 4, typeZoomIn: type)
                .onTapGesture {
                    type = .yellow
                }
                .padding(.bottom, 15)
        }
    }
    
    func getSizeSafeArea() -> (top: CGFloat, bottom: CGFloat) {
        
        let keyWindow = UIApplication.shared.connectedScenes
        
            .filter({$0.activationState == .foregroundActive})
        
            .map({$0 as? UIWindowScene})
        
            .compactMap({$0})
        
            .first?.windows
        
            .filter({$0.isKeyWindow}).first
        
        guard let sizeTop = keyWindow?.safeAreaInsets.top,
              let sizeBottm = keyWindow?.safeAreaInsets.bottom  else { return (top: 0, bottom: 0) }
        
        return (top: sizeTop, bottom: sizeBottm)
        
    }
}

struct Bai4View_Previews: PreviewProvider {
    static var previews: some View {
        Bai4View()
    }
}

struct Bai4SquareView: View {

    var type: TypeSquare
    var color: Color
    var size: CGFloat
    var typeZoomIn: TypeSquare = .none

    var body: some View {
        
        if typeZoomIn == .none {
            Rectangle()
                .foregroundColor(color)
                .frame(width: size, height: size)
        } else {
            if type == typeZoomIn {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: size * 1.5, height: size * 1.5)
            } else {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: size * 0.75, height: size * 0.75)
            }
        }
    }
}
