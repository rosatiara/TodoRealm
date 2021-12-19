//
//  AddButton.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(red: 185 / 255, green: 117 / 255, blue: 80 / 255))
          Text("+")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

        }.frame(height:50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
