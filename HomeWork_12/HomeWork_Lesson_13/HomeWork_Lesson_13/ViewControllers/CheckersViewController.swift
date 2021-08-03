//
//  CheckersViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

class CheckersViewController: UIViewController {
    
    var checkerBoardBoarder = UIView()
    var checkerBoard = UIView()
    var arrayOfCheckerViews = [UIImageView]()
    var arrayOfCheckers = [UIImageView]()
    
    var timerLabel = UILabel()
    var timer: Timer = Timer()
    var count: Int = 0
    var isTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        let timerViewHeight = ((screenSize.height / 2) - ((screenSize.width - 12) / 2) - 48 - (screenSize.height * 0.05))
        let timerOriginY = (48 + (0.05 * screenSize.height))
        
        let timerView = UIView(frame: CGRect(x: 6, y: timerOriginY, width: screenSize.width - 12, height: timerViewHeight))
        timerView.backgroundColor = .none
        view.addSubview(timerView)

        timerLabel = UILabel(frame: CGRect(x: ((screenSize.width - 12) / 2), y: 0, width: ((screenSize.width - 12) / 2), height: timerViewHeight))
        timerLabel.text = "00 : 00 : 00"
        timerView.addSubview(timerLabel)
        
        let timerImage = UIImageView(frame: CGRect(x: ((timerView.frame.width / 2) - timerView.frame.height), y: timerView.frame.height / 4, width: timerView.frame.height, height: timerView.frame.height / 2))
        timerImage.image = UIImage(named: "timer")
        timerImage.contentMode = .scaleAspectFit
        timerView.addSubview(timerImage)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        
        checkerBoardBoarder = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 12, height: screenSize.width - 12)))
        checkerBoardBoarder.center = view.center
        checkerBoardBoarder.layer.borderWidth = 9
        checkerBoardBoarder.layer.borderColor = UIColor(red: 70 / 255, green: 61 / 255, blue: 63 / 255, alpha: 1).cgColor
        view.addSubview(checkerBoardBoarder)
        
        checkerBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 32, height: screenSize.width - 32)))
        checkerBoard.center = view.center
        view.addSubview(checkerBoard)
        
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var currentCheckerView = UIImageView()
        var checker = UIImageView()
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 1...8 {
            x = 0
            for j in 1...8 {
                currentCheckerView = UIImageView(frame: CGRect(x: x, y: y, width: widthOfCurrentView, height: heightOfCurrentView))
                currentCheckerView.image = UIImage(named: ((i + j) % 2 == 0) ? ("dark_wood") : ("light_wood"))
                currentCheckerView.tag = ((i + j) % 2 == 0) ? 0 : 1
                currentCheckerView.isUserInteractionEnabled = true
                
                checkerBoard.addSubview(currentCheckerView)
                arrayOfCheckerViews.append(currentCheckerView)
                
                if i < 4 || i > 5, currentCheckerView.tag == 0 {
                    checker = UIImageView(frame: CGRect(x: 0, y: 0, width: widthOfCurrentView, height: heightOfCurrentView))
                    checker.image = UIImage(named: i < 4 ? "checker_blue" : "checker_gray")
                    checker.isUserInteractionEnabled = true
                    currentCheckerView.addSubview(checker)
                    arrayOfCheckers.append(checker)
                    
                    let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
                    tapGesture.minimumPressDuration = 0.1
                    tapGesture.delegate = self
                    checker.addGestureRecognizer(tapGesture)
                    
                    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
                    checker.addGestureRecognizer(panGesture)
                }
                x += widthOfCurrentView
            }
            y += heightOfCurrentView
        }
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        timer.invalidate()
    }
    
    @objc
    func tapGestureAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .changed:
            guard !isTap else { return }
            isTap = true
            guard let currentChecker = sender.view else { return } //определяем шашку которую двигаем
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = currentChecker.transform.scaledBy(x: 1.2, y: 1.2)
            }
        case .ended:
            guard let currentChecker = sender.view else { return } //определяем шашку которую двигаем
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = .identity
            }
        default:
            break
        }
    }
    
    @objc
    func panGestureAction(_ sender: UIPanGestureRecognizer) {
        guard isTap else { return }

        let location = sender.location(in: checkerBoard)
        
        let translation = sender.translation(in: checkerBoard)
        
        switch sender.state {
        case .changed:
            guard let currentView = sender.view?.superview, //определяем клеточку на которой стоит шашка
                  let currentChecker = sender.view, //определяем шашку которую двигаем
                  let defaultOrigin = sender.view?.frame.origin else { //определяем координаты шашки которую будем двигать
                return
            }
            
            checkerBoard.bringSubviewToFront(currentView) //передвигаем клеточку на передний план
            currentChecker.frame.origin = CGPoint(x: defaultOrigin.x + translation.x, y: defaultOrigin.y + translation.y) //передвигаем шашку относительно точки с которой сдвигаем
            sender.setTranslation(.zero, in: checkerBoard) //сбрасываем translation, чтобы всегда сдвиг был с нуля
            
        case .ended:
            var newCheckerView: UIView? = nil //клеточка в которую хотим поставить шашку
            //проверяем является ли клетка в которую хотим поставить шашку черной
            for value in arrayOfCheckerViews {
                if value.frame.contains(location), value.tag == 0 {
                    newCheckerView = value
                }
            }

            sender.view?.frame.origin = CGPoint(x: 0, y: 0) // сбрасываем позицию на 5;5 чтобы отцентрировать
            
            //проверяем является есть ли в клеточке в которую хотим поставить шашку другая шашка
            guard let newCheckerView = newCheckerView, newCheckerView.subviews.isEmpty,
                  let checker = sender.view else { return }
            
            newCheckerView.addSubview(checker) // добавляем шашку на новую клетку
            
            guard let currentChecker = sender.view else { return } //определяем шашку которую двигаем
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = .identity
            }
        
            isTap = false
            
        default:
            break
        }
    }
    
    @objc
    func timerCounter () {
        count += 1
        let time = calculateTime(seconds: count)
        let timeString = convertToTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
        
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

extension CheckersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
