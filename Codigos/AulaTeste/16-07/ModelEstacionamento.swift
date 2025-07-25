//
//  Model.swift
//  AulaTeste
//
//  Created by Turma02-27 on 16/07/25.
//

import Foundation

struct Estacionamento: Decodable, Hashable{
    let nomeEstacionamento: String?
    let qtdeVagas: Int?
    let carros: [carros]
}

struct carros: Codable, Hashable{
    let modelo: String?
    let ano: Int?
    let cor: String?
    let preco: Double?
    let foto: String?
}
