//
//  ModelUmidade.swift
//  AulaTeste
//
//  Created by Turma02-27 on 21/07/25.
//

import Foundation

struct Umidade: Decodable, Hashable{
    let id = UUID()
    let umidade: String?
}
