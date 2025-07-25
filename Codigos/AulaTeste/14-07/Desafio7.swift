//
//  Desafio7.swift
//  AulaTeste
//
//  Created by Turma02-27 on 14/07/25.
//

import SwiftUI

struct Desafio7: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.red.ignoresSafeArea(.all).brightness(-0.6)
                ScrollView(.vertical){
                    VStack{
                        ZStack{
                            AsyncImage(url: URL (string: "https://apliquefacil.vteximg.com.br/arquivos/ids/222668-1000-1000/Estampa-de-papel-de-parede-harry-potter-grifinoria.png?v=638513960486670000")){
                                phase in switch phase{
                                case .empty:
                                    ProgressView() //Placeholder enquanto carrega a imagem
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure(_):
                                    Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                                @unknown default:
                                    EmptyView()
                                }
                            }.ignoresSafeArea(.all).opacity(0.5)
                            
                            AsyncImage(url: URL (string: "https://www.pngarts.com/files/11/Harry-Potter-Gryffindor-Logo-PNG-Photo.png")){
                                phase in switch phase{
                                case .empty:
                                    ProgressView() //Placeholder enquanto carrega a imagem
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure(_):
                                    Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                                @unknown default:
                                    EmptyView()
                                }
                            }.frame(width: 300, height: 300)
                        }
                        Spacer().frame(height: 20)
                        ForEach(viewModel.personagens){ e in
                            HStack{
                                NavigationLink(destination: Personagem(selectPerson: e)){
                                    AsyncImage(url: URL (string: e.image!)){
                                        phase in switch phase{
                                        case .empty:
                                            ProgressView() //Placeholder enquanto carrega a imagem
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                        case .failure(_):
                                            Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }.scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(50).padding()
                                    VStack(alignment: .leading){
                                        Text(e.name!).foregroundStyle(Color.white).font(.title3).bold()
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }.ignoresSafeArea(.all)
        }.onAppear(){
            viewModel.fetch()
        }
    }
}

#Preview {
    Desafio7()
}
