//
//  teste.swift
//  AulaTeste
//
//  Created by Turma02-27 on 25/07/25.
//

import SwiftUI

struct teste: View {
    let id: UUID
    let alimentos: [alimentacao]
    
    // Busca o alimento pelo ID
    var alimentoSelecionado: alimentacao? {
        alimentos.first(where: { $0.id == id })
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if let alimento = alimentoSelecionado {
                Text("ID selecionado: \(id.uuidString)").font(.caption).foregroundColor(.gray)
                Text("🍽️ Alimento: \(alimento.alimento ?? "N/A")")
                Text("🕒 Horário: \(alimento.horario ?? "N/A")")
                Text("🔥 Calorias: \(alimento.calorias ?? 0) kcal")
                Text("🥩 Proteína: \(String(format: "%.1f", alimento.proteina ?? 0.0)) g")
                Text("🥑 Gordura: \(String(format: "%.1f", alimento.gordura ?? 0.0)) g")
                Text("🍞 Carboidrato: \(String(format: "%.1f", alimento.carboidrato ?? 0.0)) g")
            } else {
                Text("Alimento não encontrado")
            }
        }
        .padding()
    }
}

#Preview {
    teste(id: UUID(), alimentos: [])
}

