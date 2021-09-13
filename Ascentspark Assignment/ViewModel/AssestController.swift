//
//  NetworkAssestController.swift
//  Ascentspark Assignment
//
//  Created by administrator on 12/09/2021.
//

import Foundation
import UIKit

/*
This is a viewmodel file to configure various assest in the UI.
*/

class NetworkImageController: ObservableObject{
	
// Default Cloud Image as a placeholder
	
	@Published var resultImage = UIImage(systemName: "cloud")!

//Function Call for imaage fetching
	
	func imageFetch(url : String){
		
		guard let url = URL(string: url) else{
			fatalError("url")
		}
		
		URLSession.shared.dataTask(with: url){data, _, _ in
			
			DispatchQueue.main.async {
				if let data = data{
					self.resultImage = UIImage(data: data)!
				
				}
				else{
					debugPrint("Profile Picture not found")
				}
			}
			
		}.resume()
	}
}
