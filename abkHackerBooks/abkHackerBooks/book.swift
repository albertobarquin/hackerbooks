//
//  book.swift
//  abkHackerBooks
//
//  Created by alberto barquin on 23/3/16.
//  Copyright © 2016 Barquin. All rights reserved.
//

import UIKit

class book: Equatable {
    //MARK:- Properties
    let title: String
    let author: [String]
    let tags: [String]?
    let bookImage: UIImage?
    let bookPdf: String

    init ( title: String,
         author: [String],
         tags: [String]?,
         bookImage: UIImage?,
         bookPdf: String){
            self.title = title
            self.author = author
            self.tags = tags
            self.bookImage = bookImage
            self.bookPdf = bookPdf
    }
    //MARK: - Proxies
    var proxyForComparison : String{
        
        get{
            let authorJoin = author.joinWithSeparator(",")
            return "\(title)\(authorJoin))"
        }
    }




}
func ==(lhs: book, rhs: book) -> Bool {
    //1er caso: son el mismo objeto
    guard !(lhs === rhs) else{
        return true
    }
    
    //2º caso: tienen clases distintas
    guard lhs.dynamicType == rhs.dynamicType else{
        return false
    }
    
    // Caso genérico
    return (lhs.proxyForComparison == rhs.proxyForComparison)
    
}