//
//  MyQRView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 25/05/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MyQRView: View {

    var user: User
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from: "\(user.email) \n \(user.userName)"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.8)
            
            Text(user.email ?? "")
            Text(user.userName ?? "")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
