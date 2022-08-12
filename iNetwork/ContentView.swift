//
//  ContentView.swift
//  iNetwork
//
//  Created by Muhammad Zhuhry on 12/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var util: Utilities
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Text("Hi there! 👋🏻")
            Button(action: {
                self.util.monitorNetwork()
                self.showModal.toggle()
            }) {
                Text("Check Network")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
