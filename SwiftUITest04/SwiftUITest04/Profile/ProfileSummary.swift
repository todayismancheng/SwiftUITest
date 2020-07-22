//
//  ProfileSummary.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var profileDateFormatter: DateFormatter  {
        let  dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter
    }
    
    var body: some View {
        List{
            Text(profile.username)
            .bold()
                .font(.largeTitle)
            Text("Notifacations: \(self.profile.prefersNotifications ? "On":"NO")")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(self.profile.goalDate ,formatter: profileDateFormatter)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileSummary(profile: Profile.default)
    }
}
