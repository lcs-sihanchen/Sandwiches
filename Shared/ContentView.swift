//
//  ContentView.swift
//  Shared
//
//  Created by Chen, Sihan on 2021-01-20.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var store: SandwichStore
 
    var body: some View {
        NavigationView {
            
            List {
                ForEach(store.sandwiches) { sandwich in
                    
                    SandwichCell(sandwich: sandwich)
                }
                // Move the sandwich here
                .onMove(perform: moveSandwich)
                .onDelete(perform: deleteSandwiches)
                
                HStack{
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                
                
                
            }
            .navigationTitle("Sandwiches")
            // For Ipad use only
            Text("Select a sandwich")
                .font(.largeTitle)
        }
        
        
        
    }
    
    
    
    
    func moveSandwich(){
        withAnimation {
            store.sandwiches.append(Sandwich( name: "Patty melt", ingredientCount: 3, isSpicy: false))
        }
    }
    
    func makeSandwich(from: IndexSet, to: Int){
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(
            destination: SandwichDetail(sandwich: sandwich)
        ){
            Image(sandwich.thumbnailName)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                    .padding()
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
