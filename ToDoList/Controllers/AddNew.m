//
//  AddNew.m
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 28/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "AddNew.h"
#import "RLMRealm+encryptedRealm.h"
#import "ToDoItem.h"

@interface AddNew ()

@end

@implementation AddNew

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addNewToDo:(id)sender {
    @autoreleasepool {
        RLMRealm *realm = [RLMRealm encryptedRealm];
        
        ToDoItem *newItem = [[ToDoItem alloc] init];
        newItem.finished = NO;
        newItem.text = _textField.text;
        
        [realm beginWriteTransaction];
        [realm addObject:newItem];
        [realm commitWriteTransaction];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
