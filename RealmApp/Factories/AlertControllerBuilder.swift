//
//  AlertControllerBuilder.swift
//  RealmApp
//
//  Created by MikhaiL on 01.06.2023.
//

import UIKit

/**
 Для создания `UIAlertController` с разными полями в зависимости от контекста редактирования (список задач или отдельная задача) можно использовать паттерн проектирования "Строитель" (Builder pattern). Этот паттерн позволяет создавать сложные объекты с помощью последовательного вызова методов строителя, предоставляя гибкость в конфигурировании объекта.
 */
final class AlertControllerBuilder {
    private let alertController: UIAlertController
    
    /**
         Инициализирует экземпляр `AlertControllerBuilder` с указанным заголовком и сообщением.
         
         - Parameters:
           - title: Заголовок предупреждения.
           - message: Текст сообщения предупреждения.
         */
    init(title: String, message: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    /**
         Устанавливает текстовое поле с указанным заголовком.
         
         - Parameter title: Заголовок текстового поля.
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    func setTextField(_ title: String?) -> AlertControllerBuilder {
        alertController.addTextField { textField in
            textField.placeholder = "List Title"
            textField.text = title
        }
        return self
    }
    
    /**
         Устанавливает два текстовых поля: одно для заголовка задачи и другое для заголовка заметки.
         
         - Parameters:
           - title: Заголовок задачи.
           - note: Заголовок заметки.
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    func setTextFields(title: String?, note: String?) -> AlertControllerBuilder {
        alertController.addTextField { textField in
            textField.placeholder = "Task Title"
            textField.text = title
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Note Title"
            textField.text = note
        }
        return self
    }
    
    /**
         Добавляет действие в `UIAlertController`.
         
         - Parameters:
           - title: Заголовок действия.
           - style: Стиль действия.
           - handler: Замыкание, вызываемое при выборе действия. Принимает заголовок задачи и заголовок заметки в качестве параметров.
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    @discardableResult
    func addAction(title: String, style: UIAlertAction.Style, handler: ((String, String) -> Void)? = nil) -> AlertControllerBuilder {
            let action = UIAlertAction(title: title, style: style) { [weak alertController] _ in
                guard let title = alertController?.textFields?.first?.text else { return }
                guard !title.isEmpty else { return }
                let note = alertController?.textFields?.last?.text
                handler?(title, note ?? "")
            }
            alertController.addAction(action)
            return self
        }
    
    /**
         Создает и возвращает экземпляр `UIAlertController`, созданный на основе установленных параметров и действий.
         
         - Returns: Экземпляр `UIAlertController`.
         */
    func build() -> UIAlertController {
        return alertController
    }
}
