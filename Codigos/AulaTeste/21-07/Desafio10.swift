//
//  Desafio10.swift
//  AulaTeste
//
//  Created by Turma02-27 on 21/07/25.
//

import SwiftUI

struct Desafio10: View {
    @StateObject var viewUmi = ViewModelUmidade()
    @State var corAzul = false
    @State var corLaranja = false
    @State var corVermelha = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical){
                VStack{
                    AsyncImage(url: URL(string: "https://cdn.awsli.com.br/600x700/468/468162/produto/19414371/1ceaf2d245.jpg")){
                        phase in switch phase{
                        case .empty:
                            ProgressView() //Placeholder enquanto carrega a imagem
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit).padding()
                        case .failure(_):
                            Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                        @unknown default:
                            EmptyView()
                        }
                    }.frame(width: 300, height: 300).shadow(color: .red, radius: 10, x: 0, y: 0)
                    
                    Text("Sensor de Umidade").font(.largeTitle).foregroundStyle(.white).bold().padding()
                    ForEach(viewUmi.umidade, id: \.id) { e in
                        HStack {
                            Text(e.umidade ?? "")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }
                    }
                }
            }
        }.onAppear(){
            viewUmi.fetch()
        }
    }
}

#Preview {
    Desafio10()
}
