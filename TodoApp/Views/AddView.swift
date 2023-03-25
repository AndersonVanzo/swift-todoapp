//
//  AddView.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import SwiftUI

struct AddView: View {
	@State var textFieldText: String = ""
	
	var body: some View {
		ScrollView {
			VStack {
				TextField("Type something here...", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 48)
					.background(Color(.systemGray6))
					.cornerRadius(8)
				Button {
					
				} label: {
					Text("Save".uppercased())
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 48)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(8)
				}

			}
			.padding(16)
		}
		.navigationTitle("Add an item 🖋️")
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			AddView()
		}
	}
}
