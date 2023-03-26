//
//  AddView.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import SwiftUI

struct AddView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var listViewModel: ListViewModel
	
	@State var textFieldText: String = ""
	
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false
	
	func saveButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}
	}
	
	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "Your new todo item must be at least 3 characters long!"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
	
	var body: some View {
		ScrollView {
			VStack {
				TextField("Type something here...", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 48)
					.background(Color(.systemGray6))
					.cornerRadius(8)
				Button(action: saveButtonPressed ,label: {
					Text("Save".uppercased())
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 48)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(8)
				})
			}
			.padding(16)
		}
		.navigationTitle("Add an item 🖋️")
		.alert(isPresented: $showAlert, content: getAlert)
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			AddView()
		}
		.environmentObject(ListViewModel())
	}
}
