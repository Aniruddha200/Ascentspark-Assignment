//
//  FollowersView.swift
//  Ascentspark Assignment
//
//  Created by administrator on 11/09/2021.
//

import SwiftUI


/*
This is the view file for the each follower.
*/

struct FollowersView: View {
	
	let followers: APIModel.UserDataModel
	@ObservedObject private var networkImageController = NetworkImageController()
	
    var body: some View {
		
//Profile Picture UI
		
		HStack(spacing: 20){
			Image(uiImage: networkImageController.resultImage)
				.resizable()
				.frame(width: 69, height: 69, alignment: .center)
				.scaledToFit()
				.clipShape(Circle())
				.overlay(Circle().stroke(Color("CustomColor1"), lineWidth: 4.0))

// Followers Info UI
			
			VStack{
				Text("\(followers.first_name) \(followers.last_name)")
					.font(.title3)
					.fontWeight(.semibold)
				HStack{
					Text("@\(followers.user_name)")
						.font(.subheadline)
						.fontWeight(.light)
					
					Text("•\(followers.total_followers)")
						.font(.subheadline)
						.fontWeight(.bold)
					
					Text("followers")
						.font(.subheadline)
						.fontWeight(.light)
				}

				
// Followers Special Features UI
				
				HStack{
				ForEach(followers.followings.user_tags, id: \.id){user_tag in
					if user_tag.tag.name == "Celebrity" || user_tag.tag.name == "VIP"{
						HStack{
						Image("\(user_tag.tag.name)")
						Text("\(user_tag.tag.name)")
							.font(.subheadline)
							.fontWeight(.light)
						}
					}
					
				}
				}
				.frame(width: 150, height: 20, alignment: .center)
				.background(Color("CustomColor2"))
				.clipShape(RoundedRectangle(cornerRadius: 50))
				
				
			}
			
			Spacer()
			
// Action Button
			Button(action: {}){
			Image("PersonArrow")
				.resizable()
				.frame(width: 35, height: 35, alignment: .center)
				.scaledToFit()
				.clipShape(Circle())
			}
			
		}
		.onAppear(perform: {networkImageController.imageFetch(url: followers.profile_picture)})
    }
	
	
}

