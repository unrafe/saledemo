//
//  SocketIOManager.swift
//  SaleDemo
//
//  Created by UnRafe on 22/1/2567 BE.
//  Copyright © 2567 BE Nuttawut. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager {
    
    static let shared = SocketIOManager()
    
    private let manager = SocketManager(
        socketURL: URL(string: "https://px-socket-emitter.saleherethailand.com/update")!
    )
    
    private var socket: SocketIOClient!
    
    init() {
        socket = manager.defaultSocket
    }
    
    func emit(message: [String: Any]){
        socket.emit("new-notification", with: [message], completion:nil)
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
