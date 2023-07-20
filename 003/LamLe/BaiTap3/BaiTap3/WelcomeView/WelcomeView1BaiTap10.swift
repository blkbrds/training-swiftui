//
//  WelcomeView1BaiTap10App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/14/23.
//

import SwiftUI

struct WelcomeView1BaiTap10App: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 437, height: 437)
                .foregroundColor(Color(red: 254/255, green: 249/255, blue: 237/255))
                .position(x: 80, y: 100)
            VStack(alignment: .center) {
                TopViewWelcome()
                Image("manWithCream")
                    .resizable()
                    .frame(width: 299, height: 299)
                Text("Welcome")
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                Text("It’s a pleasure to meet you. We are excited that you’re here so let’s get started!")
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .offset(x: 10)
                    .frame(width: 327, height: 72)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                Button(action: {
                    appRouter.state = .welcome
                }) {
                    Text("Let's Go")
                        .foregroundColor(.black)
                        .italic()
                        .font(.system(size: 20, weight: .bold, design: .serif))
                }
                .buttonLoginModifier()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading))
        
    }
}

struct WelcomeView1BaiTap10App_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView1BaiTap10App()
    }
}

struct CustomButtonLoginModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 50)
            .background(LinearGradient(colors: [Color("LoginButtonColor"), Color(red: 254/255, green: 249/255, blue: 237/255)], startPoint: .topTrailing, endPoint: .bottomLeading))
            .cornerRadius(20)
            .shadow(color: Color("LoginButtonColor"), radius: 4)
    }
}

extension View {
    func buttonLoginModifier() -> some View {
        self.modifier(CustomButtonLoginModifier())
    }
}


struct TopViewWelcome: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("main_logo")
                .resizable()
                .frame(width: 65, height: 65)
            Text("ThanhLam \nFoodService")
                .font(.system(size: 37, weight: .bold, design: .monospaced))
                .multilineTextAlignment(.center)
        }
    }
}