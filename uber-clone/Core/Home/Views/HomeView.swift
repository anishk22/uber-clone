//
//  HomeView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/14/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                switch mapState {
                case .noInput:
                    LocationSearchActivationView()
                        .padding(.top, 78)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                case .searchingForLocation:
                    LocationSearchView(mapState: $mapState)
                    MapViewActionButton(mapState: $mapState)
                        .padding(.leading)
                        .padding(.top, 4)
                case .locationSelected:
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
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
