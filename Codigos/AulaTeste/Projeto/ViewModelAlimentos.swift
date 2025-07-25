//
//  ViewModelAlimentos.swift
//  AulaTeste
//
//  Created by Turma02-27 on 24/07/25.
//

import Foundation

class ViewModelAlimentos: ObservableObject {
    @Published var food: [alimentacao] = []
    @Published var isLoading = false
    
    func fetch(completion: (() -> Void)? = nil) {
        isLoading = true
        guard let url = URL(string: "http://127.0.0.1:1880/alimentos") else {
            isLoading = false
            completion?()
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    self?.isLoading = false
                    completion?()
                    return
                }

                do {
                    let parsed = try JSONDecoder().decode([alimentacao].self, from: data)
                    self?.food = parsed
                } catch {
                    print(error)
                }

                self?.isLoading = false
                completion?()
            }
        }

        task.resume()
    }

}

