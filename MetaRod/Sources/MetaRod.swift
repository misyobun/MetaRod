//
//  MetaRod.swift
//  MetaRod
//
//  Created by NaotoTakahashi
//  Copyright © 2020 msb. All rights reserved.
//

import Foundation
import SwiftSoup

public enum MetaRodError: Error {
    case parseError(String)
    case unknown(String)
}
public class MetaRod:NSObject {
    
    fileprivate var document:Document? = nil
    
    public func build(_ urlstr:String) -> Self{
        do {
            guard let url = URL(string: urlstr), let html = try? String(contentsOf: url, encoding: .utf8) else { return self }
            self.document = try SwiftSoup.parse(html)
        } catch Exception.Error(let type, let message) {
            print("error type \(type) message \(message)")
        } catch {
            print("unknown error")
        }
        return self
    }
    
    public func meta() throws -> [String : String]  {
           var meta:[String:String] = [:]
           do {
               let header = self.document?.head()
               let metaList = try header?.getElementsByTag("meta")
               try metaList?.forEach{ elm in
                   let prop = try elm.attr("property")
                   if (!prop.isEmpty) {
                       meta[prop] = try elm.attr("content")
                   }
               }
           } catch Exception.Error(_, let message) {
               throw MetaRodError.parseError(message)
           } catch {
               throw MetaRodError.unknown("failed")
           }
           return meta
    }
    
    public func meta(completion: @escaping([String: String]) -> Void, errorCompletion: @escaping(MetaRodError) -> Void) {
        DispatchQueue.global().async {
            do {
                var meta:[String:String] = [:]
                let header = self.document?.head()
                let metaList = try header?.getElementsByTag("meta")
                try metaList?.forEach{ elm in
                    let prop = try elm.attr("property")
                    if (!prop.isEmpty) {
                        meta[prop] = try elm.attr("content")
                    }
                }
                DispatchQueue.main.async {
                    completion(meta)
                }

            } catch Exception.Error(_, let message) {
                DispatchQueue.main.async {
                    errorCompletion(MetaRodError.parseError(message))
                }
            } catch {
                DispatchQueue.main.async {
                    errorCompletion(MetaRodError.unknown("failed"))
                }
            }
        }
    }
    
    public func og() throws -> [String : String]  {
        var og:[String:String] = [:]
        do {
            let header = self.document?.head()
            let metaList = try header?.getElementsByTag("meta")
            try metaList?.forEach{ elm in
                let prop = try elm.attr("property")
                if (!prop.isEmpty && prop.contains("og:")) {
                    og[prop] = try elm.attr("content")
                }
            }
        } catch Exception.Error(_, let message) {
            throw MetaRodError.parseError(message)
        } catch {
            throw MetaRodError.unknown("failed")
        }
        return og
    }
    
    public func og(completion: @escaping([String: String]) -> Void, errorCompletion: @escaping(MetaRodError) -> Void) {
        DispatchQueue.global().async {
            do {
                var og:[String:String] = [:]
                let header = self.document?.head()
                let metaList = try header?.getElementsByTag("meta")
                try metaList?.forEach{ elm in
                    let prop = try elm.attr("property")
                    if (!prop.isEmpty && prop.contains("og:")) {
                        og[prop] = try elm.attr("content")
                    }
                }
                DispatchQueue.main.async {
                    completion(og)
                }

            } catch Exception.Error(_, let message) {
                DispatchQueue.main.async {
                    errorCompletion(MetaRodError.parseError(message))
                }
            } catch {
                DispatchQueue.main.async {
                    errorCompletion(MetaRodError.unknown("failed"))
                }
            }
        }
    }
}
