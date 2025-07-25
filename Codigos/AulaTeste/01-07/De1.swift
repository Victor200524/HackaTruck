//
//  ContentView.swift
//  Aula01
//
//  Created by Turma02-27 on 02/07/25.
//

import SwiftUI

struct De1: View {
    var body: some View {
        HStack{
            VStack{
                Rectangle().fill(.red).frame(width: 100, height: 100)
                Spacer()
                Rectangle().fill(.green).frame(width: 100, height: 100)
                    .padding()
            }
            Spacer()
            VStack{
                Rectangle().fill(.blue).frame(width: 100, height: 100)
                Spacer()
                Rectangle().fill(.yellow).frame(width: 100, height: 100)
                .padding()
            }
        }
    }
}

#Preview {
    De1()
}
