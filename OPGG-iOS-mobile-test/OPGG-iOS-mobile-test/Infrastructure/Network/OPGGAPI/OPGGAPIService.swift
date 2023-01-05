//
//  OPGGAPIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Alamofire
import Foundation

struct OPGGAPIService: APIService {
    func excute<T>(
        _ request: T,
        completion: @escaping (Result<T.APIResponse, APIError>) -> Void
    ) where T : APIRequest {
        guard let request = request.urlRequest else {
            return
        }
        
        callHandler(completion, from: request)
    }
    
    private func callHandler<T>(
        _ completion: @escaping (Result<T, APIError>) -> Void,
        from request: URLRequest
    ) where T: Decodable {
        AF.request(request).responseDecodable { (response: DataResponse<T, AFError>) in
            if let error = response.error {
                completion(.failure(.unknownError(error)))
            }
            
            if let responseCode = response.error?.responseCode {
                let apiError = APIError.abnormalStatusCode(responseCode)
                completion(.failure(apiError))
            }
            
            completion(checkIntegrity(of: response.data))
        }
    }
    
    private func checkIntegrity<T>(
        of data: Data?
    ) -> Result<T, APIError> where T: Decodable {
        guard let verifiedData = data else {
            return .failure(.emptyData)
        }
        
        if let parsedData: T = parse(verifiedData) {
            return .success(parsedData)
        }  else {
            return .failure(.failedToParse)
        }
    }
}
