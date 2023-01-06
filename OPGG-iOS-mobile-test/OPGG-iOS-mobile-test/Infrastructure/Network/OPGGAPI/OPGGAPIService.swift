//
//  OPGGAPIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/06.
//

import Alamofire
import RxSwift

struct OPGGAPIService: APIService {
    func request<T>(_ request: T) -> Observable<T.APIResponse> where T : APIRequest {
        guard let urlRequest = request.urlRequest else { return
            .empty()
        }
        
        return Observable.create { observer in
            let request = AF.request(urlRequest).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let data = try JSONDecoder().decode(
                            T.APIResponse.self,
                            from: data
                        )
                        
                        observer.onNext(data)
                        observer.onCompleted()
                    } catch {
                        observer.onError(APIError.failedToParse)
                    }
                case .failure(let error):
                    if let statusCode = error.responseCode {
                        observer.onError(APIError.abnormalStatusCode(statusCode))
                    }
                    
                    observer.onError(APIError.unknownError(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
