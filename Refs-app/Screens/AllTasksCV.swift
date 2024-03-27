//
//  AllTasksCV.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import Foundation
import SwiftUI


struct Task: Codable, Identifiable {
    var id = UUID()
    let first_answer_image: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case first_answer_image
        case type
    }
}

struct TaskPreview: View {
    var task: Task
    @State private var tasks: [Task] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("")
    }
}

    
    func fetchData() {
            guard let url = URL(string: "http://localhost:3000/api/v1/tasks.json") else {
                print("Invalid URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Invalid response")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([Task].self, from: data)
                    DispatchQueue.main.async {
                        self.tasks = decodedData
                        print(self.tasks)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
    
}
