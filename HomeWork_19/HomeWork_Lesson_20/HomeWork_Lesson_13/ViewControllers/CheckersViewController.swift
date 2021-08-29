//
//  CheckersViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

class CheckersViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurNavigationBar: UIVisualEffectView!
    
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
    
    let screenSize = CGRect(origin: .zero, size: .zero)

    //флаг для определения новая игра или сохраненная
    var isNewGame: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
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
        
        second = SettingsManager.shared.savedTimer
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)

        guard let image = SettingsManager.shared.savedBackgroungOfCheckersView as? UIImage else {
            return
        }
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        timer.invalidate()
        presentAlertController(with: nil, message: "Do you want to save the game?", actionButtons: UIAlertAction(title: "Save", style: .default, handler: { _ in

            //создаем массив клеточек всех (с шашками и без)
            self.arrayOfCells = self.createCells(from: self.checkerBoard)
            
            //записываем время таймера (секунды) в UserDefaults
            SettingsManager.shared.savedTimer = self.second
            //записываем цвет шашки которая должна ходить в UserDefaults
            SettingsManager.shared.savedColorOfCheckerShouldBeMoved = self.currentCheckerToMove.rawValue
            
            //обнуляем массив (чтобы записывалось заново, а не дописывалось новое)
            self.cellsWithChecker.removeAll()
            
            //находим клеточки с шашками и записываем их в массив
            for cell in self.arrayOfCells {
                if cell.checker != nil {
                    self.cellsWithChecker.append(cell)
                }
            }
            
            //сохраняем в файл массив клеточек с шашками
            SettingsManager.shared.savedCellsWithCheckers = self.cellsWithChecker
            
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
        
        guard let currentView = sender.view?.superview, //определяем клеточку на которой стоит шашка
              let currentChecker = sender.view, //определяем шашку которую двигаем
              let defaultOrigin = sender.view?.frame.origin else { //определяем координаты шашки которую будем двигать
            return
        }
        
        let point1 = CGPoint(x: currentView.frame.origin.x + (checkerBoard.frame.width / 8), y: currentView.frame.origin.y + (checkerBoard.frame.height / 8))
        let point2 = CGPoint(x: currentView.frame.origin.x - (checkerBoard.frame.width / 8), y: currentView.frame.origin.y + (checkerBoard.frame.height / 8))
        let point3 = CGPoint(x: currentView.frame.origin.x + (checkerBoard.frame.width / 8), y: currentView.frame.origin.y - (checkerBoard.frame.height / 8))
        let point4 = CGPoint(x: currentView.frame.origin.x - (checkerBoard.frame.width / 8), y: currentView.frame.origin.y - (checkerBoard.frame.height / 8))

        
        switch sender.state {
        case .changed:
            checkerBoard.bringSubviewToFront(currentView) //передвигаем клеточку на передний план
            currentChecker.frame.origin = CGPoint(x: defaultOrigin.x + translation.x, y: defaultOrigin.y + translation.y) //передвигаем шашку относительно точки с которой сдвигаем
            sender.setTranslation(.zero, in: checkerBoard) //сбрасываем translation, чтобы всегда сдвиг был с нуля
        
        case .ended:
            var newCheckerView: UIView? = nil //клеточка в которую хотим поставить шашку
            
            //проверяем является ли клетка в которую хотим поставить шашку черной
            for value in arrayOfCellsViews {
                if value.frame.contains(location), value.tag == 0 {
                    if (value.frame.contains(point1) || value.frame.contains(point2)), currentChecker.tag == Checker_color.white_checker.rawValue {
                        newCheckerView = value
                    }
                    if (value.frame.contains(point3) || value.frame.contains(point4)),currentChecker.tag == Checker_color.black_checker.rawValue {
                        newCheckerView = value
                    }
                }
            }
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5) // сбрасываем позицию на 5;5 чтобы отцентрировать

            //проверяем является есть ли в клеточке в которую хотим поставить шашку другая шашка
            guard let newCheckerView = newCheckerView, newCheckerView.subviews.isEmpty,
                  let checker = sender.view else {
                return }

            newCheckerView.addSubview(checker) // добавляем шашку на новую клетку

            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
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
        
        arrayOfCellsViews = drawCell(checkerBoard: checkerBoard)
        
        arrayOfCheckersView = drawChecker(checkerBoard: checkerBoard)
        
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
        self.cellsWithChecker = SettingsManager.shared.savedCellsWithCheckers

        //отрисовка доски
        checkerBoard = drawCheckerboard(screenSize: screenSize)
        view.addSubview(checkerBoard)
        
        arrayOfCellsViews = drawCell(checkerBoard: checkerBoard)
        
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
    
    //создание массива клеточек всех (с шашками и без)
    func createCells(from checkerboard: UIView) -> [Cell] {
        
        var newCell = Cell()
        
        for cell in checkerboard.subviews {
            if !cell.subviews.isEmpty {
                newCell = Cell(position: cell.frame.origin, image: cell.largeContentImage, color: cell.tag)
                
                guard let color = cell.subviews.first?.tag else {
                    return []
                }
                if color == Checker_color.white_checker.rawValue {
                    newCell.addChecker(checker: Checker(imageName: (SettingsManager.shared.savedWhiteChecker)!, color: color))
                } else {
                    newCell.addChecker(checker: Checker(imageName: (SettingsManager.shared.savedBlackChecker)!, color: color))
                }
                
                arrayOfCells.append(newCell)
            } else {
                arrayOfCells.append(Cell(position: cell.frame.origin, image: cell.largeContentImage, color: cell.tag))
            }
        }
        
        return arrayOfCells
        
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
