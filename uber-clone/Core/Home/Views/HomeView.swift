//
//  HomeView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/14/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 78)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                } else if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                    MapViewActionButton(mapState: $mapState)
                        .padding(.leading)
                        .padding(.top, 4)
                }
                else {
                    MapViewActionButton(mapState: $mapState)
                        .padding(.leading)
                        .padding(.top, 4)
                }
            }
            
            if mapState == .locationSelected {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
