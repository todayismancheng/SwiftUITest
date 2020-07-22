//
//  HomeCell.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct HomeCell: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top ,5)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top,spacing: 0){
                    ForEach(items){ landmark in
                        NavigationLink(destination: LandMarkDetail(landmark: landmark)){
                            HomeItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height:185)
        }
    }
}
//每个横向滚动的Item
struct HomeItem: View {
    var landmark: Landmark
    var body: some View{
        VStack(alignment: .leading){
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
    .padding(15)
    }
}
struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell(categoryName: "古迹", items: landmarkData)
    }
}
