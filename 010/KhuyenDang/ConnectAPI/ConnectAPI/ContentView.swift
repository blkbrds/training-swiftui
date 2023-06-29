//
//  ContentView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ViewModel()
    
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text(viewModel.title)
        .font(.title)
    }
    .padding()
  }
}

extension ContentView {
  final class ViewModel: ObservableObject {
    @Published var style: Style = .hello
        
    var title: String {
      switch style {
      case .hello: return "Hello World!"
      case .welcome: return "Welcome World!"
      }
    }
  }
    
  enum Style {
    case hello, welcome
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
