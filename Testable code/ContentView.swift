//
//  ContentView.swift
//  Testable code
//
//  Created by Ray Nahimi on 23/12/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 10
    
    var body: some View {
        VStack(spacing: 40) {
            VStack{
                Text("Enter Bill Amount")
                    .foregroundColor(.secondary)
                
                TextField("0.00", text: $enteredAmount)
                    .font(.system(size: 70,weight: .semibold,design: .rounded))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }
            Text("Tip: \(tipSlider, specifier: "%.0")")
            
            Slider(value: $tipSlider, in: 0...100, step: 1)
                .onChange(of: tipSlider){ _ in
                    guard let amount = Double(enteredAmount) else{
                        print("invalid entry")
                         return
                    }
                    
                    guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else{
                        print("Bill amount or tip can not be negative")
                        return
                    }
                    tipAmount = tip
                    totalAmount = amount + tipAmount
                    
                }
            VStack{
                Text(tipAmount, format: .currency(code: "GBP"))
                    .font(.title.bold())
                
                Text("Tip")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)
            
            VStack{
                Text(totalAmount, format: .currency(code: "GBP"))
                    .font(.title.bold())
                
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//The below struct is used to seperate the function from the main contentView. The function takes in a parameter of enteredAmount and Tip both being doubles and at the end the funciton returns a double. The guard statement is there to make sure the values are not negative or = to 0. Thes rest is basic maths.
struct Calculation{
    func calculateTip(of enteredAmount:Double, with tip: Double) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 else {return nil}
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
        
    }
}
