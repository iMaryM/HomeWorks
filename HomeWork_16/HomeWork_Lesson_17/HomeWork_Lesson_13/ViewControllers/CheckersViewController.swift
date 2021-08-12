//
//  CheckersViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

enum checker_color: Int {
    case white_checker = 0
    case black_checker = 1
}

class CheckersViewController: UIViewController {
    
    var checkerBoardBoarder = UIView()
    var checkerBoard = UIView()
    var arrayOfCheckerViews = [UIImageView]()
    var arrayOfCheckers = [UIImageView]()
    
    var timerLabel = UILabel()
    var timer: Timer = Timer()
    var second: Int = 0
    
    var currentCheckerView = UIImageView()
    var checker = UIImageView()
    
    var currentCheckerToMove: checker_color = .white_checker
    
    var cellsWithChecker: [CellWithChecker] = []
    
    //флаг для определения новая игра или сохраненная
    var isNewGame: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds

        if isNewGame {
            //удаление файла с сохраненной игрой
            let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
            try? FileManager.default.removeItem(at: fileURL)
            
            //удаление данных про сохраненный таймер
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.seconds.rawValue)
            
            drawNewCheckerBoard(screenSize: screenSize)
        } else {
            drawSavedCheckerBoard(screenSize: screenSize)
        }
        
        drawTimer(screenSize: screenSize)
        
        second = UserDefaults.standard.integer(forKey: KeyesUserDefaults.seconds.rawValue)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        timer.invalidate()
        presentAlertController(with: nil, message: "Do you want to save the game?", actionButtons: UIAlertAction(title: "Save", style: .default, handler: { _ in
            
            let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
            
            // записали время таймера (секунды) в файл
            UserDefaults.standard.setValue(self.second, forKey: KeyesUserDefaults.seconds.rawValue)
            
            //обнуляем массив (чтобы записывалось заново, а не дописывалось новое)
            self.cellsWithChecker.removeAll()
            
            //находим клеточки с шашками и записываем их в массив
            for value in self.checkerBoard.subviews {
                if !value.subviews.isEmpty {
                    for checker in value.subviews {
                        self.cellsWithChecker.append(CellWithChecker(positionX: value.frame.origin.x, positionY: value.frame.origin.y, colorOfChecker: checker.tag))
                    }
                }
            }
            
            //записать в файл массив клеточек с шашками
            let data = try? NSKeyedArchiver.archivedData(withRootObject: self.cellsWithChecker, requiringSecureCoding: true)
            try? data?.write(to: fileURL)
            
            self.navigationController?.popViewController(animated: true)
            self.timer.invalidate()
        }), UIAlertAction(title: "Don't save", style: .destructive, handler: { _ in
            
            //удаление файла игрой
            let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
            try? FileManager.default.removeItem(at: fileURL)
            
            //удаление данных про сохраненный таймер
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.seconds.rawValue)
            
            self.navigationController?.popViewController(animated: true)
            self.timer.invalidate()
        }))
    }
    
    @objc
    func tapGestureAction(_ sender: UILongPressGestureRecognizer) {
        guard let currentChecker = sender.view else { return } //определяем шашку которую двигаем
        switch sender.state {
        case .began:
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = currentChecker.transform.scaledBy(x: 1.2, y: 1.2)
            }
        case .ended:
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = .identity
            }
        default:
            break
        }
    }
    
    @objc
    func panGestureAction(_ sender: UIPanGestureRecognizer) {
        
        //проверяем цвет шашки
        guard let currentChecker = sender.view,
              currentChecker.tag == currentCheckerToMove.rawValue else {
            return
        }
        
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
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5) // сбрасываем позицию на 5;5 чтобы отцентрировать
            
            //проверяем является есть ли в клеточке в которую хотим поставить шашку другая шашка
            guard let newCheckerView = newCheckerView, newCheckerView.subviews.isEmpty,
                  let checker = sender.view else { return }
            
            newCheckerView.addSubview(checker) // добавляем шашку на новую клетку
            
            guard let currentChecker = sender.view else { return } //определяем шашку которую двигаем
            
            UIView.animate(withDuration: 0.3) {
                currentChecker.transform = .identity
            }
            
            currentCheckerToMove = currentCheckerToMove == .white_checker ? .black_checker : .white_checker
            
        default:
            break
        }
    }
    
    @objc
    func timerCounter () {
        
        second += 1
        let time = calculateTime(seconds: second)
        let timeString = convertToTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        var attrs: [NSAttributedString.Key : Any] = [   .font : UIFont(name: "StyleScript-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24),
                                                        .foregroundColor : UIColor(red: 84 / 255, green: 85 / 255, blue: 100 / 255, alpha: 1)
                                                    ]
        
        let attributedString = NSMutableAttributedString(string: timeString, attributes: attrs)
        attrs = [
            .foregroundColor : UIColor(red: 154 / 255, green: 189 / 255, blue: 203 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 0, length: 2))
        
        attrs = [
            .foregroundColor : UIColor(red: 84 / 255, green: 125 / 255, blue: 140 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 5, length: 2))
        
        attrs = [
            .foregroundColor : UIColor(red: 51 / 255, green: 69 / 255, blue: 80 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 10, length: 2))
        
        timerLabel.attributedText = attributedString
        
    }
    
    func drawNewCheckerBoard(screenSize: CGRect) {
        
        checkerBoardBoarder = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 12, height: screenSize.width - 12)))
        checkerBoardBoarder.center = view.center
        checkerBoardBoarder.layer.borderWidth = 9
        checkerBoardBoarder.layer.borderColor = UIColor(red: 188 / 255, green: 169 / 255, blue: 137 / 255, alpha: 1).cgColor
        view.addSubview(checkerBoardBoarder)
        
        checkerBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 32, height: screenSize.width - 32)))
        checkerBoard.center = view.center
        view.addSubview(checkerBoard)
        
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 1...8 {
            x = 0
            for j in 1...8 {
                currentCheckerView = UIImageView(frame: CGRect(x: x, y: y, width: widthOfCurrentView, height: heightOfCurrentView))
                currentCheckerView.image = UIImage(named: ((i + j) % 2 == 0) ? ("dark_3") : ("light_3"))
                currentCheckerView.tag = ((i + j) % 2 == 0) ? 0 : 1
                currentCheckerView.isUserInteractionEnabled = true
                
                checkerBoard.addSubview(currentCheckerView)
                arrayOfCheckerViews.append(currentCheckerView)
                
                if i < 4 || i > 5, currentCheckerView.tag == 0 {
                    checker = UIImageView(frame: CGRect(x: 5, y: 5, width: widthOfCurrentView - 10, height: heightOfCurrentView - 10))
                    checker.image = UIImage(named: i < 4 ? "white_checker" : "black_checker")
                    checker.tag = (i < 4) ? 0 : 1
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
    
    func drawSavedCheckerBoard(screenSize: CGRect) {
        
        //забираем данные из файла
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
        
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CellWithChecker] else { return }
        
        self.cellsWithChecker = object
        
        checkerBoardBoarder = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 12, height: screenSize.width - 12)))
        checkerBoardBoarder.center = view.center
        checkerBoardBoarder.layer.borderWidth = 9
        checkerBoardBoarder.layer.borderColor = UIColor(red: 188 / 255, green: 169 / 255, blue: 137 / 255, alpha: 1).cgColor
        view.addSubview(checkerBoardBoarder)
        
        checkerBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width - 32, height: screenSize.width - 32)))
        checkerBoard.center = view.center
        view.addSubview(checkerBoard)
        
        let widthOfCurrentView = checkerBoard.frame.width / 8
        let heightOfCurrentView = checkerBoard.frame.height / 8
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 1...8 {
            x = 0
            for j in 1...8 {
                currentCheckerView = UIImageView(frame: CGRect(x: x, y: y, width: widthOfCurrentView, height: heightOfCurrentView))
                currentCheckerView.image = UIImage(named: ((i + j) % 2 == 0) ? ("dark_3") : ("light_3"))
                currentCheckerView.tag = ((i + j) % 2 == 0) ? 0 : 1
                currentCheckerView.isUserInteractionEnabled = true
                
                checkerBoard.addSubview(currentCheckerView)
                arrayOfCheckerViews.append(currentCheckerView)
                
                for cell in cellsWithChecker {
                    if cell.positionX == currentCheckerView.frame.origin.x && cell.positionY == currentCheckerView.frame.origin.y {
                        
                        checker = UIImageView(frame: CGRect(x: 5, y: 5, width: widthOfCurrentView - 10, height: heightOfCurrentView - 10))
                        checker.tag = cell.colorOfChecker
                        checker.image = UIImage(named:(checker.tag == 0) ? "white_checker" : "black_checker")
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
                }
                x += widthOfCurrentView
            }
            y += heightOfCurrentView
        }
        
    }
    
    func drawTimer(screenSize: CGRect) {
        
        let timerViewHeight = ((screenSize.height / 2) - ((screenSize.width - 12) / 2) - 48 - (screenSize.height * 0.05))
        let timerOriginY = (48 + (0.05 * screenSize.height))
        
        let timerView = UIView(frame: CGRect(x: 6, y: timerOriginY, width: screenSize.width - 12, height: timerViewHeight))
        timerView.backgroundColor = .none
        view.addSubview(timerView)

        let timerString = "00 : 00 : 00"
        var attrs: [NSAttributedString.Key : Any] = [   .font : UIFont(name: "StyleScript-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24),
                                                        .foregroundColor : UIColor(red: 84 / 255, green: 85 / 255, blue: 100 / 255, alpha: 1)
                                                    ]
        
        let attributedString = NSMutableAttributedString(string: timerString, attributes: attrs)
        attrs = [
            .foregroundColor : UIColor(red: 154 / 255, green: 189 / 255, blue: 203 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 0, length: 2))
        
        attrs = [
            .foregroundColor : UIColor(red: 84 / 255, green: 125 / 255, blue: 140 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 5, length: 2))
        
        attrs = [
            .foregroundColor : UIColor(red: 51 / 255, green: 69 / 255, blue: 80 / 255, alpha: 1)]
        attributedString.addAttributes(attrs, range: _NSRange(location: 10, length: 2))
        
        timerLabel = UILabel(frame: CGRect(x: ((screenSize.width - 12) / 2), y: 0, width: ((screenSize.width - 12) / 2), height: timerViewHeight))
        timerLabel.attributedText = attributedString
        timerView.addSubview(timerLabel)
        
        let timerImage = UIImageView(frame: CGRect(x: ((timerView.frame.width / 2) - timerView.frame.height), y: timerView.frame.height / 4, width: timerView.frame.height, height: timerView.frame.height / 2))
        timerImage.image = UIImage(named: "timer")
        timerImage.contentMode = .scaleAspectFit
        timerView.addSubview(timerImage)
        
    }
    
    func calculateTime(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func convertToTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        
        timeString += hours < 10 ? "0\(hours)" : "\(hours)"
        timeString += " : "
        
        timeString += minutes < 10 ? "0\(minutes)" : "\(minutes)"
        timeString += " : "
        
        timeString += seconds < 10 ? "0\(seconds)" : "\(seconds)"
        
        return timeString
    }
    
}

extension CheckersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
