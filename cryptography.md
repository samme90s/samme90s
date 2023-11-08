# Cryptography

## Abbreviations

P = Plaintext
C = Ciphertext
K = Key

## Encryption and Decryption

The plaintext you want to encrypt to ciphertext. vice versa for decryption.

## Cipher

The algorithm used to encrypt and decrypt the plaintext/ciphertext.

## Key

The key can be seen as a password to the cipher.

## Cryptanalysis

The process of breaking a cipher. You do not know the key and you want to find it. The process is only worth if the cost of breaking the algorithm (cipher) is less than the amount spent breaking it, same goes with time if the information has to be obtain before a certain date or timestamp otherwise the information may be irrelevant.

## Block Cipher

Feistel Cipher is the basis for all block ciphers.
Plaintext and ciphertext consists of fixed sized blocks

## Substitution Cipher

Changes one alphabet to another alphabet.

(substitution) S-box

## Transposition Cipher

Changes the order of the alphabets.

(permutation) P-box

## Playfair cipher

Rule 1: If the letters are in the same column then the interchange the letter with the one below or in a circular manner.

Rule 2: If the letters are in different row and colum then the cipher would be calculated by forming a rectangle and taking the letters on the opposite corners of the rectangle. In other words take the smallest possible matrix that can contain the letters and take the opposite corners of the matrix (crop the matrix).

## Commonly used encryptions over history

### DES Data Encryption Standard

Mainly uses 56-bit keys to encrypt and the other 8-bit for checking values. This can be improved upon by either double key DES which roughly represent a 57-bit key, double key triple DES which represent an 80-bit key and triple key DES which represent a 112-bit key. Each encryption is done in 16 rounds.

### AES Advanced Encryption System

Mainly uses 128-bit keys but can also use 192-bit and 256-bit keys and possibly more bits. Each encryption is done in 10 rounds for 128-bit keys, 12 rounds for 192-bit keys and 14 rounds for 256-bit keys.

## RSA (public key system)

Two keys are used for decryption and encryption. They are interchangable so either can be chosen as the public key (encryption) but one having been chosen the other must be kept private (encryption and decryption). The encryption is done by taking a plaintext block and raising it to the power of the public key, then doing fast substitution and transposition (permutation).

## CIA (confidentiality, integrity, availability)

### Confidentiality

Only available to authorized users.

### Integrity

The data may only be changed by authorized users.

### Availability

The accessibiliy of the data, how easy it is to access the data. How many layers of security is there to access the data.
