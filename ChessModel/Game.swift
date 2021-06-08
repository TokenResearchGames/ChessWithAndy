//
//  Game.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation

class Game{
    let startState:ChessState
 
    let whitePlayer: Player
    
    let blackPlayer: Player
    
    private var history:[Move]
   
    
    var currentState:ChessState
    
    init (start:ChessState, whitePlayer:Player, blackPlayer:Player){
        
        self.startState = start
        
        currentState = start
        
        self.whitePlayer = whitePlayer
        self.blackPlayer = blackPlayer
        
        history = []
    }
    
    public func getHistory()->[Move]{
        return history.map{$0}
    }
    

}
