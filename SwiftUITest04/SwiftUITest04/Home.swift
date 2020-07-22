//
//  Home.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    var categories: [String:[Landmark]]{
        Dictionary(grouping: landmarkData, by: {$0.category.rawValue})
    }
    var profileButton: some View{
        Button(action: {
            self.showingProfile.toggle()}){
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    var body: some View {
        NavigationView{
            List{
                Image("turtlerock")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(),id:\.self){
                    category in
                    HomeCell(categoryName: category, items: self.categories[category]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination:LandMarkList()){
                    Text("所有地方")
                        .font(.headline)
                }
                
            }.navigationBarTitle(Text("精选"))
                .navigationBarItems(trailing: profileButton)
                .sheet(isPresented: $showingProfile) {
                    Profilehost()
                        .environmentObject(self.userData)
                    
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}
