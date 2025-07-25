//
//  TelaMusic.swift
//  AulaTeste
//
//  Created by Turma02-27 on 07/07/25.
//

import SwiftUI

struct TelaMusic: View {
    
    @State var estrut: Song
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                AsyncImage(url: URL(string: estrut.capa)){
                    phase in switch phase{
                    case .empty:
                        ProgressView() //Placeholder enquanto carrega a imagem
                        
                    case .success(let image): //Placeholder faz aparecer a imagem
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    case .failure(_): // Placeholder em caso de erro
                        Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                    @unknown default:
                        EmptyView()
                    }
                }.frame(width: 240,height: 240) // Ajuste o tamanho conforme necessário
                Text(estrut.name).font(.largeTitle).foregroundStyle(Color.white).bold()
                Text(estrut.artist).font(.callout).foregroundStyle(Color.white)
                
                Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Image(systemName: "shuffle").foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Image(systemName: "backward.end.fill").foregroundColor(.white).font(.largeTitle).padding()
                    
                    Spacer()
                    
                    Image(systemName: "play.fill").foregroundColor(.white).font(.system(size: 60)).bold()
                    
                    Spacer()
                    
                    Image(systemName: "forward.end.fill").foregroundColor(.white).font(.largeTitle).padding()
                    
                    Image(systemName: "repeat").foregroundColor(.white).font(.largeTitle)
                }
            }
        }
    }
}


#Preview {
    TelaMusic(estrut: Song(id: 0, name: "", artist: "", capa: ""))
}
