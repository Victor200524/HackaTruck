//
//  Desafio1.swift
//  Aula01
//
//  Created by Turma02-27 on 02/07/25.
//

import SwiftUI

struct Deesafio1: View{
    @State private var showingAlert = false
    @State private var textoDigitado = ""
    
    var body: some View{
        ZStack{
            Image("fundo").resizable().scaledToFill().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).opacity(0.3)

            VStack{
                Text("Bem vindo, \(textoDigitado)").font(.largeTitle)
                
                TextField("Digite seu nome", text: $textoDigitado).multilineTextAlignment(.center)
                
                VStack{
                    Image("logo").resizable().frame(width: 200, height: 100).shadow(radius: 5)
                    Image("onibus").resizable().frame(width: 200,height: 100)
                }
                .padding(210)
                
                Button("Entrar") {
                    showingAlert = true
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text("ALERTA !"),
                          message: Text("Você irá iniciar o desafio da aula agora"),
                          dismissButton: .default(Text("Vamos lá")))
                }
            }
        }
    }
}

#Preview {
    Deesafio1()
}
