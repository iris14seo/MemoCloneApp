//
//  MemoDetailInteractorTests.swift
//  MemoCloneAppTests
//
//  Created by MUN JEONG SEO on 2021/03/07.
//

@testable import MemoCloneApp
import XCTest

class MemoDetailInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: MemoDetailInteractor!
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupMemoDetailInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    func setupMemoDetailInteractor() {
        sut = MemoDetailInteractor()
    }
    
    // MARK: - Test doubles
    class MemoDetailPresentationLogicSpy: MemoDetailPresentationLogic {
        
        // MARK: Method call expectations
        var presentFetchDataCalled = false
        var presentSaveCalled = false
        
        // MARK: Spied methods
        func presentFetchData(response: MemoDetail.데이터_패치.Response) {
            presentFetchDataCalled = true
        }
        
        func presentSave(response: MemoDetail.저장.Response) {
            presentSaveCalled = true
        }
    }
    
    class MemoDetailWorkerSpy: MemoDetailWorker {
        
        // MARK: Method call expectations
        var saveMemoCalled = false
        
        // MARK: Spied methods
        override func saveMemo(uid: String?, memoData: MemoDetail.WrittenMemoData?, key: String?, completionHandler: @escaping (String?, CustomError?) -> Void) {
            saveMemoCalled = true
            completionHandler(Seeds.Keys.keyOne, nil)
        }
        
    }
    
    // MARK: - Tests
    func testFetchMemoDataShouldAskPresenterToFormatResult() {
        // Given
        let memoDetailPresentationLogicSpy = MemoDetailPresentationLogicSpy()
        sut.presenter = memoDetailPresentationLogicSpy
        sut.memoData = Seeds.MemoDatas.memoOne
        
        // When
        sut.fetchMemoData()
        
        // Then
        XCTAssert(memoDetailPresentationLogicSpy.presentFetchDataCalled, "FetchMemoData() should ask presenter to format the memo data")
    }
    
    func testRequestSaveMemoDataShouldAskWorkerToSaveMemoAndPresenterToFormatResult() {
        // Given
        let memoDetailPresentationLogicSpy = MemoDetailPresentationLogicSpy()
        sut.presenter = memoDetailPresentationLogicSpy
        sut.uid = Seeds.Uid.uid1
        sut.memoData = Seeds.MemoDatas.memoOne
        let memoDatailWorkerSpy = MemoDetailWorkerSpy()
        sut.worker = memoDatailWorkerSpy
        
        
        // When
        let request = MemoDetail.저장.Request(memoData: Seeds.WrittenMemoData.writtenMemoOne)
        sut.requestSaveMemoData(request: request)

        // Then
        XCTAssert(memoDatailWorkerSpy.saveMemoCalled,"SaveMemo() should ask MemoDetailWorker to save memo")
        XCTAssert(memoDetailPresentationLogicSpy.presentSaveCalled, "RequestSaveMemoData() should ask presenter to format the memo data")
    }
}
