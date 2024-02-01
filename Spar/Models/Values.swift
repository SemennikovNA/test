//
//  Values.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import Foundation

struct Values {
    
    // Tab bar title's and image named
    //Main view controller
    var mainTitle = "Главная"
    let mainNormalImage = "list.bullet.clipboard"
    let mainSelectedImage = "list.clipboard.fill"
    
    // Catalog view controller
    let catalogTitle = "Каталог"
    let catalogNormalImage = "greetingcard"
    let catalogSelectedImage = "greetingcard.fill"
    
    // Basket view controller
    let basketTitle = "Корзина"
    let basketNormalImage = "cart"
    let basketSelectedImage = "cart.fill"
    
    // Profile view controller
    let profileTitle = "Профиль"
    let profileNormalImage = "person"
    let profileSelectedImage = "person.fill"
    
    // Product view titles
    let productName = "Добавка \"Липа\" к чаю 200 г"
    let manufacturerСountry = "Испания, Риоха"
    let description = "Описание"
    let descriptionInfo = "Флавоноиды липового цвета обладают противовосполительным действием, способствуют укреплению стенки сосудов"
    let mainCharacteristicsTitle = "Основные характеристики"
    let manufacturedLabelTitle = "Производство..........................Россия, Краснодарский край"
    let energyPriceLabelTitle = "Энергетическая ценность, ккал/100 г........25 ккал, 105 кДж"
    let fatsLabelTitle = "Жиры/100 г........................................................................0,1 г"
    let proteinLabelTitle = "Белки/100 г........................................................................1,3 г"
    let carbohydratesLabelTitle = "Углеводы/100 г..................................................................3,3 г"
    let allCharacteristicsButtonTitle = "Все характеристики"
    
    // Reviews text
    let reviews = [
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!"),
        ReviewModel(name: "Александр В.", date: "7 мая 2021", review: "Хорошая добавка, мне очень понравилась! Хочу, что бы все добавки были такими!")
    ]
    
    // Reviews collettion title's
    let headerTitleText = "Отзывы"
    let addedReview = "Оставить отзыв"
    let headerButtonTitle = "Все 152"
    
    // Price view value
    var countOfProduct = 1
    var productPrice = 120
}
