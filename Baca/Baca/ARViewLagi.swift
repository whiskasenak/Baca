//
//  ARViewRepresemtable.swift
//  Baca
//
//  Created by Fransiskus Anggara on 23/05/23.
//

import RealityKit
import SwiftUI

struct ContentView2 : View {
    @State private var isAnchorDetected = false
    @State private var refresh = false

    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                    .frame(height:10)
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Reset the state of the view
                        isAnchorDetected = false
                        refresh.toggle()
                    }) {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 44))
                            .padding()
                            .foregroundColor(.white)
                            .opacity(0.5)
                        
                    }
                    Spacer()
                        .frame(width:20)
                }
                Spacer()
            }

            VStack {
                Spacer()
                    .frame(height: 100)
                
                Rectangle()
                    .stroke(lineWidth: 5)
                    .foregroundColor(Color(red: 251/255, green: 247/255, blue: 25/255))
                    .frame(width: 220, height: 380)
                    .opacity(isAnchorDetected ? 0 : 0.5)
                    
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .opacity(0.5)
                        .frame(width: 350, height: 50)
                    Text("Place the book in the designated area.")
                        .foregroundColor(.black)
                }
                .opacity(isAnchorDetected ? 0 : 1)
            }
            .onAppear {
                // Hide the RoundedRectangle after 5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isAnchorDetected = true
                }
            }
        }
        .navigationBarBackButtonHidden()
        // Use the refresh state to trigger a view update
        .id(refresh)
    }
}





struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Load the "Book1" scene from the "Experience" Reality File
        let book1Anchor = try! Experience.loadBook1()
        // Add the book1 anchor to the scene
        arView.scene.anchors.append(book1Anchor)
        
        // Load the "Book2" scene from the "Experience" Reality File
        let book2Anchor = try! Experience.loadBook2()
        // Add the book2 anchor to the scene
        arView.scene.anchors.append(book2Anchor)
        
        // Load the "Book3" scene from the "Experience" Reality File
        let book3Anchor = try! Experience.loadBook3()
        // Add the book3 anchor to the scene
        arView.scene.anchors.append(book3Anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
            .edgesIgnoringSafeArea(.all)
    }
}
