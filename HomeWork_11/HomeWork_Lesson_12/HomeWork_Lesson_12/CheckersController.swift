//
//  CheckersController.swift
//  HomeWork_Lesson_12
//
//  Created by Мария Манжос on 23.07.21.
//

import UIKit

class CheckersController: UIViewController {

    @IBOutlet weak var checkersBoard: UIView!
    @IBOutlet weak var labelTimer: UILabel!
    
    var arrayOfCheckerViews = [UIView]()
    var arrayOfCheckers = [UIImageView]()
    
    var timer: Timer = Timer()
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentCheckerView = UIView()
        var checker = UIImageView()
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer, forMode: .common)
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        let checkerBoargWidth = checkersBoard.frame.width
        let checkerBoardHeight = checkersBoard.frame.height
        
        for i in 1...8 {
            x = 0
            for j in 1...8 {
                currentCheckerView = UIView(frame: CGRect(x: x, y: y, width: checkerBoargWidth / 8, height: checkerBoardHeight / 8))
                currentCheckerView.backgroundColor = ((i + j) % 2 == 0) ? .black : .white
                
                checkersBoard.addSubview(currentCheckerView)
                arrayOfCheckerViews.append(currentCheckerView)
                
                if i < 4 || i > 5, currentCheckerView.backgroundColor == .black {
                    checker = UIImageView(frame: CGRect(x: 5, y: 5, width: checkerBoargWidth / 8 - 10, height: checkerBoardHeight / 8 - 10))
                    checker.image = UIImage(named: i < 4 ? "checker_Tom" : "checker_Jerry")
                    checker.isUserInteractionEnabled = true
                    currentCheckerView.addSubview(checker)
                    arrayOfCheckers.append(checker)
                    
                    let panGeasture = UIPanGestureRecognizer(target: self, action: #selector(panGeastureAction(_:)))
                    checker.addGestureRecognizer(panGeasture)
                }
                x += checkerBoargWidth / 8
            }
            y += checkerBoardHeight / 8
        }
    }
    
    @objc
    func panGeastureAction(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: checkersBoard)
        
        let translation = sender.translation(in: checkersBoard)
        
        switch sender.state {
        case .changed:
            guard let currentView = sender.view?.superview, //определяем клеточку на которой стоит шашка
                  let currentChecker = sender.view, //определяем шашку которую двигаем
                  let defaultOrigin = sender.view?.frame.origin else { //определяем координаты шашки которую будем двигать
                return
            }
            
            checkersBoard.bringSubviewToFront(currentView) //передвигаем клеточку на передний план
            currentChecker.frame.origin = CGPoint(x: defaultOrigin.x + translation.x, y: defaultOrigin.y + translation.y) //передвигаем шашку относительно точки с которой сдвигаем
            sender.setTranslation(.zero, in: checkersBoard) //сбрасываем translation, чтобы всегда сдвиг был с нуля
            
        case .ended:
            var newCheckerView: UIView? = nil //клеточка в которую хотим поставить шашку
            //проверяем является ли клетка в которую хотим поставить шашку черной
            for value in arrayOfCheckerViews {
                if value.frame.contains(location), value.backgroundColor == .black {
                    newCheckerView = value
                }
            }

            sender.view?.frame.origin = CGPoint(x: 5, y: 5) // сбрасываем позицию на 5;5 чтобы отцентрировать
            
            //проверяем является есть ли в клеточке в которую хотим поставить шашку другая шашка
            guard let newCheckerView = newCheckerView, newCheckerView.subviews.isEmpty,
                  let checker = sender.view else { return }
            
            newCheckerView.addSubview(checker) // добавляем шашку на новую клетку
            
        default:
            break
        }
    }

    @IBAction func goToRootController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        timer.invalidate()
    }
    
    @objc
    func timerCounter () {
        count += 1
        let time = calculateTime(seconds: count)
        let timeString = convertToTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        labelTimer.text = timeString
        
    }
    
    func calculateTime (seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func convertToTimeString (hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += "\(hours)"
        timeString += " : "
        timeString += "\(minutes)"
        timeString += " : "
        timeString += "\(seconds)"
        return timeString
    }
    
}
