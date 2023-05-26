//
//  Splash.swift
//  Baca
//
//  Created by Fransiskus Anggara on 22/05/23.
//

import SwiftUI

struct Splash: View {
    var body: some View {
            Image("Title")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
        }
    }

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
