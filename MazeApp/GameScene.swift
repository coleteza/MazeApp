//
//  GameScene.swift
//  MazeApp
//
//  Created by Cole Teza on 11/10/17.
//  Copyright © 2017 Cole Teza. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate? = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        endNode = self.childNode(withName: "endNode") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.01
        manager.startAccelerometerUpdates(to:OperationQueue.main){
           (data, error) in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!)*10, dy: CGFloat((data?.acceleration.y)!)*10)
        }
}
    //Object Contact Function
    func didBegin(_ contact: SKPhysicsContact) {
        //Vatiable Declaration
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        
        if bodyA.categoryBitMask==1 && bodyB.categoryBitMask==2 || bodyA.categoryBitMask==2 && bodyB.categoryBitMask==1 {
        
            print("You Win")
        }
    
        func update(_ currentTime: CFTimeInterval){
        
    }
}
}
