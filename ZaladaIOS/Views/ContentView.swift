//
//  ContentView.swift
//  ZaladaIOS
//
//  Created by Chorn Thoen on 8/2/24.
//

import SwiftUI
import CoreData

struct ContentView: View {


    var body: some View {
        Text("Hello, world!")
            .padding()
        Button(action: {
            print("Button tapped")
        }) {
            Text("Tap me")
        }
    }
}


#Preview {
    ContentView()
}
