//
//  Desafio2.swift
//  AulaTeste
//
//  Created by Turma02-27 on 03/07/25.
//

import SwiftUI

struct Desafio2: View{
    @State private var dist: Double = 0
    @State private var temp: Double = 0
    @State private var result: Double = 0
    
    @State private var cor: Color = .gray
    @State private var foto: String = "interroga"
    
    var body: some View{
        ZStack{
            cor.ignoresSafeArea(.all)// Manipula a cor de fundo
            
            VStack{
                Text("Digita a distância(km)")
                TextField("", value: $dist, formatter: NumberFormatter()).keyboardType(.numberPad).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 200).cornerRadius(20)
                
                Text("Digite o tempo(h)")
                TextField("", value: $temp, formatter: NumberFormatter()).keyboardType(.numberPad).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 200).cornerRadius(20)
                
                Button("Calcular"){
                    result = dist/temp
                    
                    if result == 0.00{
                        foto = "interroga"
                        cor = .gray
                    }
                    
                    else if result >= 1 && result <= 9.9{
                        //TARTARUGA
                        foto = "tartaruga"
                        cor = .colorTartaruga
                    }
                    
                    else if result >= 10 && result <= 29.9{//ELEFANTE
                        foto = "elefante"
                        cor = .colorElefante
                    }
                    
                    else if result >= 30 && result <= 69.9{//AVESTRUZ
                        foto = "avestruz"
                        cor = .colorAvestruz
                    }
                    
                    else if result >= 70 && result <= 89.9{//LEAO
                        foto = "leao"
                        cor = .colorLeao
                    }
                    
                    else if result >= 90 && result <= 130{//GUEPARDO
                        foto = "guepardo"
                        cor = .colorGuepardo
                    }
                    
                }.padding(5).foregroundColor(.yellow).background{
                    RoundedRectangle(cornerRadius: 10).fill(Color.black).frame(width: 120, height: 30)
                }
                
                
                Spacer().frame(height: 30)
                
                Text(" \(result, specifier: "%.2f" ) km/h").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Image("\(foto)").resizable().frame(width: 300, height: 300).padding().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                ZStack{
                    Rectangle().background{
                            RoundedRectangle(cornerRadius: 10).fill(Color.black).frame(width: 325, height: 155)
                    }.padding(40)
                    VStack{
                        HStack{
                            Text("TARTARUGA  (0 - 9.9km/h)").foregroundColor(.white)
                            Spacer().frame(width: 50)
                            Circle().fill(.colorTartaruga) .frame(width: 20, height: 20)
                        }
                        
                        HStack{
                            Text("ELEFANTE  (10 - 29.9km/h)").foregroundColor(.white)
                            Spacer().frame(width: 50)
                            Circle().fill(.colorElefante) .frame(width: 20, height: 20)
                        }
                        
                        HStack{
                            Text("AVESTRUZ  (30 - 69.9km/h)").foregroundColor(.white)
                            Spacer().frame(width: 43)
                            Circle().fill(.colorAvestruz) .frame(width: 20, height: 20)
                        }
                        
                        HStack{
                            Text("LEÃO  (70 - 89.9km/h)").foregroundColor(.white)
                            Spacer().frame(width: 86)
                            Circle().fill(.colorLeao) .frame(width: 20, height: 20)
                        }
                        
                        HStack{
                            Text("GUEPARDO  (90 - 130km/h)").foregroundColor(.white)
                            Spacer().frame(width: 45)
                            Circle().fill(.colorGuepardo) .frame(width: 20, height: 20)
                            
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Desafio2()
}
