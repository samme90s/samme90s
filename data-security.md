# Data Security

## Cryptology

Encryption is the process of converting plaintext into ciphertext using a cipher and a key and vice versa for decryption. Cryptography is the study of encryption and decryption. Cryptanalysis is the study of breaking encryption and the process is only worth it if the cost of breaking the cipher is less than the value of the information obtained, or if the information can be obtained before it becomes irrelevant. Cryptology is the study of cryptography and cryptanalysis.

### Abbreviations

| Abbreviation | Meaning                                                 |
| ------------ | ------------------------------------------------------- |
| `CIA`        | Confidentiality\*`1`, Integrity\*`2`, Availability\*`3` |
| `P` or `PT`  | Plaintext                                               |
| `C` or `CT`  | Ciphertext                                              |
| `K`          | Key                                                     |
| `Cipher`     | Algorithm used for encryption and decryption            |

> \*`1` Confidentiality ensures that data is only available to authorized users.

> \*`2` Integrity ensures that data can only be changed by authorized users.

> \*`3` Availability refers to the accessibility of the data. It considers how easy it is to access the data and how many layers of security are in place to protect it.

### Types of Ciphers

#### Block Cipher

In a block cipher, plaintext and ciphertext consist of fixed-size blocks. The Feistel Cipher is the basis for all block ciphers.

#### Substitution Cipher

Imagine you have a secret language with your friend where you replace each letter with another letter. For example, you might decide that in your secret language, "a" is "c", "b" is "d", "c" is "e", and so on. So, if you want to write "abc", you would write "cde". This is what a substitution cipher does - it substitutes one letter for another. The _substitution box_ (S-box) is like your secret language dictionary that tells you what each letter should be replaced with.

#### Transposition Cipher

Now, imagine you and your friend decide to make your secret language even more secret. Instead of just replacing letters, you also decide to mix up the order of the letters. So, "abc" might become "bac". This is what a transposition cipher does - it changes the order of the letters. The _permutation box_ (P-box) is like your secret rule book that tells you how to mix up the letters.

### Commonly Used Encryption Standards

#### DES (Data Encryption Standard)

DES primarily employs 56-bit keys for encryption, with an additional 8 bits for checking values. Improved variants include double key DES (57-bit key), susceptible to meet-in-the-middle (MIM)\*`1` attacks, double key triple DES (80-bit key), or triple key DES (112-bit key). Encryption involves 16 rounds, but increasing key size slows down the process. Consequently, many have transitioned to AES (Advanced Encryption System).

> \*`1` A Meet-in-the-Middle attack is a type of attack on encryption algorithms, specifically against block ciphers. In this attack, the attacker simultaneously decrypts the ciphertext from one end and encrypts the plaintext from the other end, hoping to meet in the middle at the correct key. This significantly reduces the time needed to find the correct key.

#### AES (Advanced Encryption System)

AES predominantly uses 128-bit keys, but can also employ 192-bit and 256-bit keys. Encryption involves different rounds, incrementing by two for each key size—10 rounds for 128-bit keys, 12 rounds for 192-bit keys, and so forth.

#### RSA (Rivest-Shamir-Adleman)

RSA utilizes a pair of interchangeable keys for encryption and decryption—either can be the public key. The public key is shareable, while the private key must remain confidential. Encryption involves raising a plaintext block to the power of the public key, followed by substitution and transposition. This approach, known as asymmetric encryption, allows public key sharing without compromising security. However, it is susceptible to a man-in-the-middle\*`1` (MitM) attack. To address this risk, key exchange protocols like Revised Key Exchange (RKE) are employed.

> \*`1` A Man-In-The-Middle (MitM) attack occurs when an attacker intercepts and potentially alters communication between two parties. In RSA, this could compromise the key exchange process, allowing the attacker to eavesdrop or manipulate communication without detection.

### Integrity Options

#### Parity

The simplest error detection method involves adding an extra bit to a message. The parity bit, set to 1 for an odd number of 1's and 0 for an even number, detects single bit flips. However, it fails to detect errors if two bits are flipped.

#### Hashing

Hashing generates a unique value for input, like a medieval wax seal. A checksum, a common hash example, sums bytes in a file; any change alters the checksum. For added security, cryptographic hash functions like _SHA_ (Secure Hash Algorithm) are used. _SHA_ is a one-way function, producing a fixed-length string. Altering the input yields a distinct hash, enhancing security. This technique is widely used and especially in password storage. Hashing produces a _hash digest_.

#### Digital Signatures

Digital signatures verify message authenticity and integrity. Attached to a message, the signature is computationally secure and unalterable. A signature is generated using a private key, then it is verified (**not** decrypted), using the corresponding public key. The _RSA_ signature scheme is an example, ensuring the integrity of the original message.

### Program Security

Programs, while regularly patched for discovered vulnerabilities, may introduce new attack vectors. Security tests, comparing behavior to requirements, help identify and address risks, including unexpected behaviors like easter eggs that could pose security threats. Preventing threats is a collaborative effort between developers, testers, and users.

