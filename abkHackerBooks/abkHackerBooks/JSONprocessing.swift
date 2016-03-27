//
//  JSONprocessing.swift
//  abkHackerBooks
//
//  Created by alberto barquin on 26/3/16.
//  Copyright © 2016 Barquin. All rights reserved.
//

import UIKit


//un libro para tenerlo a mano
/*
 {
 "authors": "Scott Chacon, Ben Straub",
 "image_url": "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg",
 "pdf_url": "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf",
 "tags": "version control, git",
 "title": "Pro Git"
 }
 
 */
// MARK _ Type alias
//MARK: - Aliases
// se los tomo prestados a Fernando de momento

typealias JSONObject        = AnyObject
typealias JSONDictionary    = [String:JSONObject]
typealias JSONArray         = [JSONDictionary]

enum JSONKeys: String{
    case title      = "title"
    case authors    = "authors"
    case tags       = "tags"
    case image_url  = "image_url"
    case pdf_url    = "pdf_url"
}

//MARK: - Errors
enum JSONProcessingError : ErrorType{
    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat
}


//MARK - Global Variables
var tags  = Set<String> ()

//MARK - Sstructs
struct strictBook{
    let title       : String
    let authors     : [String]
    let tags        : Set<String>
    let image_url   : NSURL
    let pdf_url     : NSURL
}

// MARK - Decoding

func decodeBook (bookToDecode json: JSONDictionary) throws -> strictBook {
    
    guard let image_url_string  = json[JSONKeys.image_url.rawValue] as? String,
        let image_url = NSURL(string: image_url_string ) else{
           
            throw JSONProcessingError.ResourcePointedByURLNotReachable
            
    }
    guard let pdf_url_string = json[JSONKeys.pdf_url.rawValue] as? String,
        let pdf_url = NSURL(string: pdf_url_string) else {
            throw JSONProcessingError.ResourcePointedByURLNotReachable
            
    }
    //Creamos un set para que las tags nunca estén repetidas sin necesidad de comprobar la colección cada vez 
    
    var tags = Set<String>()
    var authors = [String]()
    
    if  let title = json[JSONKeys.title.rawValue] as? String,
        let tags_hash = json[JSONKeys.tags.rawValue] as? String,
        let authors_hash = json[JSONKeys.authors.rawValue] as? String{
       
        let authors_arr = authors_hash.componentsSeparatedByString(", ")
        for author in authors_arr{ authors.append(author)}
        
        let tags_array = tags_hash.componentsSeparatedByString(", ")
        for tag in tags_array{ tags.insert(tag)}
        
        
        return strictBook (title: title, authors: authors, tags: tags, image_url: image_url, pdf_url: pdf_url)
    
    }
    else {
        throw JSONProcessingError.WrongJSONFormat
    }
    
//    {
//        let tags_array = tags_hash.componentsSeparatedByString(", ")
//        
//        for tag in tags_array{ tags.insert(tag)}
//    }
//    if let authors_hash = json[JSONKeys.authors.rawValue] as? String {
//        let authors_arr = authors_hash.componentsSeparatedByString(", ")
//        for author in authors_arr{ authors.append(author)}
//    }
//      let title = json[JSONKeys.title.rawValue] as? String
//    
//    
    
    
    
  


}














