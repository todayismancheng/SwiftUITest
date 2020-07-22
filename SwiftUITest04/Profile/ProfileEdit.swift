//
//  ProfileEdit.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/15.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct ProfileEdit: View {
    
    @Binding var profile: Profile
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    var body: some View {
        List{
            HStack{
                Text("UserName:")
                Divider()
                TextField("UserName", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo",selection: $profile.seasonalPhoto)
                       {
                        ForEach(Profile.Season.allCases,id:\.self){
                            season in
                            Text(season.rawValue).tag(season)
                        }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            VStack(alignment: .leading ,spacing: 20){
                Text("Goal Date").bold()
                DatePicker("Goal Date",
                           selection: $profile.goalDate,
                           in: dateRange,
                           displayedComponents: .date)

            }
        }
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit(profile: .constant(.default))
    }
}
