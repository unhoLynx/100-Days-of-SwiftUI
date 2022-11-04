//
//  ContentView.swift
//  WeConvert
//
//  Created by Dmitriy Rysev on 02.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue = 0.0
    @State private var convertType = 0
    @State private var convertFrom: Dimension = UnitLength.meters
    @State private var convertTo: Dimension = UnitLength.miles
    @FocusState private var inputIsFocused: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    
    let unitTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    var convertedValue: String {
        let inputMeasurement = Measurement(value: initialValue, unit: convertFrom)
        let outputMeasurement = inputMeasurement.converted(to: convertTo)
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Initial value", value: $initialValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Initial value")
                }
                
                Picker("Conversion", selection: $convertType) {
                    ForEach(0..<conversions.count) {
                        Text(conversions[$0])
                    }
                }
                
                Picker("Convert from", selection: $convertFrom) {
                    ForEach(unitTypes[convertType], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Picker("Convert to", selection: $convertTo) {
                    ForEach(unitTypes[convertType], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section {
                    Text(convertedValue)
                } header: {
                    Text("Converted value")
                }
            
                .navigationTitle("WeConvert")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            inputIsFocused = false
                        }
                    }
                }
                .onChange(of: convertType) {
                    let units = unitTypes[$0]
                    convertFrom = units[0]
                    convertTo = units[1]
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
