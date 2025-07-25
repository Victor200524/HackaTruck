//
//  Desafio3.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct Desafio3: View {
    @State var selectTela = 1
    
    var body: some View {
        TabView(selection: $selectTela){
            rosaView().tabItem{
                Label("Rosa", systemImage: "paintbrush.fill")
            }.tag(1)
            azulView().tabItem {
                Label("Azul", systemImage: "paintbrush.pointed.fill")
            }.tag(2)
            cinzaView().tabItem {
                Label("Cinza", systemImage: "paintpalette.fill")
            }.tag(3)
            listView().tabItem {
                Label("Lista", systemImage: "list.bullet.rectangle")
            }.tag(4)
        }
        
    }
}

#Preview {
    Desafio3()
}
