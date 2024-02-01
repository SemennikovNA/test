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
    var productName = "Добавка \"Липа\" к чаю 200 г"
    var manufacturerСountry = "Испания, Риоха"
    var description = "Описание"
    var descriptionInfo = "Флавоноиды липового цвета обладают противовосполительным действием, способствуют укреплению стенки сосудов"
    
    var mainCharacteristicsTitle = "Основные характеристики"
    var manufacturedLabelTitle = "Производство..........................Россия, Краснодарский край"
    var energyPriceLabelTitle = "Энергетическая ценность, ккал/100 г........25 ккал, 105 кДж"
    var fatsLabelTitle = "Жиры/100 г........................................................................0,1 г"
    var proteinLabelTitle = "Белки/100 г........................................................................1,3 г"
    var carbohydratesLabelTitle = "Углеводы/100 г..................................................................3,3 г"
    
    var allCharacteristicsButtonTitle = "Все характеристики"
    
    var reviews = [
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!")
    ]
    
    var headerTitleText = "Отзывы"
    var addedReview = "Оставить отзыв"
    var headerButtonTitle = "Все 152"
}
