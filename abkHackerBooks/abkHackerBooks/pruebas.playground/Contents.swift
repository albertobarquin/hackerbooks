//: Playground - noun: a place where people can play

import Cocoa

var setTest: Set<String> = ["rojo", "verde", "azul"]
setTest.insert("naranja")
setTest.insert("azul")

var setTestDos = Set<String> ()

var str = "cereza, platano, uva"
var arr = str.componentsSeparatedByString(", ")
print (arr)

var setTres = Set<String> ()

for strItem in arr {
    setTres.insert(strItem)
}







