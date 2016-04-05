//
//  book.swift
//  abkHackerBooks
//
//  Created by alberto barquin on 23/3/16.
//  Copyright © 2016 Barquin. All rights reserved.
//

import UIKit

class Book: Equatable, Comparable {
    //MARK:- Properties
    let title: String
    let author: [String]
    let tags: [String]?
    let bookImage: UIImage?
    let bookPdf: String
    var isFavorite: Bool = false
    
    //MARK: - Computed Variables
    var authorJoin : String {
        get {
           return author.joinWithSeparator(",")
        }
    }

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
            return "\(title)\(authorJoin)"
        }
    }
    
    var  proxyForSorting : String{
        get {
            if (isFavorite){
            return "A\(title)\(authorJoin)"
            }
            else {
               return "Z\(title)\(authorJoin)"
            }
            
        }
    }




}
func ==(lhs: Book, rhs: Book) -> Bool {
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
func <(lhs: Book, rhs: Book) -> Bool{
    
    
    return  (lhs.proxyForSorting < rhs.proxyForSorting)
}