//
//  ApiKey.swift
//  AulaTeste
//
//  Created by Turma02-27 on 17/07/25.
//

import Foundation

enum APIKey{
    static var `default`: String{
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist")
        else{
            fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else{
            fatalError("Couldn't find 'API_KEY' in 'GenerativeAI-Info.plist'.")
        }
        if value.starts(with: "_"){
            fatalError("Follow the instruction at https://ai.google.dev/tutorials/setup to get an API key")
        }
        return value
    }
}
