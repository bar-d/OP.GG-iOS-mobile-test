//
//  OPGGAPIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Alamofire
import Foundation
import RxSwift

struct OPGGAPIService: APIService {
    func request<T>(_ request: T) -> Observable<T.APIResponse> where T : APIRequest {
        return Observable.create { observer in
            guard let urlRequest = request.urlRequest else { return }
            let request = AF.request(urlRequest).responseData { response in
                if let error = response.error {
                    return observer.onError(error)
                }
                
                if let responseCode = response.error?.responseCode {
                    let apiError = APIError.abnormalStatusCode(responseCode)
                    observer.onError(apiError)
                }
                
                if response.result.isSuccess {
                    let data = parse(response.data)
                    observer.onNext(data)
                    return observer.onCompleted()
                } else {
                    return observer.onError(APIError.unknownError(response.error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
