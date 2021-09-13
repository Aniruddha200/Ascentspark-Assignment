//
//  APIController.swift
//  Ascentspark Assignment
//
//  Created by administrator on 11/09/2021.
//

import Foundation

/*
This is viewmodel file to control the api
*/

class APIController: ObservableObject {

	@Published var apiResult: APIModel = APIModel(success: false, data: [APIModel.UserDataModel]())
	let apiURL: String

// Default apiURL is as below
	
	init(url: String = "https://smileelive.webappfactory.co/api/demo-data") {
		self.apiURL = url
	}

//function call for data fatching from the API.
	
	func fetchData(){
		guard let url = URL(string: self.apiURL) else {
			return
		}
		
		URLSession.shared.dataTask(with: url){data, _, error in
			DispatchQueue.main.async {
				if error == nil{
					guard let data = data else {
						fatalError("Corrupted Data")
					}
					do{
					let decoded = try JSONDecoder().decode(APIModel.self, from: data)
						self.apiResult = decoded
					}catch{
						fatalError("\(error)")
					}
					
				}
				else{
					fatalError(error?.localizedDescription ?? "Unknown Error")
				}
			}
			
			
		}.resume()
		
	}
}
