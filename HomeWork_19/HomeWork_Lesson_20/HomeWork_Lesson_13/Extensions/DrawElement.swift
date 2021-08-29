//
//  DrawElement.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 18.08.21.
//

import UIKit

extension CheckersViewController {
    
    func drawCheckerboard(screenSize: CGRect) -> UIView {
        
        //отрисовка рамочки для доски
        let checkerBoardBoarder = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 12, height: screenSize.width - 12)))
        checkerBoardBoarder.center = view.center
        checkerBoardBoarder.layer.borderWidth = 9
        checkerBoardBoarder.layer.borderColor = UIColor(red: 188 / 255, green: 169 / 255, blue: 137 / 255, alpha: 1).cgColor
        view.addSubview(checkerBoardBoarder)
        
        //отрисовка доски без клеточек
        let checkerBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 32, height: screenSize.width - 32)))
        checkerBoard.center = view.center
        
        return checkerBoard
        
    }
    
    func drawCell(screenSize: CGRect, checkerBoard: UIView) -> [UIImageView] {
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var cellView = UIImageView()
        var arrayOfCellsViews = [UIImageView]()
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 1...8 {
            x = 0
            for j in 1...8 {
                //отрисовка клеточки
                cellView = UIImageView(frame: CGRect(x: x, y: y, width: widthOfCurrentView, height: heightOfCurrentView))
                cellView.image = UIImage(named: ((i + j) % 2 == 0) ? ("dark_3") : ("light_3"))
                cellView.tag = ((i + j) % 2 == 0) ? 0 : 1
                cellView.isUserInteractionEnabled = true
                
                checkerBoard.addSubview(cellView)
                arrayOfCellsViews.append(cellView)
                
                x += widthOfCurrentView
            }
            y += heightOfCurrentView
        }
        return arrayOfCellsViews
    }
    
    func drawChecker(screenSize: CGRect, checkerBoard: UIView) -> [UIImageView]{
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var checkerView = UIImageView()
        var arrayOfCheckersView = [UIImageView]()
        
        for (index,value) in checkerBoard.subviews.enumerated(){
            if index < 23 || index > 39, value.tag == 0 {
                checkerView = UIImageView(frame: CGRect(x: 5, y: 5, width: widthOfCurrentView - 10, height: heightOfCurrentView - 10))
                checkerView.image = UIImage(named: index < 23 ? (SettingsManager.shared.savedWhiteChecker)! : (SettingsManager.shared.savedBlackChecker)!)
                checkerView.tag = (index < 23) ? 0 : 1
                checkerView.isUserInteractionEnabled = true
                
                value.addSubview(checkerView)
                arrayOfCheckersView.append(checkerView)
            }
        }
        return arrayOfCheckersView
    }
    
    func drawCheckerFromFile(screenSize: CGRect, checkerBoard: UIView, cellWithCheckers: [Cell]) -> [UIImageView] {
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var checkerView = UIImageView()
        var arrayOfCheckersView = [UIImageView]()
        
        for cellWithChecker in cellWithCheckers {
            for cell in checkerBoard.subviews {
                
                if cellWithChecker.position == cell.frame.origin {
                    
                    guard let checkerInCell = cellWithChecker.checker else {
                        return []
                    }
                    
                    checkerView = UIImageView(frame: CGRect(x: 5, y: 5, width: widthOfCurrentView - 10, height: heightOfCurrentView - 10))
                    checkerView.tag = checkerInCell.color.rawValue
                    checkerView.image = UIImage(named:(checkerInCell.color.rawValue == 0) ? (SettingsManager.shared.savedWhiteChecker)! : (SettingsManager.shared.savedBlackChecker)!)
                    checkerView.isUserInteractionEnabled = true
                    
                    cell.addSubview(checkerView)
                    arrayOfCheckersView.append(checkerView)
                }
            }
        }
        return arrayOfCheckersView
    }
    
    func drawTimer(screenSize: CGRect, timerLabel: inout UILabel) {
        let timerViewHeight = ((screenSize.height / 2) - ((screenSize.width - 12) / 2) - 48 - (screenSize.height * 0.05))
        let timerOriginY = (48 + (0.05 * screenSize.height))
        
        let timerView = UIView(frame: CGRect(x: 6, y: timerOriginY, width: screenSize.width - 12, height: timerViewHeight))
        timerView.backgroundColor = .none
        view.addSubview(timerView)

        let timerString = "00 : 00 : 00"
        
        timerLabel = UILabel(frame: CGRect(x: ((screenSize.width - 12) / 2), y: 0, width: ((screenSize.width - 12) / 2), height: timerViewHeight))
        timerLabel.attributedText = addAtributedTextForTimer(for: timerString)
        timerView.addSubview(timerLabel)
        
        let timerImage = UIImageView(frame: CGRect(x: ((timerView.frame.width / 2) - timerView.frame.height), y: timerView.frame.height / 4, width: timerView.frame.height, height: timerView.frame.height / 2))
        timerImage.image = UIImage(named: "timer")
        timerImage.contentMode = .scaleAspectFit
        timerView.addSubview(timerImage)
    }
    
}
