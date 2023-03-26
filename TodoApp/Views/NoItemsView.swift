//
//  NoItemsView.swift
//  TodoApp
//
//  Created by Anderson Vanzo on 26/03/23.
//

import SwiftUI

struct NoItemsView: View {
	
	@State var animate: Bool = false
	
	let secondaryAccentColor = Color("SecondaryAccentColor")
	
	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
				Animation
					.easeInOut(duration: 2.0)
					.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
	
	var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Text("There are no items!")
					.font(.title)
					.fontWeight(.semibold)
				Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
					.padding(.bottom, 20)
				NavigationLink(destination: AddView(), label: {
					Text("Add something 🥳")
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 48)
						.frame(maxWidth: .infinity)
						.background(animate ? secondaryAccentColor : Color.accentColor)
						.cornerRadius(8)
				})
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(
					color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
					radius: animate ? 30 : 10,
					x: 0,
					y: animate ? 15 : 5
				)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
			}
			.frame(maxWidth: 400)
			.multilineTextAlignment(.center)
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

struct NoItemsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			NoItemsView()
				.navigationTitle("Title")
		}
	}
}
