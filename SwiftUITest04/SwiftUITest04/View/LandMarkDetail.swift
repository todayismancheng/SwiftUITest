//
//  LandMarkDetail.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct LandMarkDetail: View {
    var landmark: Landmark
    @EnvironmentObject var userData: UserData
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:350)
            CircleImage(image:landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action:{
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if self.userData.landmarks[self.landmarkIndex].isFavorite{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }else{
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                            }
                    }
                }
                
                HStack {
                    Group{
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            LandMarkDetail(landmark: landmarkData[1]).environmentObject(UserData())
        }
    }
}
