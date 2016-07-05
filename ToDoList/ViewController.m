//
//  ViewController.m
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 27/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "ViewController.h"
#import "RLMRealm+encryptedRealm.h"
#import "Controllers/ItemViewCell.h"
#import "ToDoItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // La vista de los elementos
    [_collectionView registerNib:[UINib nibWithNibName:@"ItemViewCell" bundle:nil]
      forCellWithReuseIdentifier:@"TableViewCell"];
    
    
    RLMRealm *realm = [RLMRealm encryptedRealm];
    _data = [[ToDoItem allObjectsInRealm:realm] sortedResultsUsingProperty:@"created" ascending:NO];
    
    [_collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [_collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteFinished:(id)sender {
    @autoreleasepool {
        RLMRealm *realm = [RLMRealm encryptedRealm];
        
        RLMResults<ToDoItem *> *completedItems = [ToDoItem objectsInRealm:realm
                                                                    where:@"finished = YES"];
        
        [realm beginWriteTransaction];
        [realm deleteObjects:completedItems];
        [realm commitWriteTransaction];
    }
    
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    [cell configureCellWithToDo:[_data objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItem *selectedItem = [_data objectAtIndex:indexPath.row];
    
    
    RLMRealm *realm = [RLMRealm encryptedRealm];
    [realm transactionWithBlock:^{
        selectedItem.finished = !selectedItem.finished;
    }];
    
    [_collectionView reloadData];
}

@end
