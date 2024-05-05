//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import XCTest
@testable import MarvelHeroes
import SwiftUI
import ViewInspector
import UIKit

extension HerosView: Inspectable{}
extension HeroSeriesView: Inspectable{}

final class MarvelHeroesTests: XCTestCase {


    
    func testBaseNetwork() {
        let sessionHeros = BaseNetwork().getSessionHeros().url
        XCTAssertEqual(sessionHeros, URL(string: "https://gateway.marvel.com/v1/public/characters?apikey=4c64c5a2e16fb54ba9b851005b3d85fb&ts=1&hash=09a08b86af7b3f5c25391bbf70249b8e&orderBy=-modified"))
        
        XCTAssertEqual(BaseNetwork().getSessionHeros().httpMethod, HTTPMethods.get)
        
        XCTAssertNoThrow(BaseNetwork().getSessionHeros())
        
        let sessionSeries = BaseNetwork().getSessionSeries(HeroID: "12345").url
        XCTAssertEqual(sessionSeries, URL(string: "https://gateway.marvel.com/v1/public/characters/12345/series?apikey=4c64c5a2e16fb54ba9b851005b3d85fb&ts=1&hash=09a08b86af7b3f5c25391bbf70249b8e&orderBy=-modified"))
        
        XCTAssertEqual(BaseNetwork().getSessionSeries(HeroID: "12345").httpMethod, HTTPMethods.get)
        
        XCTAssertNoThrow(BaseNetwork().getSessionSeries(HeroID: "12345"))
    }
    
    func testHerosViewModel() async {
        
        let hvm = HerosViewModel(mocked: true)
        
        XCTAssertNotNil(hvm)
        
       
          await  hvm.getHeros()
        
        XCTAssertEqual(hvm.heros.count, 3)
        
    }
    
    func testHeroSeriesViewModel() async {
        let svm = HeroSeriesViewModel(mocked: true)
        
        XCTAssertNotNil(svm)
        
        await svm.getSeries(HeroID: "12345")
        
        XCTAssertEqual(svm.series.count, 2)

    }
    
//    func testViewError() throws {
//    
//        //instanciamos la vista
//        let view = ErrorView(error: "TEST")
//                      .environmentObject(RootViewModel())
//        XCTAssertNotNil(view)
//        
//        let numItems = try view.inspect().count
//        XCTAssertEqual(numItems, 1)
//        
//        //Imagen con ID 0. Si es NIL = error
//        let image = try view.inspect().find(viewWithId: 0)
//        XCTAssertNotNil(image)
//        
//        //Text del error
//        let text = try view.inspect().find(viewWithId: 1)
//        XCTAssertNotNil(text)
//        
//        let texto = try text.text().string()
//        XCTAssertEqual(texto, "Error: TEST")
//        
//        
//        //button
//        let boton = try view.inspect().find(viewWithId: 2)
//        XCTAssertNotNil(boton)
//        
//        //tap del boton
//        try boton.button().tap() //ejecuto el boton
//        
//        
//        
//    }
    
    
    func testHerosRowView() throws {
    
        //instanciamos la vista
        //let view = HerosView(viewModel: HerosViewModel(mocked: true))
        let view = HerosRowView(hero: MockTest().MockHeroRow)
                  
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen con ID 0. Si es NIL = error
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        //Text del error
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Hit-Monkey")
        
        
//        //button
//        let boton = try view.inspect().find(viewWithId: 2)
//        XCTAssertNotNil(boton)
//        
//        //tap del boton
//        try boton.button().tap() //ejecuto el boton
        
        
        
    }
    
    func testHerosView() throws {
    
        //instanciamos la vista
        let view = HerosView(viewModel: HerosViewModel(mocked: true))

                  
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
    
    }
    
    func testLoaderView() throws {
    
        //instanciamos la vista
        let view = LoaderView()

                  
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Text del error
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Cargando ...")
    
    }
    
    func testHerosSeriesView() throws {
    
        //instanciamos la vista
        let view = HeroSeriesView(heroID: "1234", viewModel: HeroSeriesViewModel(mocked: true))

                  
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        XCTAssertEqual(view.heroID, "1234")
        
        
    
    }
    
    func testHerosSeriesRowView() throws {
    
        //instanciamos la vista
        //let view = HerosView(viewModel: HerosViewModel(mocked: true))
        let view = HeroSeriesRowView(series: MockTest().MockSerieRow)
                  
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen con ID 0. Si es NIL = error
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        //Text del error
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Betsy Braddock: Captain Britain (2023)")
        
        //Text del error
        let text2 = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        let texto2 = try text2.text().string()
        XCTAssertEqual(texto2, "THE CAPTAIN COMES HOME! And she's got a whole new mission! With Otherworld settled, Braddock Manor restored, and her brother Captain Avalon at her side, you'd think things look pretty good for Betsy Braddock. Only it turns out, good ole Britain doesn't want her back. No one wants a mutant menace carrying the shield of Captain Britain, and Betsy's made more than a few enemies along her way. Quest-less and country-less, Betsy must define a role for herself. A fresh take on a beloved character, don't miss the latest Tini Howard extravaganza and fan-favorite artist Vasco Georgiev's Marvel debut!") 
        
        
//        //button
//        let boton = try view.inspect().find(viewWithId: 2)
//        XCTAssertNotNil(boton)
//
//        //tap del boton
//        try boton.button().tap() //ejecuto el boton
        
        
        
    }
    
    
    

}
