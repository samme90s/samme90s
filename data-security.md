# Data Security

## Introduction

Security involves safeguarding against harm or loss, ensuring confidentiality, integrity, and availability of assets. In information security, it protects data and systems from unauthorized access, alteration, or destruction. Balancing security with personal privacy sparks varied public opinions. Scientifically studied in cryptography, cyber-security, and risk management. The security process involves identification, protection, detection, response, and recovery.

### Abbreviations

| Abbreviation | Meaning                                      |
| ------------ | -------------------------------------------- |
| `CIA`        | Confidentiality, Integrity, Availability     |
| `P` or `PT`  | Plaintext                                    |
| `C` or `CT`  | Ciphertext                                   |
| `K`          | Key                                          |
| `Cipher`     | Algorithm used for encryption and decryption |

## Security Process Steps

Identify > Protect > Detect > Respond > Recover

## Cryptology

Encryption converts plaintext to ciphertext using a key. Cryptography studies encryption and decryption, while cryptanalysis explores breaking encryption, justified if the cost is less than the value of information obtained. Cryptology encompasses both.

### Types of Ciphers

#### Block Cipher

Block ciphers encrypt fixed-size blocks (e.g., DES with 64-bit blocks). The Feistel Cipher is foundational to block ciphers. Different modes of operation, like _Electronic Codebook_ (ECB), _Cipher Block Chaining_ (CBC), and _Cipher Feedback_ (CFB), handle arbitrary-length messages.

![Example of ECB and different modes](.data-security/figure1.png "Example of ECB and different modes")

#### Substitution Cipher

Replaces letters based on a predetermined rule, utilizing a substitution box (S-box).

#### Transposition Cipher

Alters letter order, employing a permutation box (P-box).

#### Summary

A hybrid approach is most secure, combining substitution and transposition ciphers as only applying one is not secure enough.

### Commonly Used Encryption Standards

#### DES (Data Encryption Standard)

Uses 56-bit keys, susceptible to MIM attacks. Transitioned to AES for enhanced security.

#### AES (Advanced Encryption System)

Employs 128-bit, 192-bit, or 256-bit keys with varying rounds.

#### RSA (Rivest-Shamir-Adleman)

Uses interchangeable public and private keys for asymmetric encryption. Susceptible to MitM attacks, addressed by key exchange protocols.

#### Summary

An encryption method should have a number of properties to ensure it is secure. Examples of these are:

