//
//  jakala_star_wars_projectTests.swift
//  jakala-star-wars-projectTests
//
//  Created by Noah Plützer on 10.09.24.
//

import XCTest
@testable import jakala_star_wars_project

final class jakala_star_wars_projectTests: XCTestCase {
    let diContainer = DependencyContainer(environment: .test)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPeopleFilterServiceNameFilterSingleValue() {
        // Given
        let filterService = diContainer.resolve(PeopleFilterService.self)
            
        let people1 = People(
            id: UUID(),
            name: "1 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "2 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "3 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "1")
            
        // Then
        let futureList = [
            people1,
        ]
            
        XCTAssertEqual(filteredList, futureList)
    }

    func testPeopleFilterServiceNameFilterMultiValue() {
        // Given
        let filterService = diContainer.resolve(PeopleFilterService.self)
            
        let people1 = People(
            id: UUID(),
            name: "1 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "11 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "3 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people4 = People(
            id: UUID(),
            name: "4 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
            people4,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "1")
            
        // Then
        let futureList = [
            people1,
            people2,
        ]
            
        XCTAssertEqual(filteredList, futureList)
    }

    func testPeopleFilterServiceNameFilterCasedLetters() {
        // Given
        let filterService = diContainer.resolve(PeopleFilterService.self)
            
        let people1 = People(
            id: UUID(),
            name: "aa People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "Aa People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "ab People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people4 = People(
            id: UUID(),
            name: "Ab People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
            people4,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "aa")
            
        // Then
        let futureList = [
            people1,
            people2,
        ]
            
        XCTAssertEqual(filteredList, futureList)
    }
        
    // MARK: PeopleFilterService Negatives
        
    func testNegativePeopleFilterServiceNameFilterSingleValue() {
        // Given
        let filterService = diContainer.resolve(PeopleFilterService.self)
            
        let people1 = People(
            id: UUID(),
            name: "1 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "2 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "3 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "1")
            
        // Then
        let futureList = [
            people2,
            people3,
        ]
            
        XCTAssertNotEqual(filteredList, futureList)
    }

    func testNegativePeopleFilterServiceNameFilterMultiValue() {
        // Given
        let filterService = PeopleFilterService()
       
        let people1 = People(
            id: UUID(),
            name: "1 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "11 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "2 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people4 = People(
            id: UUID(),
            name: "3 People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
            people4,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "1")
            
        // Then
        let futureList = [
            people3,
            people4,
        ]
            
        XCTAssertNotEqual(filteredList, futureList)
    }
        
    func testNegativePeopleFilterServiceNameFilterCasedLetters() {
        // Given
        let filterService = diContainer.resolve(PeopleFilterService.self)
            
        let people1 = People(
            id: UUID(),
            name: "aa People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people2 = People(
            id: UUID(),
            name: "Aa People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people3 = People(
            id: UUID(),
            name: "aA People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
        let people4 = People(
            id: UUID(),
            name: "AA People",
            height: 170,
            mass: 180,
            hairColor: "blond",
            skinColor: "light",
            eyeColor: "green",
            birthYear: "2001",
            gender: .male,
            homeworldURL: nil
        )
            
        let toFilterList = [
            people1,
            people2,
            people3,
            people4,
        ]
            
        // When
        let filteredList = filterService.filterPeopleBy(\.name, people: toFilterList, searchString: "a")
            
        // Then
        let futureList = [
            people3,
            people4,
        ]
            
        XCTAssertNotEqual(filteredList, futureList)
    }
}
