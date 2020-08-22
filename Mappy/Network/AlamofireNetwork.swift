//
//  AlamofireNetwork.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireNetwork: Networking {

  private let session: Session

  init(session: Session = Session()) {
    self.session = session
  }

  func run<T>(
    route: NetworkRouting,
    completion: @escaping (Result<T, Error>) -> ()
  ) where T : Decodable, T : Encodable {
    let request = session.request(
      route.host,
      method: convertMethod(method: route.method),
      parameters: route.parameters,
      encoding: URLEncoding(destination: .queryString),
      headers: HTTPHeaders(route.headers)
    )
    request.validate()
      .responseDecodable(of: T.self) { response in
        guard let object = response.value else {
          completion(.failure(response.error ?? HTTPResponseError.unknown))
          return
        }
        completion(.success(object))
    }
  }


  private func convertMethod(method: HTTPMethod) -> Alamofire.HTTPMethod {
    switch method {
    case .get:
      return .get
    case .post:
      return .post
    case .put:
      return .put
    case .delete:
      return .delete
    }
  }
}
