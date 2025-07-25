//
//  azulView.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct azulView: View {
    @State private var cor: Color = .blue
    var body: some View {
        ZStack{
            cor
            Image(systemName: "paintbrush.pointed").font(.system(size: 200))
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    azulView()
}
