//
//  D2.swift
//  Aula01
//
//  Created by Turma02-27 on 02/07/25.
//

import SwiftUI

struct De2: View {
    var body: some View {
        HStack{
            Image("fotoHacka").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).clipShape(RoundedRectangle(cornerRadius: 50))
                .padding(30)
        VStack{
            Text("HackaTruck").foregroundColor(.red)
            Text("77 Universidades").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("5 regiões do Brasil").foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    De2()
}

