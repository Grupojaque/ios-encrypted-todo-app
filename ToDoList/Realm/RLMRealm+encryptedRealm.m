//
//  RLMRealm+encryptedRealm.m
//  ToDoList
//
//  Created by Orlando Rey Sánchez on 29/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "RLMRealm+encryptedRealm.h"

@implementation RLMRealm (encryptedRealm)

+ (id)encryptedRealm {
    @autoreleasepool {
        // La configuración por defecto
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        
        NSData *tag = [[NSData alloc] initWithBytesNoCopy:(void *)KEYCHAINID
                                                   length:sizeof(KEYCHAINID)
                                             freeWhenDone:NO];
        
        NSDictionary *query = @{(__bridge id)kSecClass: (__bridge id)kSecClassKey,
                                (__bridge id)kSecAttrApplicationTag: tag,
                                (__bridge id)kSecAttrKeySizeInBits: @512,
                                (__bridge id)kSecReturnData: @YES };
        
        
        // La referencia y el estatus la consulta al Keychain
        CFTypeRef dataRef = NULL;
        OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&dataRef);
        
        // Si no hay error, entonces la llave que tenemos en dataRef es correcta, se pudo
        // obtener adecuadamente
        if (status == errSecSuccess) {
            // La llave, para Realm, debe ser del tipo NSData
            NSData *key = (__bridge_transfer NSData *)dataRef;
            
            config.encryptionKey = key;
        } else {
            // Pero si no existe la llave, entonces debemos generarla, guardarla y regresar una
            // instancia de Realm con esa llave configurada
            uint8_t buffer[64];
            SecRandomCopyBytes(kSecRandomDefault, 64, buffer); // Generamos una nueva llave aleatoria de 64 bits
            NSData *keyData = [[NSData alloc] initWithBytesNoCopy:buffer length:sizeof(buffer)];
            
            // La consulta para guardar la llave en el Keychain
            query = @{(__bridge id)kSecClass: (__bridge id)kSecClassKey,
                      (__bridge id)kSecAttrApplicationTag: tag,
                      (__bridge id)kSecAttrKeySizeInBits: @512,
                      (__bridge id)kSecValueData: keyData };
            
            status = SecItemAdd((__bridge_retained CFDictionaryRef)query, NULL);
            
            if (status == errSecSuccess) {
                // La llave fue guardada correctamente y la podemos usar para crear una nueva base de datos
                config.encryptionKey = keyData;
            }
        }
        
        // Ya tenemos la llave de la aplicación en la configuración.
        return [RLMRealm realmWithConfiguration:config error:nil];
    }
}

@end
