//
//  LocationSearchResultCell.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 5/16/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .accentColor(.white)
                .frame(width: 40, height: 40)
                .padding(.bottom, 4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Starbucks Coffee")
                    .font(.headline)
                
                Text("123 Main Street, Cupertino, California")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 4)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell()
    }
}
