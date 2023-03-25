//
//  ItemModel.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 25/03/23.
//

import Foundation

struct ItemModel: Identifiable {
	let id: String = UUID().uuidString
	let title: String
	let isCompleted: Bool
}
