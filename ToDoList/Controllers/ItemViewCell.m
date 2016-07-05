//
//  ItemViewCell.m
//  ToDoList
//
//  Created by Orlando on 05/07/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "ItemViewCell.h"

@implementation ItemViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)configureCellWithToDo:(ToDoItem *)item {
    _itemText.text = item.text;
    
    if (item.finished) {
//        _itemText.textColor = [UIColor lightGrayColor];
        
        NSMutableAttributedString *labelString = [[NSMutableAttributedString alloc] initWithString:item.text];
        [labelString addAttribute:NSStrikethroughStyleAttributeName
                            value:@2
                            range:NSMakeRange(0, [labelString length])];
        
        _itemText.attributedText = labelString;
    } else {
        _itemText.textColor = [UIColor blackColor];
    }
}

@end
