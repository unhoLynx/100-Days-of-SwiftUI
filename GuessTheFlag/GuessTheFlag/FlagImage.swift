//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Dmitriy Rysev on 02.12.2022.
//

import SwiftUI

struct FlagImage: View  {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "Estonia")
    }
}
