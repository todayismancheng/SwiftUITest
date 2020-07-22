//
//  LandMarkList.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct LandMarkList: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        List{
            
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("只显示收藏")
            }
            
            ForEach(userData.landmarks){landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandMarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                    .padding(-10)
                }
            }
        }
        .navigationBarTitle("LandMark")
        
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList().environmentObject(UserData())
    }
}
