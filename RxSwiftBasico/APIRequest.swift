//
//  APIRequest.swift
//  RxSwiftBasico
//
//  Created by Edmilson vieira da silva on 14/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class APIRequest{
  
  let baseURL = URL(string: "https://reqres.in/api/users")!
  let session = URLSession(configuration: .default)
  var dataTask: URLSessionDataTask? = nil
  
  func callAPI<T: Codable>() -> Observable<T>{
    return Observable<T>.create{observer in
      self.dataTask = self.session.dataTask(with: self.baseURL, completionHandler: {
        (data,response ,error) in
        do{
          let model: Datamodel = try JSONDecoder().decode(Datamodel.self, from: data ?? Data())
          observer.onNext(model.data as! T)
        } catch let error{
          observer.onError(error)
        }
        observer.onCompleted()
      })
      self.dataTask?.resume()
      return Disposables.create{
        self.dataTask?.cancel()
      }
    }
  }
}
struct UserDetailModel{
  var userData = UserDetails(id: 1, email: "abc@gmail.com", first_name: "xzy", last_name: "abc", avatar: "avatar")
  var isFavorite: BehaviorRelay<Bool> = BehaviorRelay(value: false)
  var isFavObservable: Observable<Bool>{return isFavorite.asObservable()}
}
