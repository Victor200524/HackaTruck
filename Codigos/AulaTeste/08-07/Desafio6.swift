//
//  Desafio6.swift
//  AulaTeste
//
//  Created by Turma02-27 on 08/07/25.
//

import SwiftUI
import MapKit

struct location: Hashable{
    let nome, foto, desc: String
    let latitude, longitude: Double
}

struct Desafio6: View {
    
    @State private var showingSheet = false
    
    @State private var mapa = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
    )
    
    @State var Arraylocal = [location(nome: "Cristo Redentor", foto: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg", desc: "O Cristo Redentor é uma estátua icônica de Jesus Cristo localizada no topo do morro do Corcovado, no Rio de Janeiro, Brasil. É um dos principais símbolos do cristianismo e um marco cultural do Brasil, conhecido mundialmente. A estátua, com seus 38 metros de altura, oferece vistas panorâmicas deslumbrantes da cidade e é considerada uma das Sete Maravilhas do Mundo Moderno.", latitude: -22.9520561, longitude: -43.2105388),
                             
                             location(nome: "Torre Eiffel", foto: "https://cdn-imgix.headout.com/media/images/c90f7eb7a5825e6f5e57a5a62d05399c-25058-BestofParis-EiffelTower-Cruise-Louvre-002.jpg?auto=format&q=90&crop=faces&fit=crop", desc: "A Torre Eiffel, um ícone de Paris e da França, é uma estrutura de ferro de 330 metros de altura localizada no Campo de Marte, na capital francesa. Construída para a Exposição Universal de 1889, a torre foi projetada pelo engenheiro Gustave Eiffel e inicialmente enfrentou resistência, mas rapidamente se tornou um símbolo da cidade e um dos monumentos mais visitados do mundo. ", latitude: 48.8584, longitude: 2.2945),
                             
                             location(nome: "Torre de Pisa", foto: "https://romapravoce.com/wp-content/uploads/2021/04/torre-de-pisa-2.jpg", desc: "A Torre de Pisa, famosa por sua inclinação, foi construída entre 1173 e 1372, como um campanário (torre sineira) para a catedral da cidade de Pisa, na Itália. A inclinação começou logo no início da construção, devido ao solo instável da região, composto por argila, areia e cascalho. Apesar das tentativas de correção, a torre continuou a inclinar-se, tornando-se um dos marcos mais emblemáticos e visitados do mundo. ", latitude: 43.723056, longitude: 10.396667)
    ]
    
    @State var localSelecionado = location(nome: "Cristo Redentor", foto: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg", desc: "O Cristo Redentor é uma estátua icônica de Jesus Cristo localizada no topo do morro do Corcovado, no Rio de Janeiro, Brasil. É um dos principais símbolos do cristianismo e um marco cultural do Brasil, conhecido mundialmente. A estátua, com seus 38 metros de altura, oferece vistas panorâmicas deslumbrantes da cidade e é considerada uma das Sete Maravilhas do Mundo Moderno.", latitude: -22.9520561, longitude: -43.2105388)
    
    var body: some View {
        ZStack{
            Map(position: $mapa) {
                ForEach(Arraylocal, id: \.self) { e in
                    Annotation( e.nome,
                        coordinate: CLLocationCoordinate2D(latitude: e.latitude, longitude: e.longitude)) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .font(.title).onTapGesture {
                                    showingSheet = true
                                }.sheet(isPresented: $showingSheet){
                                    infoLocal(local: localSelecionado)
                                }
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            .onChange(of: localSelecionado) { novoLocal in
                    withAnimation{
                        mapa = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: novoLocal.latitude, longitude: novoLocal.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                            )
                        )
                    }
                }
            VStack{
                Picker("Selecione um local", selection: $localSelecionado){
                    ForEach(Arraylocal, id: \.self){ e in
                        Text(e.nome)
                    }
                }.tint(.black).background{
                    RoundedRectangle(cornerRadius: 10).fill(Color.yellow).frame(width: 250, height: 50)
                }
                Spacer().frame(height: 680)
                Text("Maravilhas do Mundo").background{RoundedRectangle(cornerRadius: 10).fill(Color.yellow).frame(width: 250, height: 50)
                }
            }
        }
    }
}


#Preview {
    Desafio6()
}
