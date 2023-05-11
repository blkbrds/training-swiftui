//
//  DynamicListDetail.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct DynamicListDetail: View {
    var weather: Weather
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Image(weather.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Text(weather.name)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                
                HStack {
                    FollowButton(isFollow: weather.isFollow)
                        .frame(maxWidth: .infinity)
                    Button {
                        print("")
                    } label: {
                        Text("Nhắn tin")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(weather.nickname)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                    if weather.isBlueTick {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct FollowButton: View {
    var isFollow: Bool
    
    var body: some View {
        if isFollow {
            Button {
                print("")
            } label: {
                Text("Đang Theo dõi")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        } else {
            Button {
                print("")
            } label: {
                Text("Theo dõi")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
