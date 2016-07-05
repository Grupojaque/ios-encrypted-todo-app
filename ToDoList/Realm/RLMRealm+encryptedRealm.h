//
//  RLMRealm+encryptedRealm.h
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 29/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import <Realm/Realm.h>
#import <Security/Security.h>

// El ID de la llave de cifrado en el Keychain
static const uint8_t KEYCHAINID[] = "com.grupojaque.todolist.dbkey";


@interface RLMRealm (encryptedRealm)

/*! Obtiene una instancia de Realm configurada con la llave de cifrado
 * de la aplicación, lista para ser usada para guardar y obtener datos
 * \returns Una instancia de RLMRealm
 */
+ (id)encryptedRealm;

@end
