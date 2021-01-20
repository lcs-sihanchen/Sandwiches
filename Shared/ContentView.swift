//
//  ContentView.swift
//  Shared
//
//  Created by Chen, Sihan on 2021-01-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .padding()
                Text("3 ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
