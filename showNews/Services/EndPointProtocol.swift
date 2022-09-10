//
//  EndPointProtocol.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

protocol EndPointProtocol {
    
    var locale: String { get }
    
    var region: String { get }
    
    var completeURL: String { get }
    
    var APIKey: String { get }

}

extension EndPointProtocol {
    var locale: String {
        return Locale.current.languageCode ?? "en"
    }
    
    var region: String {
        return Locale.current.regionCode ?? "us"
    }
    
    var APIKey: String {
        return Secrets.APIKey
    }
}
