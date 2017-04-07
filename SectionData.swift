//
//  SectionData.swift
//  GithubDemo
//
//  Created by Nishanko, Nishant on 4/6/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

struct Section {
    
    var heading : String
    var items : [String]
    
    init(title: String, objects : [String]) {
        
        heading = title
        items = objects
    }
}

class SectionData {
    func getSectionsFromData() -> [Section] {
        
        // you could replace the contents of this function with an HTTP GET, a database fetch request,
        // or anything you like, as long as you return an array of Sections this program will
        // function the same way.
        
        var sectionsArray = [Section]()
        
        let animals = Section(title: "Animals", objects: ["Cats", "Dogs", "Birds", "Lions"])
        let vehicles = Section(title: "Vehicles", objects: ["Cars", "Boats", "Planes", "Motorcycles", "Trucks"])
        let movies = Section(title: "Movies", objects: ["Blade Runner", "Mad Max", "Transcendent Man", "Jurassic World"])
        
        
        sectionsArray.append(animals)
        sectionsArray.append(vehicles)
        sectionsArray.append(movies)
        
        return sectionsArray
    }
}
