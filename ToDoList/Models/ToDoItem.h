//
//  ToDoItem.h
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 27/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import <Realm/Realm.h>

@interface ToDoItem : RLMObject

@property NSDate *created;
@property NSString *text;
@property BOOL finished;

@end
