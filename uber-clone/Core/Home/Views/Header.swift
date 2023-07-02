//
//  Header.swift
//  uber-clone
//
//  Created by Anish Kothapalli on 7/1/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        Image("uber-logo")
            .resizable()
            .frame(width: 80, height: 30)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