Testing typically reveals faults by insiders (developers) and failures by outsiders (users).

Complex programs are more prone to faults, making simplicity essential for security. Regular program updates are vital to address evolving technologies and prevent security issues arising from outdated technology. Keep it simple, small and independent modules.

Flaws can be unintentional or intentional, categorized as either malicious or non-malicious.

#### Buffer Overflow

Buffer overflows can enable attackers to write to memory beyond the allocated space, allowing code execution or system crashes by flooding with excessive data.

#### Incomplete Mediation

Incomplete mediation occurs when a program fails to verify user permissions, potentially granting unauthorized access to data or actions. This vulnerability can expose sensitive information.

#### Time of Check to Time of Use

In computing, this vulnerability involves changes to a resource between the time access is checked and the time it is used. Analogous to a buyer seeing a genuine Rolex but receiving a forged one after purchase.

## Threat Modeling

Threat modeling involves identifying and addressing potential security threats and vulnerabilities in a system or application. Here are some key strategies for effective threat modeling:

Search for similar threat areas using a search engine and analyze their data flow diagrams and findings.

1. **Define the Scope:**

   - Clearly define the scope of your threat modeling exercise. Identify the boundaries of the system or application you are assessing to ensure a focused and manageable analysis.

2. **Identify Assets:**

   - Identify and prioritize the assets within the system. Assets can include sensitive data, intellectual property, user credentials, and more. Understanding what needs protection is crucial.

3. **Enumerate Threats:**

   - Brainstorm and list potential threats that could harm the identified assets. Consider both internal and external threats, and think about various attack vectors.

4. **Assess Vulnerabilities:**

   - Evaluate the vulnerabilities in the system that could be exploited by the identified threats. This involves understanding weaknesses in software, configurations, or processes that could be exploited.

5. **Use Threat Modeling Techniques:**

   - Choose a suitable threat modeling technique based on your system's complexity and requirements. Common techniques include STRIDE (Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege) and DREAD (Damage, Reproducibility, Exploitability, Affected users, Discoverability).

6. **Integrate into Development Lifecycle:**

   - Incorporate threat modeling into the software development lifecycle. By doing so, security considerations become an integral part of the design and development process, making it more proactive.

7. **Collaborate with Stakeholders:**

   - Involve various stakeholders, including developers, architects, system administrators, and security experts, in the threat modeling process. This collaborative approach ensures a broader perspective and better identification of potential threats.

8. **Prioritize and Mitigate:**

   - Prioritize the identified threats based on their severity and potential impact on assets. Develop mitigation strategies and countermeasures to address the most critical threats first.

9. **Document and Communicate:**

   - Document the results of the threat modeling exercise, including identified threats, vulnerabilities, and mitigation strategies. Communicate this information to relevant stakeholders, fostering awareness and understanding of security risks.

10. **Iterate and Update:**

    - Threat modeling is an iterative process. Regularly revisit and update threat models as the system evolves, new threats emerge, or changes are made to the architecture. This ensures ongoing security resilience.

11. **Learn from Past Incidents:**
    - Analyze past security incidents and incorporate lessons learned into your threat modeling process. Understanding how vulnerabilities were exploited in the past can help improve future threat models.

By following these strategies, organizations can create a more secure environment by proactively identifying and addressing potential security risks.

## Data Flow Diagram

Data Flow Diagrams are a graphical representation of the flow of data within a system, and they are commonly used in the context of threat modeling to visualize how data moves through various components of a system. Here is how you can incorporate rules (Howard and LeBlanc’s Writing Secure Code, Second Edition (Microsoft Press, 2009)) into the context of DFDs:

1. **Show the events that drive the system:**

   - Represent events or triggers that initiate data flow within the system. These events could be user actions, system inputs, or external stimuli.

2. **Show the processes that are driven:**

   - Identify and depict the processes that handle and manipulate the data. These processes are points in the system where data is transformed or used.

3. **Determine what responses each process will generate and send:**

   - Specify the responses generated by each process and the data flows associated with those responses. Understand how the system reacts to different events.

4. **Identify data sources for each request and response:**

   - Clearly define the sources of data for each process and understand where the data comes from and where it goes.

5. **Identify the recipient of each response:**

   - Determine the entities or components that receive the responses from each process. This helps in understanding the flow of information within the system.

6. **Ignore the inner workings, focus on scope:**

   - Focus on the high-level data flow and interactions without delving into the detailed internal workings of each process. Keep the scope at a level where you can identify potential threats and vulnerabilities.

7. **Ask if something will help you think about what goes wrong or what will help you find threats:**
   - Use the DFD to prompt questions about potential security threats. Consider what could go wrong at each stage of data flow and identify potential vulnerabilities.

Incorporating these guidelines into your Data Flow Diagrams can enhance the effectiveness of your threat modeling process. It provides a visual representation of the system's data flow, helping you identify potential security risks and devise appropriate mitigation strategies.
