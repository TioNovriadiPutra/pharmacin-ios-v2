//
//  NetworkService.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 23/02/24.
//

import Foundation

class NetworkingService{
//    let prefixURL = "http://103.164.219.2:7800"
    let prefixURL = "https://b496-2001-448a-2083-f680-a8a9-f105-4623-ddb2.ngrok-free.app"
    
    //MARK: - Retrieve Data (get method)
    func requestGET<T:Decodable>(endpoint: String,
                                 token: String?,
                                 expecting: T.Type,
                                 completion: @escaping (Result<T, Error>) -> Void){
        
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        //step2. set request header/body
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                //if ada error print error
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                //simpan response, else tunjukin error
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print("\(response.statusCode) - \(endpoint)")
                
                //simpan data
                if let data = data {
                    do{
                        if let user = try? JSONDecoder().decode(expecting.self, from: data){
                            completion(.success(user))
                        }else {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse2.self, from: data)
                            completion(.failure(errorResponse ))
                        }
                    }catch {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    //MARK: - Send Data (post method) (to create or whatever)
    func requestPOST<T:Decodable>(endpoint: String,
                                  parameters: [String: Any],
                                  token: String?,
                                  expecting: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void){
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        //step 2. set the request body/header
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        
        //step 3. actual networking
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                //if ada error tunjukin error
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                //if ada response-simpan, else tunjukin error
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print("\(response.statusCode) - \(endpoint)")
                
                //actual networking
                if let data = data {
                    do{
                        if let user = try? JSONDecoder().decode(expecting.self, from: data){
                            completion(.success(user))
                            
                        }else {
                            if response.statusCode == 422{
                                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                                completion(.failure(errorResponse))
                            }else{
                                let errorResponse = try JSONDecoder().decode(ErrorResponse2.self, from: data)
                                completion(.failure(errorResponse))
                            }
                        }
                    }catch {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    //MARK: - Update Data (change data)
    func requestPUT<T:Decodable>(endpoint: String,
                                 parameters: [String: Any],
                                 token: String?,
                                 expecting: T.Type,
                                 completion: @escaping (Result<T, Error>) -> Void){
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        //step 2. set the request body/header
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        //step 3. actual networking
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            DispatchQueue.main.async {
                
                
                //print error kalau ada
                if error != nil {
                    completion(.failure(error!))
                }
                
                //if ada response-simpan, else tunjukin error
                guard let response = res as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print("\(response.statusCode) - \(endpoint)")
                
                //cek data ada tidak
                if let data = data {
                    do{
                        if let user = try? JSONDecoder().decode(expecting.self, from: data){
                            completion(.success(user))
                            
                        }else {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                            completion(.failure(errorResponse ))
                        }
                    }catch {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
    
    //MARK: - Update Data with list parameter
    func requestPUT2<T:Decodable>(endpoint: String,
                                  parameters: [Any],
                                  token: String?,
                                  expecting: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void){
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        //step 2. set the request body/header
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        //step 3. actual networking
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            DispatchQueue.main.async {
                
                //print error kalau ada
                if error != nil {
                    completion(.failure(error!))
                }
                
                guard let response = res as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print("\(response.statusCode) - \(endpoint)")
                
                //cek data ada tidak
                if let data = data {
                    do{
                        if let user = try? JSONDecoder().decode(expecting.self, from: data){
                            completion(.success(user))
                            
                        }else {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                            completion(.failure(errorResponse ))
                        }
                    }catch {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
    
    
    //MARK: - Delete Data
    func requestDELETE<T:Decodable>(endpoint: String,
                                    parameters: [String: Any],
                                    token: String?,
                                    expecting: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void){
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        //step 2. set the request body/header
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        //step 3. actual networking
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            //print error kalau ada
            if error != nil {
                completion(.failure(error!))
            }
            
            guard let response = res as? HTTPURLResponse else {
                completion(.failure(NetworkingError.badResponse))
                return
            }
            print("\(response.statusCode) - \(endpoint)")
            
            //cek data ada tidak
            if let data = data {
                do{
                    if let user = try? JSONDecoder().decode(expecting.self, from: data){
                        completion(.success(user))
                        
                    }else {
                        let errorResponse = try JSONDecoder().decode(ErrorResponse2.self, from: data)
                        completion(.failure(errorResponse ))
                    }
                }catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    //MARK: - Patch Data
    func requestPATCH<T:Decodable>(endpoint: String,
                                    parameters: [String: Any],
                                    token: String?,
                                    expecting: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void){
        
        //step 1. guard let url since we dont have data yet
        guard let url = URL(string: prefixURL + endpoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        //step 2. set the request body/header
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        //step 3. actual networking
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            //print error kalau ada
            if error != nil {
                completion(.failure(error!))
            }
            
            guard let response = res as? HTTPURLResponse else {
                completion(.failure(NetworkingError.badResponse))
                return
            }
            print("\(response.statusCode) - \(endpoint)")
            
            //cek data ada tidak
            if let data = data {
                do{
                    if let user = try? JSONDecoder().decode(expecting.self, from: data){
                        completion(.success(user))
                        
                    }else {
                        let errorResponse = try JSONDecoder().decode(ErrorResponse2.self, from: data)
                        completion(.failure(errorResponse ))
                    }
                }catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}

enum NetworkingError: Error{
    case badUrl
    case badResponse
}

