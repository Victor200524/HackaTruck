//
//  infoLocal.swift
//  AulaTeste
//
//  Created by Turma02-27 on 08/07/25.
//

import SwiftUI

struct infoLocal: View {
    @State var local: location
    
    var body: some View {
        ZStack{
            Color.yellow
            
            VStack{
                AsyncImage(url: URL (string: local.foto)){
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
                
                Text(local.nome).font(.largeTitle).padding().frame(height: 50)
                Text(local.desc).padding(20).background(.brown).cornerRadius(10).padding(20)
                
            }
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    infoLocal(local: location(nome: "", foto: "", desc: "", latitude: 0, longitude: 0))
}
