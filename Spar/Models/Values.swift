//
//  Values.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import Foundation

struct Values {
    
    var countOfProduct = 1
    var productPrice = 120
    var productName = "Добавка 'Липа' к чаю 200 г"
    var manufacturerСountry = "Испания, Риоха"
    var description = "Описание"
    var descriptionInfo = "Флавоноиды липового цвета обладают противовосполительным действием, способствуют укреплению стенки сосудов"
    
    var reviews = [
        ReviewModel(name: "Александр Н.", date: "01.04.2022", starCount: 0, review: "Все нравится, покупаем постоянно с ней чай еще вкуснее"),
        ReviewModel(name: "Виталий Г.", date: "01.03.2022", starCount: 0, review: "Хорошая добавка беру не первый раз, все нравится"),
        ReviewModel(name: "Наталья У.", date: "01.02.2022", starCount: 0, review: "Не понравилась, странный вкус когда завариваешь чай, деньги на ветер 😢"),
        ReviewModel(name: "Надежда Н.", date: "01.01.2022", starCount: 0, review: "Наталья не нравится не берите, мы берем всегда только добавку липу, оздоровительный эффект"),
        ReviewModel(name: "Никита С.", date: "01.12.2021", starCount: 0, review: "Все отлично👍🏽")
    ]
    
    var headerTitleText = "Отзывы"
    var addedReview = "Оставить отзыв"
    var headerButtonTitle: String {
        return "Все \(reviews.count)"
    }
}
