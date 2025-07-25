//
//  Personagem.swift
//  AulaTeste
//
//  Created by Turma02-27 on 14/07/25.
//

import SwiftUI

struct Personagem: View {
    let selectPerson: HaPo
    
    var body: some View {
        ZStack{
            Color.red.brightness(-0.6)
            VStack{
                AsyncImage(url: URL (string: selectPerson.image!)){
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
                    .frame(width: 300, height: 300)
                    .cornerRadius(200).padding()
                Text(selectPerson.name!).foregroundStyle(Color.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding()
                VStack{
                    Text("Espécie: \(selectPerson.species ?? "Desconhecida")")
                    Text("Gênero: \(selectPerson.gender ?? "Desconhecido")")
                    Text("Casa: \(selectPerson.house ?? "Desconhecida")")
                    Text("Nascimento: \(selectPerson.dateOfBirth ?? "Desconhecido")")
                    Text("Ano de nascimento: \(String(selectPerson.yearOfBirth ?? 0))")
                    Text("Bruxo: \(selectPerson.wizard == true ? "Sim" : "Não")")
                    Text("Ancestralidade: \(selectPerson.ancestry ?? "Desconhecida")")
                    Text("Cor dos olhos: \(selectPerson.eyeColour ?? "Desconhecida")")
                    Text("Cor do cabelo: \(selectPerson.hairColour ?? "Desconhecida")")
                    Text("Patrono: \(selectPerson.patronus ?? "Desconhecido")")
                    Text("Ator: \(selectPerson.actor ?? "Desconhecido")")
                    Text("Está vivo: \(selectPerson.alive == true ? "Sim" : "Não")")
                }.foregroundColor(.white)
            }
            
            
            
        }.ignoresSafeArea(edges: .all)
    }
}

#Preview {
    Personagem(selectPerson: HaPo(
        id: "1",
        name: "Preview",
        alternate_names: [],
        species: nil,
        gender: nil,
        house: nil,
        dateOfBirth: nil,
        yearOfBirth: nil,
        wizard: nil,
        ancestry: nil,
        eyeColour: nil,
        hairColour: nil,
        wand: Wand(wood: nil, core: nil, length: nil),
        patronus: nil,
        hogwartsStudent: nil,
        hogwartsStaff: nil,
        actor: nil,
        alternate_actors: nil,
        alive: nil,
        image: nil
    ))
}
