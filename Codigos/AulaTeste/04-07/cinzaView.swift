//
//  cinzaView.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct cinzaView: View {
    @State private var cor: Color = .gray
    var body: some View {
        ZStack{
            cor
            Image(systemName: "paintpalette").font(.system(size: 200))
        }.ignoresSafeArea(edges: .top)
        
    }
}

#Preview {
    cinzaView()
}
