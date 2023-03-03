# Security

****
## Legend
`XSS` Cross Site Scripting
`CSRF` Cross Site Request Forgery
`OWASP` The Open Web Application Security Project [OWASP](https://owasp.org/)

****
## XSS
This attack can be done by posting script strings that are then later presented on the application. The scripts usually steal cookies, keylog or phishing (compromised forms). This happens when the posted data is handled incorrectly by the application. `innerHTML` is the most common issue.

### Protection
1. `FIEO` Filter input, escape output.
2. `Whitelist` or `Blacklist`

`CSP` Content Security Policy
Using the `CSP` HTTP header whitelists allowed sources of scripts, style and other resources.

```http
Content-Security-Policy: default-src 'self'; img-src *; media-src medial.com media2.com; script-src cdn.script.example.com
```

****
## CSRF
This attack is done by using session-cookies to do state-changing requests (transfer of funds, change password, change email adress etc). If the victim has administrator privilieges it can compromise the entire application.

### Protection
**Forms**
`STP` Synchronized Token Pattern
Checks if the request was made by the client by including a `token` in forms (and/or in a meta tag). The `token` must be `unique` for each request.

**Methods (verbs)**
`Same-site cookie`
1. `strict` Only sends the cookie when requests from originating site that set the cookie (same-site). Blocks `GET`.
2. `lax` Cookie is not sent on cross-site requests. Blocks `POST`.
3. `none` Sends the cookie with both cross-site and same-site requests.

```js
const sessionOptions = {
  cookie : {
    secure: true,     // Website must be using HTTPS.
    httpOnly: true,   // Forbids JS from accessing the cookie.
    maxAge: 3200,     // Lives for 1 day.
    sameSite: 'lax'   // Default.
  }
}
```

****
## Injections
Attacker posts some script string that retrieves, changes, adds or deletes data on a server or database.

### Protection
`mongoose.js` Module handles all input as strings.
`helmet.js` Module handles most security issues.
`npm audit` Command that scans the modules for vulnerabilities.

****
## Keys
**Generating key**
1. SSH key of type "ed25519" with a comment.
`ssh-keygen -t ed25519 -C "comment"`
2. Enter file name and hit `enter`.
3. File location by default will be at `C:\Users\*USERNAME*`

**Asymmetric**
`Public` Can only be used to encrypt.
`Private` Can be used to encrypt and decrypt.

**Symmetric**
Both parts have the `private` key.

**HTTPS**
1. `User` connects on port 443 and requests the servers identity.
2. `Server` sends a copy of the `TLS` certificate and its `public` key (used for encryption).
3. `User` checks if the `TLS` certificate is valid. Then proceeds to create a `symmetric` key and encrypts it with the `public` key recieved from the server.
4. `Server` decrypts the `symmectric` key, provided from the `user`, with its own `private` key. Then starts using the `symmetric` key when encrypting further messages.
5. A trusted and encrypted communication has been established at this point.
