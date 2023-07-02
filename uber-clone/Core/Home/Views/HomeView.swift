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
                    Header()
                        .frame(width: UIScreen.main.bounds.width, height: 70)
                        .background(Color.theme.backgroundColor)
                    LocationSearchActivationView()
                        .padding(.top, 132)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                case .searchingForLocation:
                    LocationSearchView(mapState: $mapState)
                    HStack {
                        MapViewActionButton(mapState: $mapState)
                            .padding(.leading)
                            .padding(.top, 4)
                        
                        Spacer()
                        
                        Header()
                            .padding(.trailing, 72)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                case .locationSelected, .mapConfigured:
                    MapViewActionButton(mapState: $mapState)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(.top, 4)
                }
            }
            
            if mapState == .locationSelected || mapState == .mapConfigured {
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
