//
//  rosaView.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct rosaView: View {
    var body: some View {
        ZStack{
            Color.pink
            Image(systemName: "paintbrush").font(.system(size: 200))
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    rosaView()
}
