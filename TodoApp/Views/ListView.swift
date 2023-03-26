//
//  ListView.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import SwiftUI

struct ListView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		List {
			ForEach(listViewModel.items) { item in
				ListRowView(item: item)
					.onTapGesture {
						withAnimation(.linear) {
							listViewModel.updateItem(item: item)
						}
					}
			}
			.onDelete(perform: listViewModel.deleteItem)
			.onMove(perform: listViewModel.moveItem)
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
		.environmentObject(ListViewModel())
	}
}
