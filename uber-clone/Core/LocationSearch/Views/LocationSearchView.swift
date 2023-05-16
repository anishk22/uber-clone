//
//  LocationSearchView.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/16/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    
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
                    
                    TextField("Where to?", text: $destinationLocationText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 36)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // List view
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0 ..< 20, id: \.self) { _ in
                         LocationSearchResultCell()
                    }
                }
            }
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
