//
//  ToDoItem.m
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 27/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

+ (NSDictionary *)defaultPropertyValues{
    // El valor de la propiedad es el momento en que se crea el objeto
    return @{ @"created": [NSDate date],
              @"text": @"",
              @"finished": @NO };
}

@end

RLM_ARRAY_TYPE(ToDoItem) // Define el tipo RLMArray<ToDoItem>
