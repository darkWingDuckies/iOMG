//
//  TransactionView.swift
//  iOMG
//
//  Created by Tacenda on 5/25/20.
//  Copyright © 2020 Tacenda. All rights reserved.
//

import SwiftUI

struct TransactionView: View {
    let blockNumber: Int64
    var body: some View {
        VStack {
            Text("Hello from transaction view")
        }.navigationBarTitle("\(blockNumber)")
    }
}