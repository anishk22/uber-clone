//
//  HomeView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/14/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView {
                LocationSearchView()
                
                MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                    .padding(.leading)
                    .padding(.top, 4)
            } else {
                LocationSearchActivationView()
                    .padding(.top, 78)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
