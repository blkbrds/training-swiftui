//
//  AccountView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 24/05/2023.
//

import SwiftUI

enum Contact: CaseIterable {
    case email
    case info
    case rules
    case policy
    case FAQ
    
    func content() -> Text {
        switch self {
        case .email:
            return Text("Email: **lecongtu9337@gmail.com**")
        case .info:
            return Text("Thông tin công ty")
        case .rules:
            return Text("Điều khoản sử dụng")
        case .policy:
            return Text("Chính sách bảo mật")
        case .FAQ:
            return Text("FAQ")
        }
    }
}

struct AccountView: View {
    
    let dataContactList = Contact.allCases
    @StateObject var viewModel = AccountViewModel()
    
    @EnvironmentObject var appRouter: StorageData

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TopView(data: viewModel.user)
                    SpendingActivitiesView()
                    VStack {
                        ForEach(dataContactList, id: \.self) { item in
                            VStack {
                                if dataContactList.last == item {
                                    ContactRow(itemString: item.content(), isLast: true)
                                } else {
                                    ContactRow(itemString: item.content())
                                }
                            }
                        }
                        
                        Button {
                            appRouter.appState = .login
                            appRouter.dataLogin = nil
                        } label: {
                            Text("Đăng xuất")
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(.orange)
                                .padding(.bottom, 40)
                        }

                    }
                    .background(.white)
                    
                }
                .task {
                    await viewModel.loadData(data: appRouter.dataLogin)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Tài Khoản")
                .background(.gray)
                .foregroundColor(.black)
                .background(.red)
                .preferredColorScheme(.light)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct TopView: View {

    var data: UserContainer

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding()
                    .background(.gray)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(data.user?.userName ?? "")
                            .font(.system(size: 20, weight: .semibold))
                        Text(data.user?.email ?? "")
                            .font(.system(size: 12))
                    }
                    
                    Text("4 Starts")
                        .font(.system(size: 15))
                }
                .padding(.leading, 5)
                
                Spacer()
                
                VStack {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.orange)
                    
                    Text("Mã thành viên")
                        .foregroundColor(.orange)
                }
            }
            .padding(.horizontal, 10)
            
            HStack {
                HStack {
                    HStack {
                        Image(systemName: "square.and.pencil")
                        Text("Thông Tin")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    Divider()
                    HStack {
                        Image(systemName: "square.and.pencil")
                        Text("Giao dịch")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    Divider()
                    HStack {
                        Image(systemName: "square.and.pencil")
                        Text("Thông Báo")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding(.top, 15)
            }
            .frame(height: 70)
        }
        .background(.white)
    }
}

struct SpendingActivitiesView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Tổng Chi tiêu 2023")
                    Image(systemName: "info.circle")
                    Spacer()
                    Text("120,000đ")
                        .foregroundColor(.orange)
                }
                .padding(.horizontal, 10)
                
                HStack {
                    Image(systemName: "rosette")
                        .scaleEffect(1.5)
                        .foregroundColor(.orange)
                        .offset(x: 10)
                    Spacer()
                    Image(systemName: "medal.fill")
                        .scaleEffect(1.5)
                        .foregroundColor(.orange)
                        .offset(x: -25)
                    Spacer()
                    Image(systemName: "trophy.circle.fill")
                        .scaleEffect(1.5)
                        .foregroundColor(.orange)
                        .offset(x: -40)
                }
                .padding(.vertical, 10)
                
                
                RoundedRectangle(cornerRadius: 6)
                    .frame(height: 12)
                    .padding(10)
                    .foregroundColor(.brown)
                    .overlay {
                        HStack {
                            VStack {
                                Circle()
                                    .strokeBorder(.blue, lineWidth: 4)
                                    .background(Circle().fill(.white))
                                    .frame(width: 20, height: 20)
                                    .offset(x: 10)
                            }
                            Spacer()
                            Circle()
                                .strokeBorder(.blue, lineWidth: 4)
                                .background(Circle().fill(.white))
                                .frame(width: 20, height: 20)
                                .offset(x: -25)
                            Spacer()
                            Circle()
                                .strokeBorder(.blue, lineWidth: 4)
                                .background(Circle().fill(.white))
                                .frame(width: 20, height: 20)
                                .offset(x: -40)
                        }
                    }
                HStack {
                    Text("0đ")
                        .font(.system(size: 15))
                    Spacer()
                    Text("2.000.000đ")
                        .font(.system(size: 15))
                    Spacer()
                    Text("4.000.000đ")
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 10)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
        }
        .background(.white)
    }
}

struct ContactRow: View {

    var itemString: Text
    var isLast: Bool?

    var body: some View {
        VStack {
            itemString
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .fontWeight(.semibold)
            if isLast != true {
                Divider()
            }
        }
    }
}
