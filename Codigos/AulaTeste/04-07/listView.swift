//
//  listView.swift
//  AulaTeste
//
//  Created by Turma02-27 on 04/07/25.
//

import SwiftUI

struct listView: View {
    var body: some View {
        VStack{
            Text("List").font(.largeTitle).frame(maxWidth: 300, alignment: .leading)
            ZStack{
                VStack{
                    HStack{
                        Text("Itens")
                        Spacer().frame(width: 200)
                        Image(systemName: "paintbrush")
                    }
                    HStack{
                        Text("Itens")
                        Spacer().frame(width: 200)
                        Image(systemName: "paintbrush.pointed")
                    }
                    HStack{
                        Text("Itens")
                        Spacer().frame(width: 200)
                        Image(systemName: "paintpalette")
                    }
                }
            }
        }
    }
}

#Preview {
    listView()
}
