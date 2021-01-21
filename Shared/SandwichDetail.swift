//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Chen, Sihan on 2021-01-20.
//

import SwiftUI



struct SandwichDetail: View {
    
    let sandwich: Sandwich
    // Only shared in this view
    
    @State private var zoomed = false
    var body: some View {
        Image(sandwich.imageName)
            .resizable()
            // If zoomed = false, .fit, and vice versa
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .onTapGesture {
                // Animate between different state
                withAnimation {
                    zoomed.toggle()
                }
                
            }
            .navigationTitle(sandwich.name)
            // Fill the whole screen
            .edgesIgnoringSafeArea(.bottom)
    }
}





struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SandwichDetail(sandwich: testData[0])
        }
       
    }
}
