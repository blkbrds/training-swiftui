//
//  MyBadge.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 13/03/2023.
//

import SwiftUI

struct Mybadge: View {
    
    @State var numberBadge: Int

    func handleNumberBadge() -> (value: String, width: CGFloat) {
        switch numberBadge {
        case 0:
            return ("", 0)
        case 1...9:
            return ("\(numberBadge)", String(numberBadge).widthOfString(usingFont: .systemFont(ofSize: 25, weight: .bold)) + 17)
        case 10...99:
            return ("\(numberBadge)", String(numberBadge).widthOfString(usingFont: .systemFont(ofSize: 25, weight: .bold)) + 20)
        default:
            return ("99+", "99+".widthOfString(usingFont: .systemFont(ofSize: 23)) + 35)
            
        }
    }
    var body: some View {
        
        Text(handleNumberBadge().value)
            .frame(width: handleNumberBadge().width)
            .padding([.top, .bottom], 3)
            .font(.system(size: 23))
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(18)
            
    }
}

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
