//
//  ViewControllerUmidade.swift
//  AulaTeste
//
//  Created by Turma02-27 on 21/07/25.
//

import Foundation

class ViewModelUmidade: ObservableObject {
    @Published var umidade: [Umidade] = []

    func fetch() {
        guard let url = URL(string: "http://192.168.128.92:1880/umidadeGET") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode([Umidade].self, from: data)
                DispatchQueue.main.async {
                    self?.umidade = parsed
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
