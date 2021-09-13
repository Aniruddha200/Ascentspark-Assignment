//
//  ContentView.swift
//  Ascentspark Assignment
//
//  Created by administrator on 09/09/2021.
//

import SwiftUI

/*
This is a view file to control the main UI.
*/

struct HomeView: View {
	@ObservedObject var apiController = APIController()
	
	@State private var text = ""
	@State private var isNavlinkActive = false
	var body: some View {
		NavigationView{
			GeometryReader{ geo in
				VStack{

//Search Bar UI
					
					HStack{
						
						Image("Search")
							.padding(.leading)
						
						TextField("Search", text: $text)
							.font(.headline)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.padding(.trailing)
					}
					.frame(width: geo.size.width, height: geo.size.height * 0.09)
					.background(Color("CustomColor2"))
					.clipShape(RoundedRectangle(cornerRadius: 10.0))
					
					
//Followers List UI
					
					VStack{
						ForEach(self.apiController.apiResult.data, id: \.user_id){ user in
							FollowersView(followers: user)
								.padding(10)
						}
						
						Spacer()
					}
					.frame(width: geo.size.width, height: geo.size.height * 0.80)
					.background(Color(#colorLiteral(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)))
					.onAppear(perform: {self.apiController.fetchData()})
					
					
					Spacer()

// The toolBar UI
					
					HStack(alignment: .center, spacing: 45){
						Button(action: {}){
							Image("Home")
								.padding(.leading)
						}
						
						Button(action: {}){
							Image("World")
							
						}
						
						Button(action: {}){
							VStack{
								Image("Live")
								Text("Live")
							}
							.frame(width: 68, height: 68, alignment: .center)
							.background(Color("CustomColor1"))
							.clipShape(Circle())
							.overlay(Circle().stroke(Color.white, lineWidth: 6))
							.offset(x: 0, y: -20)
							
						}
						
						Button(action: {}){
							Image("Bell")
							
						}
						
						Button(action: {}){
							Image(systemName: "person.circle")
								.resizable()
								.frame(width: 28, height: 28)
								.accentColor(.gray)
								.padding(.trailing)
						}
					}
					.frame(width: geo.size.width, height: geo.size.height * 0.1)
				}
				
			}
			
			
// Navigation UI
			
			.navigationBarTitle("", displayMode: .inline)
			.navigationBarItems(leading: Button(action:{}){
				HStack{
				Image(systemName: "arrow.backward")
				Text("Followers")
					.font(.headline)
					.fontWeight(.black)
				}
			}
			.foregroundColor(.black))
		}
		
	}
	
	
}


