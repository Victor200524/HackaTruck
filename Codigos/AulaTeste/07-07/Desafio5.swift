//
//  Desafio5.swift
//  AulaTeste
//
//  Created by Turma02-27 on 07/07/25.
//

import SwiftUI

struct Song: Identifiable{
    var id: Int
    var name, artist, capa: String
}

struct Desafio5: View {
    
    @State var arrayMusics = [
        Song(id: 1, name: "Romanos 12", artist: "Fraternidade São João Paulo ll", capa: "https://cdn-images.dzcdn.net/images/cover/d64ab6b815897bb236d5b65f11e62f88/0x1900-000000-80-0-0.jpg"),
        Song(id: 2, name: "Terra Seca", artist: "Fraternidade São João Paulo ll", capa: "https://cdn-images.dzcdn.net/images/cover/0cf35dbceb58bab3a962552bda73e141/0x1900-000000-80-0-0.jpg"),
        Song(id: 3, name: "Sopra em nós", artist: "Irmã Ana Paula", capa: "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8453669f9004d35b78edcc5f5c"),
        Song(id: 4, name: "Recomeçar", artist: "Colo de Deus", capa: "https://i1.sndcdn.com/artworks-000092067785-ubv3yy-t500x500.jpg"),
        Song(id: 5, name: "Desperta", artist: "Colo de Deus", capa: "https://i.scdn.co/image/ab67616d0000b27341f888501a55dbfe0b0c9587"),
        Song(id: 6, name: "Eis me aqui", artist: "Colo de Deus", capa: "https://i.scdn.co/image/ab67616d0000b273f24e4a16510f3e6e0f702ad6"),
        Song(id: 7, name: "Pescador de Homens", artist: "Frei Gilson", capa: "https://i.ytimg.com/vi/4SfalBw-2X0/maxresdefault.jpg")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("fotoHacka").resizable().frame(width: 300,height: 240)
                    Text("HackaFM").foregroundStyle(Color.white).font(.largeTitle).bold().frame(maxWidth: 360, alignment: .leading)
                    
                    HStack{
                        Image("fotoHacka").resizable().frame(width: 20,height: 20)
                        Text("HackaSong").foregroundStyle(Color.white)
                    }.frame(maxWidth: 360, alignment: .leading)
                    
                    
                    ScrollView(.vertical){
                        VStack{
                            ForEach(arrayMusics){ e in
                                NavigationLink(destination: TelaMusic(estrut: Song(id: e.id, name: e.name, artist: e.artist, capa: e.capa))){
                                    
                                    VStack{
                                        HStack{
                                            AsyncImage(url: URL (string: e.capa)){
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
                                            }.frame(width: 50, height: 50)
                                            
                                            VStack(alignment: .leading){
                                                Text(e.name).font(.callout).foregroundColor(.white).bold()
                                                Text(e.artist).font(.callout).foregroundColor(.white)
                                            }
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                        }
                                    }
                                }
                            }
                        }
                        Text("Sugeridos").foregroundStyle(Color.white).font(.largeTitle).frame(maxWidth: 350, alignment: .leading)
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(arrayMusics){ e in
                                    NavigationLink(destination: TelaMusic(estrut: Song(id: e.id, name: e.name, artist: e.artist, capa: e.capa))){
                                        VStack{
                                            AsyncImage(url: URL (string: e.capa)){
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
                                            }.frame(width: 200, height: 200)
                                            Text(e.name)
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }.padding()
                }
            }
        }.accentColor(.white)
    }
}

#Preview {
    Desafio5()
}
