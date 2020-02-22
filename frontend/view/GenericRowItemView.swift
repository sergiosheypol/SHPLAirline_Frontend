//
//  SuggestionRowView.swift
//  frontend
//
//  Created by Lopez de la Flor, Sergio on 21/02/2020.
//  Copyright © 2020 SHPL. All rights reserved.
//

import SwiftUI

struct GenericRowItemView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(subtitle)
            }
            
        }
    }
}

struct GenericRowView_Previews: PreviewProvider {
    static var previews: some View {
        GenericRowItemView(title:"Madrid", subtitle:"MAD")
    }
}
