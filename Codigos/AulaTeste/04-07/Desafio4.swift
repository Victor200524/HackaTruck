//
//  Desafio4.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct Desafio4: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.fundoDe4
                VStack{
                    Image("logo").resizable().frame(width: 300, height: 150).shadow(radius: 5)
                    
                    VStack{
                        NavigationLink(destination: modo1()){
                            Text("Modo 1")        .frame(width: 200, height: 50)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: modo2()){
                            Text("Modo 2").frame(width: 200, height: 50)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Button("Modo 3"){
                            showingSheet.toggle()
                        }.frame(width: 200, height: 50)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10).sheet(isPresented: $showingSheet){
                                SheetView()
                            }
                    }.padding(200)
                    
                }
            }.ignoresSafeArea(edges: .all)
        }
    }
}

struct SheetView: View {
    var body: some View {
        ZStack{
            Color.fundoDe4
            VStack{
                Text("Sheet View")
                    .font(.title)
                    .padding().foregroundColor(.white)
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
        Desafio4()
    }
