//
//  ContentView.swift
//  Shared
//
//  Created by Jeff_Terry on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var guess = ""
    @State private var totalIterations: Int? = 10
    @State private var cesaroAngle: Int? = 4
    @State var editedCesaroAngle: Int? = 4
    @State var editedTotalIterations: Int? = 10
    @State var viewArray :[AnyView] = []
    
    private var intFormatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            return f
        }()
    
    
    // Setup the GUI to monitor the data from the Cesaro Fractal Calculator
    
//    @ObservedObject var cesaroFractalSmall = KochFractal(withData: true)
//    @ObservedObject var cesaroFractalSmall2 = KochFractal(withData: true)
//    @ObservedObject var cesaroFractalSmall3 = KochFractal(withData: true)
//    @ObservedObject var cesaroFractalSmall4 = KochFractal(withData: true)
//    @ObservedObject var cesaroFractalSmall5 = KochFractal(withData: true)
//    @ObservedObject var kochFractal = KochFractal(withData: true)
    
    @ObservedObject var kochFractal = KochFractal(withData: true)
    
    //Setup the GUI View
    var body: some View {
        HStack{
            
            VStack{
                
//                VStack(alignment: .center) {
//                    HStack{
//
//                        Text(verbatim: "Iterations:")
//                        .padding()
//                        TextField("Number of Iterations (must be between 0 and 7 inclusive)", value: $editedTotalIterations, formatter: intFormatter, onCommit: {
//                            self.totalIterations = self.editedTotalIterations
//                        })
//
//                            .padding()
//
//                        }
//
//                }
//                .padding(.top, 5.0)
//
//                VStack(alignment: .center) {
//                    HStack{
//
//                        Text(verbatim: "Angle π/number:")
//                        .padding()
//                        TextField("The angle of the Fractal is π/number entered. Must be between 1 and 50.", value: $editedCesaroAngle, formatter: intFormatter, onCommit: {
//                            self.cesaroAngle = self.editedCesaroAngle
//                        })
//
//                            .padding()
//
//                        }
//
//                }
                

//                Button("Sync", action: {Task.init{
//
//                    print("Start time \(Date())\n")
//                    await self.calculateSyncCesaro()}})
//                    .padding()
//                    .frame(width: 100.0)
//                    .disabled(kochFractal.enableButton == false)
//
//                Button("Async", action: {Task.init{
//
//                    print("Start time \(Date())\n")
//                    await self.calculateCesaro()}})
//                    .padding()
//                    .frame(width: 100.0)
//                    .disabled(kochFractal.enableButton == false)
                
                Button("Koch", action: {Task.init{
                    
                    print("Start time \(Date())\n")
                    await self.calculateKoch()}})
                    .padding()
                    .frame(width: 100.0)
                    .disabled(kochFractal.enableButton == false)
                
//                Button("Clear", action: {Task.init{
//
//                    await self.clear()}})
//                    .padding(.bottom, 5.0)
//                    .disabled(kochFractal.enableButton == false)
                
                if (!kochFractal.enableButton){
                    
                    ProgressView()
                }
                
                
            }
            .padding()
            
            //DrawingField
            
            HStack{
                CesaroView(cesaroVertices: $kochFractal.KochVerticesForPath)
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                    .drawingGroup()
                // Stop the window shrinking to zero.
                Spacer()
                
//                CesaroView(cesaroVertices: $kochFractal.cesaroVerticesForPath)
//                    .padding()
//                    .aspectRatio(1, contentMode: .fit)
//                    .drawingGroup()
//                // Stop the window shrinking to zero.
//                Spacer()
            }
        }
    }
    
    /// calculateSyncCesaro
    ///
    ///
    /// Uses TaskGroup to calculate 2 Cesaro Fractals in sequence
    /// Both calculations are placed in the same TaskGroup
    /// Should use await to update the GUI upon completion rather than printing time to console.
    ///
    func calculateKoch() async {
        

    kochFractal.setButtonEnable(state: false)
        

            
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
            
                taskGroup.addTask(priority: .high) {
                
                    
                
                    await kochFractal.calculateKoch(iterations: totalIterations, piAngleDivisor: cesaroAngle)
            }
        
    }

        
        
        kochFractal.setButtonEnable(state: true)
        
        print("End Time of \(Date())\n")
        
    }
    
    /// calculateCesaro
    ///
    /// Uses TaskGroup to calculate 6 Cesaro Fractals concurrently
    /// Should use await to update the GUI upon completion rather than printing time to console.
    ///
//    func calculateCesaro() async {
//
//
//    kochFractal.setButtonEnable(state: false)
//
//
//            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
//
//
//                taskGroup.addTask(priority: .high){
//
//
//                    await kochFractal.calculateCesaro(iterations: totalIterations, piAngleDivisor: cesaroAngle)
//
//
//            }
//
//                taskGroup.addTask(priority: .high) {
//
//
//                    let iterations: Int? = 9
//                    let angle: Int? = 4
//
//
//                    await cesaroFractalSmall2.calculateCesaro(iterations: iterations, piAngleDivisor: angle)
//
//            }
//
//                taskGroup.addTask(priority: .high) {
//
//
//                    let iterations: Int? = 8
//                    let angle: Int? = 4
//
//
//                    await cesaroFractalSmall3.calculateCesaro(iterations: iterations, piAngleDivisor: angle)
//
//            }
//
//                taskGroup.addTask(priority: .high) {
//
//
//                    let iterations: Int? = 7
//                    let angle: Int? = 4
//
//
//                    await cesaroFractalSmall4.calculateCesaro(iterations: iterations, piAngleDivisor: angle)
//
//            }
//
//                taskGroup.addTask(priority: .high) {
//
//
//                    let iterations: Int? = 5
//                    let angle: Int? = 4
//
//
//                    await cesaroFractalSmall5.calculateCesaro(iterations: iterations, piAngleDivisor: angle)
//
//            }
//
//
//                taskGroup.addTask(priority: .high) {
//
//
//                    let iterations: Int? = 1
//                    let angle: Int? = 4
//
//
//                    await cesaroFractalSmall.calculateCesaro(iterations: iterations, piAngleDivisor: angle)
//
//            }
//
//    }
//
//
//        kochFractal.setButtonEnable(state: true)
//
//        print("End Time of \(Date())\n")
//
//    }
    
    /// clear
    ///
    /// Clears the two display views by erasing the Data
    ///
//    func clear() async{
//        
//        kochFractal.eraseData()
//        
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
