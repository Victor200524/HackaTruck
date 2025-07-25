//
//  ViewModel.swift
//  AulaTeste
//
//  Created by Turma02-27 on 16/07/25.
//

import Foundation

class ViewModelEstaciomento: ObservableObject {
    @Published var estacionamento: [Estacionamento] = []

    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/getEstacionamento") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                DispatchQueue.main.async {
                    self?.estacionamento = parsed
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
