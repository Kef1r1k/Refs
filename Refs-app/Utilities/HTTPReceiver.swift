//
//  HTTPReceiver.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import Foundation

class HTTPReceiver: NSObject {
    
    var tasks: [[String: Any]] = []
    
    func fetchDataFromServer(){
        
        // Replace the URL with the actual URL of your server endpoint
        if let url = URL(string: "http://localhost:3000/api/v1/tasks.json") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Check for a successful response
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error: Invalid response")
                    return
                }
                
                // Parse the data
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        self.getTasksFromData(data)
                        
                        
//                        print("Received data: \(json)")
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
                
                
//                DispatchQueue.main.async {
////                    print(self.coverPosts)
//                    self.createCards(scrollView: self.mainScroll!)
//                }
            }
            // Start the task
            task.resume()
            
        }
    }
    
    func getTasksFromData(_ data: Data) {
        
        var shapeTasks: [[String: Any]] = []
        
            do {
                // Parse the JSON data into a dictionary
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    // Iterate over the dictionary
    //            for i in json as! [String: Any] {
    //                print(i)
    //            }
                
                // Extract entity parameters
                if let unwrappedArray = json {
                    for dictionary in unwrappedArray {
//                        print(dictionary["name"])
                        if let type = dictionary["type"] as? String {
                            if type == "ShapeTask" { shapeTasks.append(dictionary) }
                        }
                    }
                }
//                print(json)
                        
                } catch {
                    print("Error parsing JSON: \(error)")
                }
//        return coverPosts
        self.tasks = shapeTasks
        
        print(self.tasks)
//        print(self.coverPosts)
//        print(coverPosts)
        
        
        
        }
    
    func getPosts() -> [[String: Any]] {
        return self.tasks
    }
}
