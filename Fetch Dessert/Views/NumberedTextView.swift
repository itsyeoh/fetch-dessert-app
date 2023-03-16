//
//  NumberedTextView.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/14/23.
//

import SwiftUI

struct NumberedTextView: View {
    let text: String
    
    // This function splits the input text into an array of lines
    // and removes any empty lines.
    private func getLines() -> [Substring] {
        return text.split { $0.isNewline }.filter { !$0.isEmpty }
    }
    
    var body: some View {
        let lines = getLines()
        
        VStack(alignment: .leading) {
            ForEach(Array(lines.enumerated()), id: \.0) { index, line in
                HStack(alignment: .top, spacing: 4) {
                    Text("\(index + 1).")
                        .bold()
                    Text(line)
                        .lineLimit(nil)
                }//end HStack(..)
            }//end ForEach(..)
        }//end VStack(..)
    }
}
