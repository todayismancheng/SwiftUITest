//
//  UserData.swift
//  SwiftUITest04
//
//  Created by luoyang_ on 2020/3/14.
//  Copyright © 2020 luoyang_. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject  {
    
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
