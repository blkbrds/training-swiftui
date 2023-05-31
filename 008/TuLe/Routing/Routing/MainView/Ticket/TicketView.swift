//
//  TicketView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 18/05/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct TicketView: View {

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        VStack {
            Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
                .foregroundColor(.white)
                .padding(.horizontal, 35)
                .multilineTextAlignment(.center)
                .padding(20)
            
            ZStack {
                Image("ticket2")
                    .resizable()
                    .frame(width: 0.55 * UIScreen.main.bounds.width, height: 0.45 * UIScreen.main.bounds.height)
                    .padding(.horizontal, 71)
                    .offset(x: -50, y: -30)
                    .rotationEffect(.degrees(-5))
                Image("ticket3")
                    .resizable()
                    .frame(width: 0.55 * UIScreen.main.bounds.width, height: 0.45 * UIScreen.main.bounds.height)
                    .padding(.horizontal, 71)
                    .offset(x: 50, y: -30)
                    .rotationEffect(.degrees(5))
                    
                Image("ticket1")
                    .resizable()
                    .frame(width: 0.64 * UIScreen.main.bounds.width, height: 0.54 * UIScreen.main.bounds.height)
                    .padding(.horizontal, 71)
                    .overlay(alignment: .bottom) {
                        VStack(spacing: 20) {
                            HStack {
                                HStack {
                                    Text("Date")
                                    Text("April 23")
                                }
                                Spacer()
                                HStack {
                                    Text("Time:")
                                    Text("6 p.m")
                                }
                            }
                            .padding(.horizontal, 5)
                            .padding(.top, 10)
                            
                            HStack {
                                HStack {
                                    Text("Row:")
                                    Text("2")
                                }
                                Spacer()
                                HStack {
                                    Text("Seats:")
                                    Text("9 , 10")
                                }
                            }
                            .padding(.horizontal, 5)
                            
                            Image(uiImage: generateQRCode(from: "tutt"))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                        .frame(width: 0.64 * UIScreen.main.bounds.width)
                        .background(Color(red: 176 / 255, green: 147 / 255, blue: 191 / 255))
                        .cornerRadius(30)
                    }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 42 / 255, green: 17 / 255, blue: 103 / 255),
                Color(red: 23 / 255, green: 12 / 255, blue: 21 / 255)
            ]), startPoint: .top, endPoint: .bottom)
        )
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

struct Ticketview_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
