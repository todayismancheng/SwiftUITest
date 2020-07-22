//
//  Profile.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

struct Profilehost: View {

    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile =  Profile.default
    
    var body: some View {
            
        VStack(alignment: .leading ,spacing: 20){
            HStack{
                if self.mode?.wrappedValue == .active{
                    Button("cancel"){
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == EditMode.inactive{
                ProfileSummary(profile: self.userData.profile)
            }else{
                ProfileEdit(profile: $draftProfile)
                .onAppear {
                    self.draftProfile = self.userData.profile
                }
                .onDisappear {
                    self.userData.profile = self.draftProfile
                }
            }
        }
        .padding()
    }
}

struct Profilehost_Previews: PreviewProvider {
    static var previews: some View {
        Profilehost().environmentObject(UserData())
    }
}
