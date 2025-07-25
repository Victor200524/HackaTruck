//
//  Desafio8.swift
//  AulaTeste
//
//  Created by Turma02-27 on 16/07/25.
//

import SwiftUI

struct Desafio8: View {
    @StateObject var viewMEst = ViewModelEstaciomento()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                VStack{
                    AsyncImage(url: URL(string: "https://www.imparcial.com.br//assets/images/galeria/1690287062.jpg")){
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
                    }.shadow(color: .white, radius: 10, x: 0, y: 0)
                    Text("Estacionamento").foregroundStyle(Color.white).font(.largeTitle).bold()
                    ForEach(viewMEst.estacionamento, id: \.self){ e in
                        Text(e.nomeEstacionamento!).foregroundStyle(Color.red).bold().font(.title2)
                        ForEach(e.carros, id: \.self){ car in
                            HStack{
                                AsyncImage(url: URL(string: car.foto!)){
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
                                }.frame(width: 150,height: 150).shadow(color: .red, radius: 10, x: 0, y: 0)
                                VStack(alignment: .leading){
                                    Text(car.modelo!).foregroundStyle(Color.white).font(.title3).bold()
                                    Text((String)(car.ano!)).foregroundStyle(Color.white).font(.title3).bold()
                                    Text(car.cor!).foregroundStyle(Color.white).font(.title3).bold()
                                    Text(String(format: "%.2f", car.preco!)).foregroundStyle(Color.white).font(.title3).bold()
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
        }.onAppear(){
            viewMEst.fetch()
        }
    }
}

#Preview {
    Desafio8()
}
