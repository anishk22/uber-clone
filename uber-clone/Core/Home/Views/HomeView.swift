//
//  HomeView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/14/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            HStack {
//                Spacer()
//
//                MapViewActionButton()
                
                Spacer()
                
                LocationSearchActivationView()
                
                Spacer()
            }
            .padding(.top, 36)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
