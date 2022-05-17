//
//  Swift_Clean_ArchitectureTests.swift
//  Swift-Clean_ArchitectureTests
//
//  Created by Kim dohyun on 2022/05/12.
//

import XCTest
@testable import Swift_Clean_Architecture

class Swift_Clean_ArchitectureTests: XCTestCase {
    var mainViewModel: MainViewModel!
    var mainUseCase: DefaultMainUseCase!
    var flowDI: AppFlowDI!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        self.mainViewModel = nil
        self.mainUseCase = nil
        self.flowDI = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        //given
        self.flowDI = ViewControllerDI()
        self.mainViewModel = flowDI.makeMainViewModel()
        
        let testEntities = [MainEntities(title: "MVP Pattern", pattern: "MVP", subTitle: "Presenter를 이용하며 View의 Life Cycle 영향을 받지 않는다"), MainEntities(title: "MVVM Pattern", pattern: "MVVM", subTitle: "ViewModel을 이용하여 View에 비즈니스 로직을 ViewModel이 감당하여 Massive한 부분을 조금더 줄여 줄수 있다.")]
        
        //when
        let testUseCase = mainViewModel.mainUseCase.execute(entities: testEntities)
        
        //then
        XCTAssertEqual(testUseCase, 2,"excute NumberOfRowInSection Error")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