- [Avalanche effect](https://en.wikipedia.org/wiki/Avalanche_effect)
- [Completeness](<https://en.wikipedia.org/wiki/Completeness_(cryptography)>)

### Integrity Options

#### Parity

Simple error detection by adding a bit, detecting single bit flips.

#### Hashing

Generates a unique value for input, enhancing security, widely used in password storage.

#### Digital Signatures

Verify message authenticity and integrity, ensuring computationally secure signatures.

Asymmetric key pairs are used here. The message is hashed to produce a hash-digest that is then encrypted with the _senders private key_ and appended to the message. The _senders public key_ is then used by the receiver to verify **(process that resembles decryption in concept)** the hash-digest. The message is then hashed using the same hash algorithm and then compared between both digests. If they match, the message is authentic.

![Digital signature model](.data-security/figure2.png "Digital signature model")

### Program Security

Security tests identify vulnerabilities in programs, necessitating collaboration between developers, testers, and users. Complex programs are prone to faults; simplicity is crucial for security. Regular updates are essential to address evolving technologies.

#### Buffer Overflow

Enables unauthorized code execution or system crashes by overflowing memory with excessive data.

#### Incomplete Mediation

Exposes sensitive data in an uncontrolled state. For instance, allowing users to manipulate URLs, altering prices and total costs without proper verification, posing a risk of unauthorized access.

#### Time of Check to Time of Use

Involves changes to a resource between access check and use, akin to receiving a forged item after purchase.

#### Types of Malware

| Malicious Code Type | Characteristics                                                                                                                |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Virus               | Causes malicious behavior and propagates copies of itself to other programs.                                                   |
| Trojan Horse        | Contains unexpected, undocumented, additional functionality.                                                                   |
| Worm                | Propagates copies of itself through a network; impact is usually degraded performance.                                         |
| Rabbit              | Replicates itself without limit to exhaust resources.                                                                          |
| Script Attack       | Malicious code communicated in JavaScript, ActiveX, or other scripting languages, downloaded as part of displaying a web page. |
| Rootkit             | Code installed in "root" or most privileged level of a system, concealing its presence and enabling unauthorized access.       |
| Spyware             | Intercepts and covertly communicates user data or activity                                                                     |

### Privacy Principles

Ensure the data is stored and processed lawfully and in a **transparent** manner by specifying the purpose for storing the specified data. Destroy data when it is no longer needed.

Certain safeguards should be established to prevent loss, corruption, destruction or misuse of data. Further, clear policies and procedures for protection should be established and individuals should be assigned respective responsibilities.

Keep the users data either anonymous (not identifiable) pseudonymous (identifiable only by a pseudonym, but cannot be traced back to a real identity) or identifiable (directly identifiable).

### Characteristics of a good security policy

- **Comprehensive** - Covers all aspects of security, and general enough to apply to new cases/situations.
- **Durability** - Must be able to grow and adapt to new situations.
- **Realism** - It must be implementable with existing resources and technologies.
- **Usefulness** - It must be clear, direct and understanding.

A security plan then details how these policies/rules are implemented/applied.

![Inputs to the security plan](.data-security/figure3.png "Inputs to the security plan")

### Contingency Planning (Business Continuity Plan - BCP)

This is used when there is a threat to the business existence.

Document processes on how to continue **during** or **after** a computer security incident. This is often done in conjunction with analysis of impact (Business Impact Analysis).

#### Incident Response Plan (IRP)

Specifically addresses security-related threats to systems, networks, and data, encompassing the confidentiality, integrity, and availability (CIA) aspects of data. Additionally, it addresses the concept of non-repudiable transactions.

#### Disaster Recovery Plan (DRP)

Focused on preparing the organization for and facilitating recovery from disasters, whether natural or man-made.

#### Physical Security

Concerned with safeguarding against human vandals, natural disasters, power disruptions, and other physical threats.

### Risk assessment/analysis

1. Identify assets and their value.
2. Identify threats and vulnerabilities.

   | Category                                 | Potential threats and vulnerabilities   |
   | ---------------------------------------- | --------------------------------------- |
   | Forces of nature                         | Fire, flood, earthquake, lightning      |
   | Human error or failure                   | Accidents, mistakes                     |
   | Software attacks                         | Malware, dos                            |
   | Technical software failures              | Bugs, code errors, loopholes            |
   | Technical hardware failures              | Disk crashes                            |
   | Deviation of quality of service          | Power, WAN                              |
   | Missing, inadequate, incomplete controls | Training, privacy, ineffective policies |

3. Estimate the likelihood of exploitation.
4. Compute the expected loss.
5. Identify countermeasures.
6. Compute the cost/benefit ratio (savings).

#### Risk Exposure

```py
p(risk) = 0,4 # 40% chance for a malware attack.
risk_impact = 10_000 # 10.000$ (cost of cleaning the affected files).

risk_exposure = risk_impact * p(risk) # If the risk exposure is greater than the cost of the security measure, then it is worth it getting.
```

#### Risk Leverage

```py
risk_exposure_after_reduction # Risk that remains after the security measure is applied.
cost_of_security_measure # Cost or resources invested to the security measure.

risk_leverage = (risk_exposure_before_reduction -
                 risk_exposure_after_reduction)
                 / cost_of_security_measure
```

### Intellectual Property

|                               | Copyright                                 | Patent                                   | Trade Secret                                           |
| ----------------------------- | ----------------------------------------- | ---------------------------------------- | ------------------------------------------------------ |
| **Protects**                  | Expression of idea, not the idea itself   | Invention                                | A secret, competitive advantage in how something works |
| **Public Disclosure**         | Yes; intention is to promote publication  | No                                       | No                                                     |
| **Requirement to Distribute** | Yes                                       | No                                       | No                                                     |
| **Ease of Filing**            | Very easy, do-it-yourself                 | Complicated; specialist lawyer suggested | No filing                                              |
| **Duration**                  | Varies by country; typically 75-100 years | 19 years                                 | Indefinite                                             |
| **Legal Protection**          | Sue if unauthorized copy sold             | Sue if invention copied                  | Sue if secret improperly obtained                      |
