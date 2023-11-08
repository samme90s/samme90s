# Cryptography

## Abbreviations

| Abbreviation | Meaning                                                 |
| ------------ | ------------------------------------------------------- |
| CIA          | Confidentiality\*`1`, Integrity\*`2`, Availability\*`3` |
| P            | Plaintext                                               |
| C            | Ciphertext                                              |
| K            | Key                                                     |

> \*`1` Confidentiality ensures that data is only available to authorized users.

> \*`2` Integrity ensures that data can only be changed by authorized users.

> \*`3` Availability refers to the accessibility of the data. It considers how easy it is to access the data and how many layers of security are in place to protect it.

## Basic Concepts

### Encryption and Decryption

Encryption is the process of converting plaintext into ciphertext using a cipher and a key. Decryption is the reverse process, converting ciphertext back into plaintext.

### Cipher

A cipher is the algorithm used for encryption and decryption.

### Key

The key can be seen as a password to the cipher.

### Cryptanalysis

Cryptanalysis is the process of breaking a cipher. The goal is to find the key without knowing it. The process is only worth it if the cost of breaking the cipher is less than the value of the information obtained, or if the information can be obtained before it becomes irrelevant.

## Types of Ciphers

### Block Cipher

In a block cipher, plaintext and ciphertext consist of fixed-size blocks. The Feistel Cipher is the basis for all block ciphers.

### Substitution Cipher

Imagine you have a secret language with your friend where you replace each letter with another letter. For example, you might decide that in your secret language, "a" is "c", "b" is "d", "c" is "e", and so on. So, if you want to write "abc", you would write "cde". This is what a substitution cipher does - it substitutes one letter for another. The _substitution box_ (S-box) is like your secret language dictionary that tells you what each letter should be replaced with.

### Transposition Cipher

Now, imagine you and your friend decide to make your secret language even more secret. Instead of just replacing letters, you also decide to mix up the order of the letters. So, "abc" might become "bac". This is what a transposition cipher does - it changes the order of the letters. The _permutation box_ (P-box) is like your secret rule book that tells you how to mix up the letters.

### Ceasar Cipher

This cipher is a substitution cipher, the key is the number of letters to shift. A would represent 0 and Z would represent 25. The plaintext is shifted by the key and the ciphertext is the result of the shift. The decryption is done by shifting the ciphertext by the negative key. The sum is always modulo 26 (length of the alphabet).

### Playfair Cipher

In the Playfair cipher you typically place the alphabet in a 5x5 matrix (English). First, you fill the matrix with the letters of a key, ensuring each letter only appears once. Then, you fill the rest of the matrix with the remaining letters of the alphabetical order.

To encrypt plaintext (vice versa for decrypting), you follow these rules:

1. If the letters are in the same column, replace them with the letters directly below them, wrapping around to the top if necessary.
2. If the letters are in different rows and columns, imagine a rectangle formed by the positions of the letters in the matrix (can be seen as cropping the matrix). Replace the letters with the ones on the opposite corners of this rectangle.

### Vernam Cipher

The Vernam Cipher, also known as the One-Time Pad, is a type of substitution cipher where the key is as long as the plaintext message. This means if your message is 10 letters long, your key should also be 10 letters long.

The encryption process involves taking each character (or bit in the case of binary data) of the plaintext and the corresponding character from the key and combining them using the XOR (Exclusive OR) operation. The XOR operation is a binary operation that takes two bits and returns 0 if the bits are the same, and 1 if the bits are different.

For example, if we have a plaintext bit `1` and a key bit `0`, the XOR operation would return `1`. If both bits were `1` or `0`, the XOR operation would return `0`. This process is repeated for each bit in the plaintext and the key to produce the ciphertext.

The decryption process is the same as the encryption process because the XOR operation is reversible. If you take the ciphertext and XOR it with the same key, you get back the original plaintext.

The Vernam Cipher is theoretically unbreakable if used correctly, because each bit of the key is used only once and then discarded. However, in practice, it can be difficult to generate and securely distribute keys that are truly random and as long as the message.

```js
Plain-Text: O A K
Key: S O N
```

```js
O ==> 14 = 0 1 1 1 0
S ==> 18 = 1 0 0 1 0
Bitwise XOR Result: 1 1 1 0 0 = 28
```

```js
28 - 26 = 2 ==> C
Cipher-Text: C
```

Further reading: [Vernam Cipher](https://www.geeksforgeeks.org/vernam-cipher-in-cryptography/)

## Commonly Used Encryption Standards

### DES (Data Encryption Standard)

DES mainly uses 56-bit keys for encryption and an additional 8-bit for checking values. This can be improved upon by using double key DES (57-bit key) however this opens up for _MIM_\*`1` (meet-in-the-middle) attacks, double key triple DES (80-bit key), or triple key DES (112-bit key). Each encryption is done in 16 rounds.

> \*`1` A Meet-in-the-Middle attack is a type of attack on encryption algorithms, specifically against block ciphers. In this attack, the attacker simultaneously decrypts the ciphertext (the scrambled message) from one end and encrypts the plaintext (the original message) from the other end, hoping to meet in the middle at the correct key. This can significantly reduce the time needed to find the correct key.

### AES (Advanced Encryption System)

AES mainly uses 128-bit keys but can also use 192-bit and 256-bit keys. Each encryption is done in different rounds incrementing by two for each key size, 10 rounds for 128-bit keys, 12 rounds for 192-bit keys and so on.

### RSA (Rivest-Shamir-Adleman) - Asymmetric Encryption

RSA uses two keys for encryption and decryption. They are interchangeable, so either can be chosen as the public key. Once one key is chosen as the public key, the other must be kept private. The encryption is done by raising a plaintext block to the power of the public key, then performing substitution and transposition. The beauty of this is that the public key can be published anywhere without compromising the encryption, since it is only the private key that can decypher the ciphertext. This is called asymmetric encryption and can be prone to attacks such as; man-in-the-middle\*1.

> \*1 Man-In-The-Middle is where the attacker secretly intercepts an exchange of keys. The interceptor then recives the asked for public key sent by Alice. The attacker holds the public key from Alice then sends his own public key to Bob. Bob then generates a symmetric key and encrypts it using the public key recieved from the perpretator and sends it. The attacker now has the symmetric key for Bob and sends his symmetric key encrypted by Alice public key. The attacker now has both symmetric keys and can decrypt and encrypt messages between Alice and Bob giving the attacker option to change the content of the messages. This is seen as both a integrity and confidentiallity attack.
