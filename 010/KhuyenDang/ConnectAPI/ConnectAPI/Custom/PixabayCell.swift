//
//  PixabayCell.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import SwiftUI

struct PixabayCell: View {

    var item: PixabayItem
    @StateObject var viewModel = PixabayCellViewModel()
    var widthImage: CGFloat = 140

    fileprivate func inforView(icon: String, value: Int) -> HStack<TupleView<(Image, Text)>> {
        return HStack {
            Image(systemName: icon)
            Text("\(value)")
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
    }

    var body: some View {
        HStack {
            HStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if let image = viewModel.image {
                        image.resizable()
                            .frame(width: widthImage)
                            .scaleEffect(1)
                            .scaledToFit()
                            .cornerRadius(5)
                    } else {
                        VStack(spacing: 5) {
                            Image(systemName: "exclamationmark.circle")
                                .scaledToFit()
                            Text("Lỗi")
                                .font(.system(size: 15))
                        }
                            .foregroundColor(.red)
                    }
                }
            }
                .frame(width: widthImage, height: widthImage)

            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text("Tags: " + item.tags)
                    inforView(icon: "eye", value: item.views)
                    inforView(icon: "arrow.down.square", value: item.downloads)
                        .padding(.leading, 3)
                    inforView(icon: "hand.thumbsup", value: item.likes)
                        .padding(.leading, 2)
                    inforView(icon: "bubble.left", value: item.comments)
                }
                    .padding(.leading, 10)
                Spacer()
            }

        }
            .padding(16)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
            .frame(width: UIScreen.main.bounds.width - 20)
            .onAppear {
            viewModel.loadImage(url: item.image)
        }
    }
}

struct PixabayCell_Previews: PreviewProvider {
    static var previews: some View {
        DowloaderView()
    }
}
