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
        }
                }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
