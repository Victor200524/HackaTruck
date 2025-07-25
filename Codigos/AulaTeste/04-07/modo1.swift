//
//  modo1.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct modo1: View {
    
    var body: some View {
        ZStack{
            Color.fundoDe4
            VStack{
                Text("Modo 1").foregroundStyle(.white).font(.largeTitle)
                Spacer().frame(height: 300)
                ZStack{
                    VStack{
                        Text("Nome: Victor").foregroundStyle(.white).font(.largeTitle)
                        Text("Sobrenome: Donaire").foregroundStyle(.white).font(.largeTitle)
                    }
                }.background{
                    RoundedRectangle(cornerRadius: 10).fill(Color.pink).frame(width: 325, height: 155)
                }
                Spacer().frame(height: 300)
            }
        }.ignoresSafeArea(edges: .all)
    }
}

#Preview {
    modo1()
}
