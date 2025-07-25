//
//  Gemini.swift
//  AulaTeste
//
//  Created by Turma02-27 on 17/07/25.
//

import SwiftUI
import GoogleGenerativeAI

struct Gemini: View {
    
    let model = GenerativeModel(name: "gemini-2.0-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "O que deseja?"
    @State var resposta = false
    
    var body: some View {
        
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            VStack{
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Google_Gemini_logo.svg/2560px-Google_Gemini_logo.svg.png")){
                    phase in switch phase{
                    case .empty:
                        ProgressView() //Placeholder enquanto carrega a imagem
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit).padding()
                    case .failure(_):
                        Image(systemName: "fotoHacka").resizable().aspectRatio(contentMode: .fit)
                    @unknown default:
                        EmptyView()
                    }
                }.shadow(color: .gray, radius: 10, x: 0, y: 0)
                
                ScrollView(.vertical){
                    if !resposta{
                        Text(aiResponse).padding().foregroundColor(.white).font(.largeTitle)
                    }
                    else{
                        Text(aiResponse).padding().foregroundColor(.white).font(.title3)
                    }
                }
                
                HStack{
                    TextField("Digite aqui", text: $textInput)
                        .textFieldStyle(.roundedBorder).foregroundColor(.black)
                    
                    Button(action: {
                        sendMessage()
                        resposta = true
                    }, label: {
                        Image(systemName: "paperplane.fill").resizable().frame(width: 30, height: 30).foregroundColor(.white)
                    })
                }.padding()
            }
        }
    }
    
    func sendMessage(){
        aiResponse = ""
        Task{
            do{
                let response = try await model.generateContent(textInput)
                guard let text = response.text
                else{
                    textInput = "Sorry, I could not process that.\nPlease try again!"
                    return
                }
                textInput = ""
                aiResponse = text
            }catch{
                aiResponse = "Something went wrong!\n\(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    Gemini()
}
