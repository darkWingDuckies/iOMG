//
//  ContentView.swift
//  iOMG
//
//  Created by Tacenda on 5/20/20.
//  Copyright © 2020 Tacenda. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        VStack {
            PriceView()
            
            Spacer()
            
            StatsView()
            
            Spacer()
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
