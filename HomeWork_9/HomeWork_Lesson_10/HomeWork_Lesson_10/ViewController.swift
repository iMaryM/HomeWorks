//
//  ViewController.swift
//  HomeWork_Lesson_10
//
//  Created by Мария Манжос on 15.07.21.
//

import UIKit

class ViewController: UIViewController {

//доска для шашек
    var checkersDesk: UIView = UIView()
//одна клеточка
    var currentViewFromChekersDesk: UIView = UIView()
//массив всех клеточек
    var arrayOfCurrentViewFromChekersDesk = [UIView]()

//шашка
    var currentChecker = UIView()
//массив шашек
    var arrayOfCheckers = [UIView]()
    
    var currentCheckerT = UIView()
    var currentCheckerTNew: UIView? = nil
    var currentViewFromChekersDeskT = UIView()
    var currentViewFromCheckerNew = UIView()
    var defaultOtigin: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 150 / 255, green: 160 / 255, blue: 170 / 255, alpha: 1.0)
        
        checkersDesk = UIView(frame: CGRect(x: 50, y: 100, width: 240, height: 240))
        view.addSubview(checkersDesk)
        
        //добавление клеточек и шашек на вью доски
        var y = 0
        for i in 1...8 {
            var x = 0
            for j in 1...8 {
                
                currentViewFromChekersDesk = UIView(frame: CGRect(x: x, y: y, width: 30, height: 30))
                
                if (i + j) % 2 == 0 {
                    currentViewFromChekersDesk.backgroundColor = .black
                } else {
                    currentViewFromChekersDesk.backgroundColor = .white
                }
                
                checkersDesk.addSubview(currentViewFromChekersDesk)
                arrayOfCurrentViewFromChekersDesk.append(currentViewFromChekersDesk)
                
                if currentViewFromChekersDesk.backgroundColor == .black {
                    if (i == 4 || i == 5) {
                        x += 30
                        continue
                    } else {
                            currentChecker = UIView(frame: CGRect(x: x + 5, y: y + 5, width: 20, height: 20))
                            currentChecker.layer.cornerRadius = 10
                            currentChecker.layer.masksToBounds = true
                            currentChecker.backgroundColor = .lightGray
                        
                            checkersDesk.addSubview(currentChecker)
                            arrayOfCheckers.append(currentChecker)
                        }
                    }
                x += 30
                }
            y += 30
            }
        
        //добавления жеста для шашки
        for value in arrayOfCheckers {
            let panGeasture = UIPanGestureRecognizer(target: self, action: #selector(panGeastureRecognizer))
            value.addGestureRecognizer(panGeasture)
        }
    }
    
        @objc
        func panGeastureRecognizer(_ sender: UIPanGestureRecognizer) {

            // точка на которую я сделала нажатие на доске по оси координат
            var location = sender.location(in: checkersDesk)
            print("location - \(location)")
            
            // точка на которую я сместила относительно нажатой точке
            let translation = sender.translation(in: checkersDesk)
            print("translation - \(translation)")

            switch sender.state {
            case .began:
                print("began")
                //находим клеточку в которой было нажатие
                for value in arrayOfCurrentViewFromChekersDesk {
                    if value.frame.contains(location) {
                        //записываем клеточку в переменную
                        currentViewFromChekersDeskT = value //currentViewFromChekersDeskT - содержит клеточку в которой было нажатие
                    }
                }
                
                //находим шашку в этой клеточке
                for value in arrayOfCheckers {
                    if value.frame.contains(location) {
                        //определить какую именно шашку мы выбрали нажатием - записать в переменную
                        currentCheckerT = value //currentCheckerT - шашка которую будем двигать
                        defaultOtigin = currentCheckerT.frame.origin
                        break
                        }
                    }
                
            case .changed:
                print("changed")
                
                checkersDesk.bringSubviewToFront(currentCheckerT)
                currentCheckerT.center = sender.location(in: checkersDesk)

            case .ended:
                print("ended")
                //записали клеточку на которую передвинули шашку
                for value in arrayOfCurrentViewFromChekersDesk {
                    if value.frame.contains(location) {
                        currentViewFromCheckerNew = value //currentViewFromCheckerNew - клеточка в которую хотим стать
                    }
                }

                //находим шашку в новой клеточке
                for value in arrayOfCheckers {
                    if currentViewFromCheckerNew.frame.contains(value.frame.origin) {
                        currentCheckerTNew = value //currentCheckerTNew - шашка которая расположена в новой клеточке
                        }
                    }
                
                // проверяем цвет клеточки
                // если клеточка черная то ставим шашку в центр клеточки
                if currentViewFromCheckerNew.backgroundColor == .black {
                    
                    //если в новой клеточке есть шашка, то ставим в центр новой клеточки
                    if currentCheckerTNew == nil || currentCheckerTNew == currentCheckerT {
                        currentCheckerT.center = currentViewFromCheckerNew.center
                        checkersDesk.bringSubviewToFront(currentCheckerT)
                        //currentViewFromChekersDeskT = currentViewFromCheckerNew
                    } else {
                        currentCheckerT.frame.origin = defaultOtigin
                    }
                } else {
                    //если клеточка белая возвращаем в то же места что и была
                    currentCheckerT.frame.origin = defaultOtigin
                }
            default:
                break
            }
        }
}



