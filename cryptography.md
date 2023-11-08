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

### Playfair Cipher

In the Playfair cipher, if the letters are in the same column, they are interchanged with the one below in a circular manner (wrap). If the letters are in different rows and columns, the cipher is calculated by forming a rectangle and taking the letters on the opposite corners of the rectangle i.e. cropping the matrix by fitting the required letters.

## Commonly Used Encryption Standards

### DES (Data Encryption Standard)

DES mainly uses 56-bit keys for encryption and an additional 8-bit for checking values. This can be improved upon by using double key DES (57-bit key) however this opens up for _MIM_\*`1` (meet-in-the-middle) attacks, double key triple DES (80-bit key), or triple key DES (112-bit key). Each encryption is done in 16 rounds.

> \*`1` A meet-in-the-middle attack targets block cipher cryptographic functions. The intruder applies brute-force techniques to both the plaintext, which is ordinary text before it is encrypted, and the ciphertext, or encrypted text that has been transformed from plaintext, of a block cipher.

### AES (Advanced Encryption System)

AES mainly uses 128-bit keys but can also use 192-bit and 256-bit keys. Each encryption is done in different rounds incrementing by two for each key size, 10 rounds for 128-bit keys, 12 rounds for 192-bit keys and so on.

### RSA

RSA uses two keys for encryption and decryption. They are interchangeable, so either can be chosen as the public key. Once one key is chosen as the public key, the other must be kept private. The encryption is done by raising a plaintext block to the power of the public key, then performing substitution and transposition.
