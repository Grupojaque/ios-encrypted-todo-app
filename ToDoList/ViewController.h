//
//  ViewController.h
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 27/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>


@property RLMResults<ToDoItem *> *data;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
