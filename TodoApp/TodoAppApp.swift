//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				ListView()
			}
			.navigationViewStyle(StackNavigationViewStyle())
			.environmentObject(listViewModel)
		}
	}
}
