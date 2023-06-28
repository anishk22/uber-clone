//
//  LocationSearchView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/16/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            // Header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24 )
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 36)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 36)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 78)
            
            Divider()
                .padding(.vertical)
            
            // List view
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) {
                        result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                mapState = .locationSelected
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
