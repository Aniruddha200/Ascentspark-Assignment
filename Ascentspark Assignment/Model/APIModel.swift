//
//  APIModel.swift
//  Ascentspark Assignment
//
//  Created by administrator on 09/09/2021.
//

/*
This file configurea a swift model that can be used to parse the api response and use it as a object.
*/


import Foundation

struct APIModel: Codable {
	let success: Bool
	let data: Array<UserDataModel>
	
	struct UserDataModel: Codable, Identifiable {
		
		
		let id	:	Int
		let user_id	:	Int
		let follower_id	:	Int
		let status	:	Int
		let first_name	:	String
		let last_name	:	String
		let user_name	:	String
		let email	:	String
		let phone	:	String
		let bio	:	String
		
		let profile_picture	:	String
		let dob	:	String
		let gender	:	String
		let social_id	:	Int?
		let social_site	:	String?
		let country_id	:	Int
		let state_id	:	Int
		let device_token_ios	:	Int?
		let device_token_android	:	Int?
		let total_coins	:	Int?
		
		let received_coins	:	Int
		let sent_coins	:	Int
		let total_own_groups	:	Int
		let total_member_of_groups	:	Int
		let total_followers	:	Int
		let total_followings	:	Int
		let total_tags	:	Int
		let total_broadcasts	:	Int
		let type	:	Int
		let subscription_date	:	String?
		let is_notification_active	:	String
		
		let is_private	:	String
		let remember_token	:	Int?
		let block	:	Int
		let follow	:	Int
		
		let followings:	FollowingModel


		struct FollowingModel: Codable, Identifiable {
			let id	:	Int
			let first_name	:	String
			let last_name	:	String
			let user_name	:	String
			let email	:	String
			let phone	:	String
			let bio	:	String
			let profile_picture	:	String
			let dob	:	String
			let gender	: String
			let social_id	:	Int?
			let social_site	:	Int?
			let country_id	:	Int
			let state_id	:	Int
			let device_token_ios	:	Int?
			let device_token_android	:	Int?
			let total_coins	:	Int
			let received_coins	:	Int
			let sent_coins	:	Int
			let total_own_groups	:	Int
			let total_member_of_groups	:	Int
			let total_followers	:	Int
			let total_followings	:	Int
			let total_tags	:	Int
			let total_broadcasts	:	Int
			let type	:	Int
			let status	:	Int
			let subscription_date	:	String?
			let is_notification_active	:	String
			let is_private	:	String
			let image_path	:	String?
			let formatted_total_coins	:	String
			let formatted_received_coins	:	String
			let formatted_sent_coins	:	String
			let formatted_total_followers	:	String
			let formatted_total_followings	:	String
			let formatted_total_broadcasts	:	String
			let user_tags: [TagCollectionModel]

			
			struct TagCollectionModel: Codable, Identifiable {
				let id: Int
				let user_id: Int
				let tag_id:	Int
				let tag: TagModel
				
				struct TagModel: Codable, Identifiable{
					let id	:	Int
					let name	:	String
					let icon	:	String
					let is_active	:	Int
					let icon_path	:	String?
				}
			}
		}
	}
}




