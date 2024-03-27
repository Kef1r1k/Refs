//
//  HowToPlayModel.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "Email", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Типы заданий", description: "В рефс находки могут быть 5 видов, каждое задание маркируется первой буквой и номером. Напрмер, S12 – форма номер 12", imageUrl: "HTP1", tag: 0),
        Page(name: "Попробуй угадать, что искал автор", description: "Подсказка находится в правом верхнем углу: это может быть s-форма, c-цвет, r-закономерность, f-шрифт, t-текстура", imageUrl: "HTP2", tag: 1),
        Page(name: "Найди что-то похожее и сфоткай", description: "Важно, чтобы твоя находка отвечала теме задания", imageUrl: "HTP3", tag: 2),
        Page(name: "загрузи свою находку в ответы", description: "Ты можешь ориентроваться на находки других, чтобы предположить, что искал автор", imageUrl: "HTP4", tag: 3),
        Page(name: "набирай лайки и получай ачивки", description: "Баллы приносит ежедневное участие заданиях и победы", imageUrl: "HTP5", tag: 4),
        Page(name: "становись первопроходем!", description: "У тебя есть возможность первым открыть задание! А потом апвоутить остальных как автор)", imageUrl: "HTP6", tag: 5),
    ]
}
