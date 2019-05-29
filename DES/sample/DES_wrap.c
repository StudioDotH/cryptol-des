#include "DES_core.h"
#include <sym-api.h>

void encrypt(unsigned char *plainText, unsigned char *cipherText, unsigned char *key) {
	DESEncryption(plainText, cipherText, key);
}

int main() {
	unsigned char *plainText  = lss_fresh_array_uint8(8, 0, NULL);
	unsigned char *key        = lss_fresh_array_uint8(8, 0, NULL);
	unsigned char *cipherText = malloc(8 * sizeof(unsigned char));

	encrypt(plainText, cipherText, key);
	
	lss_write_aiger_array_uint8(cipherText, 8, "DES_imp.aig");
	
	return 0;
}
