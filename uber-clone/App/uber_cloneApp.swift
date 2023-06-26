//
//  uber_cloneApp.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/14/23.
//

import SwiftUI

@main
struct uber_cloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
