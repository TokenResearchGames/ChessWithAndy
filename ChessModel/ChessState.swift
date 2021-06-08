//
//  ChessLocation.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//
import GameKit
import Foundation


struct ChessState:Hashable
{
    let board:ChessBoard
    let meta:GameMeta
    
    static let classicGame = ChessState(board: ChessBoard.classicStart(), meta: GameMeta.startNormalGame)
    
    
    //this is the magic!
    public func analyize()->ChessBoardDetails{
        
        var blackKingLocation : Location?
        var whiteKingLocation : Location?
		
        var winner: Bool?
        //white pieces can move dict
        var whitePiecesCanMove = [Location:[Location]]()
        
        //black pieces can move dict
        var blackPiecesCanMove = [Location:[Location]]()
        
        //first 2ds are for the board, last D is for the list
        //this is only for taking, pawn movment that doesn't take will give bad answers
        var canTakeOnto = [[[Location]]]()
        //
        
        for (row, pieces) in board.enumerated(){
            for (col, piece) in pieces.enumerated(){
                
                let thisLocation = Location(row: row, column: col)
                
                var nextLocation = Location(row: 0, column: 0)
                
                switch piece {
                case .Empty:break
                

                
                //-------------------------------------------pawn below=--------------------------------------------------
                
                
                case .White_Pawn:
                    
                    whitePiecesCanMove[Location(row: row, column: col)] = []
                    whitePiecesCanMove[Location(row: row, column: col)]?.reserveCapacity(4)
                    
                    nextLocation = Location(row: row + 1, column: col)
                    
                    if(board[nextLocation.row][nextLocation.column] == .Empty){
                        
                        whitePiecesCanMove[thisLocation]!.append(nextLocation)
                        
                        if(row == 1){
                            nextLocation = Location(row: row + 2, column: col)
                            
                            if(board[nextLocation.row][nextLocation.column] == .Empty){
                                whitePiecesCanMove[thisLocation]!.append(nextLocation)
                            }
                        }
                    }
                    //to the left?
                    nextLocation = Location(row: row + 1, column: col + 1)
                    if(nextLocation.isValid()){
                        
                        canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                        
                        //less than zero means black
                        if( board[nextLocation.row][nextLocation.column].rawValue < 0){
                            whitePiecesCanMove[thisLocation]!.append(nextLocation)
                        }
                    }
                    //to the right?
                    nextLocation = Location(row: row + 1, column: col + 1)
                    if(nextLocation.isValid()){
                        
                        canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                        
                        //less than zero means black
                        if( board[nextLocation.row][nextLocation.column].rawValue < 0){
                            whitePiecesCanMove[thisLocation]!.append(nextLocation)
                        }
                    }
                    
                    
                case .Black_Pawn:
                    blackPiecesCanMove[Location(row: row, column: col)] = []
                    blackPiecesCanMove[Location(row: row, column: col)]?.reserveCapacity(4)
                    
                    nextLocation = Location(row: row - 1, column: col)
                    
                    if(board[nextLocation.row][nextLocation.column] == .Empty){
                        
                        blackPiecesCanMove[thisLocation]!.append(nextLocation)
                        
                        if(row == 7){
                            nextLocation = Location(row: row - 2, column: col)
                            
                            if(board[nextLocation.row][nextLocation.column] == .Empty){
                                blackPiecesCanMove[thisLocation]!.append(nextLocation)
                            }
                        }
                    }
                    //to the left?
                    nextLocation = Location(row: row - 1, column: col + 1)
                    if(nextLocation.isValid()){
                        
                        canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                        
                        // more zero means white
                        if( board[nextLocation.row][nextLocation.column].rawValue > 0){
                            blackPiecesCanMove[thisLocation]!.append(nextLocation)
                        }
                    }
                    //to the right?
                    nextLocation = Location(row: row - 1, column: col + 1)
                    if(nextLocation.isValid()){
                        
                        canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                        
                        // more zero means white
                        if( board[nextLocation.row][nextLocation.column].rawValue > 0){
                            blackPiecesCanMove[thisLocation]!.append(nextLocation)
                        }
                    }
   //-------------------------------------------pawn above--------------------------------------------------
                    
                
                
                
                
  //-------------------------------------------knight below--------------------------------------------------
                
                
                    
                case .White_Knight:
                    
                    whitePiecesCanMove[Location(row: row, column: col)] = []
                    whitePiecesCanMove[Location(row: row, column: col)]?.reserveCapacity(8)
                    
                    for(loc) in Location.knightHops{
                           
                        nextLocation = thisLocation + loc
                        
                        if(nextLocation.isValid()){
                            
                            canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                            
                            //less than one means that the space is either empty or black
                            if(board[nextLocation.row][nextLocation.column].rawValue < 1){
                                whitePiecesCanMove[thisLocation]!.append(nextLocation)
                            }
                        }
                    }
                    
                case .Black_Knight:
                    
                    blackPiecesCanMove[Location(row: row, column: col)] = []
                    for(loc) in Location.knightHops{
                           
                        nextLocation = thisLocation + loc
                        
                        if(nextLocation.isValid()){
                            
                            canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                            
                            //more than -1 means that the space is either empty or black
                            if(board[nextLocation.row][nextLocation.column].rawValue > -1){
                                blackPiecesCanMove[thisLocation]!.append(nextLocation)
                            }
                        }
                    }
                    
                //-------------------------------------------knight above--------------------------------------------------
                              
                     
                
                //-------------------------------------------bishop below--------------------------------------------------
                
                
                case .White_Bishop:
                    
                    whitePiecesCanMove[Location(row: row, column: col)] = []
                    
                    for (loc) in Location.bishopVectors{
                        
                     nextLocation = thisLocation + loc
                     
                     while(nextLocation.isValid()){
                         
                         canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                         
                         //less than one means that the space is either empty or black
                         if(board[nextLocation.row][nextLocation.column].rawValue < 1){
                             whitePiecesCanMove[thisLocation]!.append(nextLocation)
                         }
                     }
                 }
                     
                    
                case .Black_Bishop:
                    
                    blackPiecesCanMove[Location(row: row, column: col)] = []
                    for(loc) in Location.bishopVectors{
                           
                        nextLocation = thisLocation + loc
                        
                        if(nextLocation.isValid()){
                            
                            canTakeOnto[nextLocation.row][nextLocation.column].append(thisLocation)
                            
                            //more than -1 means that the space is either empty or white
							if(board[nextLocation.row][nextLocation.column].isWhite()){
                                blackPiecesCanMove[thisLocation]!.append(nextLocation)
                            }
                        }
                    }
                //-------------------------------------------bishop above--------------------------------------------------
                
                
                //-------------------------------------------rook below--------------------------------------------------
                
               
                
                //-------------------------------------------rook above--------------------------------------------------
                
                //-------------------------------------------queen below--------------------------------------------------
                
                
               
                
                //-------------------------------------------queen above--------------------------------------------------
                
                case .White_King: whiteKingLocation = thisLocation
                    
                case .Black_King: blackKingLocation = thisLocation
                    
                default: break
                }
              
            }
        }
       
        
        
        if(blackKingLocation != nil){
            //guarding a
          //  canTakeOnto[blackKingLocation!.row][blackKingLocation!.column] = canTakeOnto[blackKingLocation!.row][blackKingLocation!.column].f
        }else{
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        return ChessBoardDetails(piecesCanMoveTo: meta.whiteTurn ? whitePiecesCanMove : blackPiecesCanMove, piecesTakeOnto: canTakeOnto, check: false, winner: winner )
    }
    
    
    
}
