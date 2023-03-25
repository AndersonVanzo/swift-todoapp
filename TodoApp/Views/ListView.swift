//
//  ListView.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import SwiftUI

struct ListView: View {
	
	@State var items: [ItemModel] = [
		ItemModel(title: "This is the first title!", isCompleted: false),
		ItemModel(title: "This is the second!", isCompleted: true),
		ItemModel(title: "Third!", isCompleted: false),
	]
	
	var body: some View {
		List {
			ForEach(items) { item in
				ListRowView(item: item)
			}
		}
		.listStyle(PlainListStyle())
		.navigationTitle("Todo App 📝")
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				EditButton()
			}
			ToolbarItem(placement: .navigationBarTrailing) {
				NavigationLink("Add", destination: AddView())
			}
		}
	}
}

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ListView()
		}
	}
}
