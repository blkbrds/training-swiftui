//
//  SettingView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/06/2023.
//

import SwiftUI

struct SettingView: View {

    @State private var isSwitchNotifOn = false
    @State private var isSwitchServiceNotifOn = false
    @State private var isSwitchLocationOn = false
    @EnvironmentObject var appRouter: AppRouter
    @AppStorage("isDarkMode") var isDarkMode = false
    @ObservedObject var viewModel =  EditViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Text("Setting")
                        .font(.largeTitle)
                    HStack {
                        Image("back")
                            .onTapGesture {
                                appRouter.state = .home
                            }
                        Spacer()
                    }
                    .padding(.leading, 20)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Notification")
                            .bold()
                            .padding(20)
                        Spacer()
                    }
                    CustomToggle(isSwitchOn: $isSwitchNotifOn, type: .notif)
                    CustomToggle(isSwitchOn: $isSwitchServiceNotifOn, type: .serviveNotif)

                    HStack {
                        Text("Other")
                            .bold()
                            .padding(20)
                        Spacer()
                    }
                    CustomToggle(isSwitchOn: $isSwitchLocationOn, type: .location)
                    CustomToggle(isSwitchOn: $isDarkMode, type: .darkMode)

                }
                
                Button(action: {
                    appRouter.state = .edit
                }) {
                    Text("Edit Information")
                        .foregroundColor(Color("welcome"))
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 63)
                        .padding(.horizontal)
                        .background(Color("submitButton"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                Spacer()
            }
        }
        .background(Color("background"))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
