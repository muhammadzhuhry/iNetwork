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
            .sheet(isPresented: $showModal) {
                ModalView(showModal: self.$showModal, isConn: self.$util.isConn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var isConn: Bool

    var body: some View {
        if isConn {
            return ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "wifi")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("Thanks God, You're Online!")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                }.foregroundColor(Color.white)
            }
        } else {
            return ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "wifi")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("Ummm, Something Wrong You're Offline :(")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                }.foregroundColor(Color.white)
            }
        }
    }
}
