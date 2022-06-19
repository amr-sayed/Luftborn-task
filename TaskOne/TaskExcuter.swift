//
//  TaskExcuter.swift
//  TaskOne
//
//  Created by mac on 19/06/2022.
//

import Foundation

class TaskError: Error {
    var error: String
    
    init (error: String){
        self.error = error
    }
}

enum Result {
    case success
    case failure
}

struct Task {
    var id: Int
    var failPresentage: Float
    var delaySeconds: Double
}

enum Tasks{
    case Task1
    case Task2
    case Task3
    case Task4
    
    func getTask() -> Task {
        switch self {
        case .Task1:
            return  Task(id: 1, failPresentage: 0.1, delaySeconds: 5)
        case .Task2:
            return Task(id: 2, failPresentage: 0.2, delaySeconds: 2)
        case .Task3:
            return Task(id: 3, failPresentage: 0.05, delaySeconds: 3)
        case .Task4:
            return Task(id: 4, failPresentage: 0.1, delaySeconds: 1)
        }
    }
}

class TaskExcuter {
    var concurrentQueue: DispatchQueue?

    init() {
        concurrentQueue = DispatchQueue(label: "com.some.TaskOne", attributes: .concurrent)
    }
    
    func handleTask(task: Task) throws -> String  {
        
        if Float.random(in: 0..<1) <= task.failPresentage {
            throw TaskError(error: "\(Date().toString()) Task \(task.id) Failed")
        }
        
        return "\( Date().toString()) Task \(task.id)"
    }
    
    func excute(task: Tasks, compeletion: @escaping (Result, String) -> Void) {
        let selectedTask = task.getTask()
        concurrentQueue?.asyncAfter(deadline: .now() + selectedTask.delaySeconds) {
            do {
                let result =  try self.handleTask(task: selectedTask) 
                compeletion(.success, result)
            } catch let error {
                let apiError = error as? TaskError
                
                compeletion(
                    .failure,
                    apiError?.error ?? "Unkown error"
                )
            }
            
        }
    }
}
