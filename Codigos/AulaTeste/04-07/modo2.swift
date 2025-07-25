//
//  modo2.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct modo2: View {
    @State private var nome: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.fundoDe4
                VStack{
                    Text("Modo 2").foregroundStyle(.white).font(.largeTitle)
                    Spacer().frame(height: 200)
                    ZStack{
                        VStack{
                            TextField("Digite seu nome", text: $nome).multilineTextAlignment(.center)
                            Text("Nome: ").foregroundStyle(.white).font(.largeTitle)
                            Text("Bem vindo, \(nome)").foregroundStyle(.white).font(.largeTitle)
                            
                            NavigationLink(destination: modo2view(nome: nome)){
                                Text("Acessar tela").frame(width: 200, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                            
                        }
                    }.background{
                        RoundedRectangle(cornerRadius: 10).fill(Color.pink).frame(width: 325, height: 210)
                    }
                    Spacer().frame(height: 280)
                }
            }.ignoresSafeArea(edges: .all)
        }
    }
}

#Preview {
    modo2()
}
