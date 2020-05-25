//
//  TransactionViewModel.swift
//  iOMG
//
//  Created by Tacenda on 5/25/20.
//  Copyright © 2020 Tacenda. All rights reserved.
//

import Foundation
class TransactionViewModel {
    let blknum: Int64
    let ethHeight: Int64
    let txCount: Int64
    let transactionQueue: OperationQueue
    
    private let currentLimit = 100
    private var currentPage = 1
    
    private var semaphore = DispatchSemaphore(value: 1)
    init(blknum: Int64, ethHeight: Int64, txCount: Int64) {
        self.blknum = blknum
        self.ethHeight = ethHeight
        self.txCount = txCount
        transactionQueue = OperationQueue()
        transactionQueue.qualityOfService = .background
        transactionQueue.maxConcurrentOperationCount = 1
        
        let initOp = TransactionDownloadOperation(blknum: self.blknum,
                                                  txcount: self.txCount,
                                                  page: currentPage,
                                                  limit: currentLimit,
                                                  invokeNext: self.invokeNext)
        transactionQueue.addOperation(initOp)
    }
    
    private func invokeNext(_ success: Bool) {
        semaphore.wait()
//        if success {
//            currentPage += 1
//           // let nextOp = BlockDownloadOperation(page: currentPage, limit: currentLimit, invokeNext: self.invokeNext)
//            //transactionQueue.addOperation(nextOp)
//        } else {
//            currentPage = 1
//        }
        semaphore.signal()
    }
}
