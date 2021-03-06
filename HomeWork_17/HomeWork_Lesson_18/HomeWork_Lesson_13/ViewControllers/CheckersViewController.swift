//
//  CheckersViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

class CheckersViewController: UIViewController {

    var checkerBoard = UIView()
    
    var cell: Cell = Cell()
    var arrayOfCells: [Cell] = []
    var cellsWithChecker: [Cell] = []
    
    var arrayOfCellsViews = [UIImageView]()
    
    var checker = Checker()
    var arrayOfCheckers: [Checker] = []
    
    var arrayOfCheckersView = [UIImageView]()
    
    var timerLabel = UILabel()
    var timer: Timer = Timer()
    var second: Int = 0
    
    var currentCheckerToMove: Checker_color = .white_checker
    
    let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    //флаг для определения новая игра или сохраненная
    var isNewGame: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        if isNewGame {
            //удаление файла с сохраненной игрой
            deleteFile()
            
            //удаление данных про сохраненный таймер
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.seconds.rawValue)
            //удаление данных про цвет шашки которая должна ходить
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.movedChecker.rawValue)
            
            //отрисовка новой доски
            drawNewCheckerBoard(screenSize: screenSize)

        } else {
            drawSavedCheckerBoard(screenSize: screenSize)
        }
        
        drawTimer(screenSize: screenSize, timerLabel: &timerLabel)
        
        second = UserDefaults.standard.integer(forKey: KeyesUserDefaults.seconds.rawValue)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        timer.invalidate()
        presentAlertController(with: nil, message: "Do you want to save the game?", actionButtons: UIAlertAction(title: "Save", style: .default, handler: { _ in

            //создаем массив клеточек всех (с шашками и без)
            self.arrayOfCells = self.createCells(from: self.checkerBoard)
            
            //записываем время таймера (секунды) в UserDefaults
            self.saveUserDefaults(value: self.second, forKey: KeyesUserDefaults.seconds.rawValue)
            //записываем цвет шашки которая должна ходить в UserDefaults
            self.saveUserDefaults(value: self.currentCheckerToMove.rawValue, forKey: KeyesUserDefaults.movedChecker.rawValue)
            
            //обнуляем массив (чтобы записывалось заново, а не дописывалось новое)
            self.cellsWithChecker.removeAll()
            
            //находим клеточки с шашками и записываем их в массив
            for cell in self.arrayOfCells {
                if cell.checker != nil {
                    self.cellsWithChecker.append(cell)
                }
            }
            
            //сохраняем в файл массив клеточек с шашками
            self.saveToFile()
            
            self.navigationController?.popViewController(animated: true)
            self.timer.invalidate()
        }), UIAlertAction(title: "Don't save", style: .destructive, handler: { _ in
        
            //удаляем файл с игрой
            self.deleteFile()
            
            //удаление данных про сохраненный таймер
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.seconds.rawValue)
            //удаление данных про цвет шашки которая должна ходить
            UserDefaults.standard.removeObject(forKey: KeyesUserDefaults.movedChecker.rawValue)
            
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
            for value in arrayOfCellsViews {
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
        
        timerLabel.attributedText = addAtributedTextForTimer(for: timeString)
    }
    
    func drawNewCheckerBoard(screenSize: CGRect) {
        
        //отрисовка доски
        checkerBoard = drawCheckerboard(screenSize: screenSize)
        view.addSubview(checkerBoard)
        
        arrayOfCellsViews = drawCell(screenSize: screenSize, checkerBoard: checkerBoard)
        
        arrayOfCheckersView = drawChecker(screenSize: screenSize, checkerBoard: checkerBoard)
        
        for value in arrayOfCheckersView {
            let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
            tapGesture.minimumPressDuration = 0.1
            tapGesture.delegate = self
            value.addGestureRecognizer(tapGesture)
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
            value.addGestureRecognizer(panGesture)
        }
        
    }
    
    func drawSavedCheckerBoard(screenSize: CGRect) {

        //забираем данные из файла
        getFromFile()

        //отрисовка доски
        checkerBoard = drawCheckerboard(screenSize: screenSize)
        view.addSubview(checkerBoard)
        
        arrayOfCellsViews = drawCell(screenSize: screenSize, checkerBoard: checkerBoard)
        
        arrayOfCheckersView = drawCheckerFromFile(screenSize: screenSize, checkerBoard: checkerBoard, cellWithCheckers: cellsWithChecker)
        
        for value in arrayOfCheckersView {
            let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
            tapGesture.minimumPressDuration = 0.1
            tapGesture.delegate = self
            value.addGestureRecognizer(tapGesture)
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
            value.addGestureRecognizer(panGesture)
        }

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
    
    func saveUserDefaults(value: Any?, forKey: String) {
        UserDefaults.standard.setValue(value, forKey: forKey)
    }
    
    func createCells(from checkerboard: UIView) -> [Cell] {
        
        var newCell = Cell()
        
        for cell in checkerboard.subviews {
            if !cell.subviews.isEmpty {
                newCell = Cell(position: cell.frame.origin, image: cell.largeContentImage, color: cell.tag)
                
                guard let color = cell.subviews.first?.tag else {
                    return []
                }
                if color == Checker_color.white_checker.rawValue {
                    newCell.addChecker(checker: Checker(imageName: "Checker_white_1", color: color))
                } else {
                    newCell.addChecker(checker: Checker(imageName: "Checker_black_1", color: color))
                }
                
                arrayOfCells.append(newCell)
            } else {
                arrayOfCells.append(Cell(position: cell.frame.origin, image: cell.largeContentImage, color: cell.tag))
            }
        }
        
        return arrayOfCells
        
    }
    
    func saveToFile() {
        let fileURL = self.documentDirectoryURL.appendingPathComponent("savedGame")
        //записать в файл массив клеточек с шашками
        let data = try? NSKeyedArchiver.archivedData(withRootObject: self.cellsWithChecker, requiringSecureCoding: true)
        try? data?.write(to: fileURL)
    }
    
    func getFromFile() {
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")

        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Cell] else { return }

        self.cellsWithChecker = object
    }
    
    func deleteFile() {
        //удаление файла игрой
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
        try? FileManager.default.removeItem(at: fileURL)
    }
    
    
}

extension CheckersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
