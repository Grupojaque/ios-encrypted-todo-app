//
//  ItemViewCell.h
//  ToDoList
//
//  Created by Orlando on 05/07/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface ItemViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemText;

- (void)configureCellWithToDo:(ToDoItem *)item;

@end
