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
        VStack {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
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
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            if sandwich.isSpicy {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(.all)
                .font(Font.headline.smallCaps())
                .background(Color.red)
                .foregroundColor(.yellow)
                   
            }
            }
           
        .navigationTitle(sandwich.name)
        // Fill the whole screen
        .edgesIgnoringSafeArea(.bottom)
    }
}





struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                SandwichDetail(sandwich: testData[0])
            }
            NavigationView{
                SandwichDetail(sandwich: testData[1])
            }
        }
       
    }
}
