# Security Guidance

## Legend

| Abbreviation | Meaning                                                               |
| :----------- | :-------------------------------------------------------------------- |
| `FIEO`       | Filter input, escape output                                           |
| `CSP`        | Content Security Policy                                               |
| `STP`        | Synchronized Token Pattern                                            |
| `Same-site`  | Cookie-attribute                                                      |
| `XSS`        | Cross Site Scripting                                                  |
| `CSRF`       | Cross Site Request Forgery                                            |
| `OWASP`      | The Open Web Application Security Project [OWASP](https://owasp.org/) |
| `Whitelist`  | Only allow certain characters                                         |
| `Blacklist`  | Only block certain characters                                         |

## XSS

This attack can be done by posting script strings that are then later presented on the application. The scripts usually steal cookies, keylog or phishing (compromised forms). This happens when the posted data is handled incorrectly by the application. `innerHTML` is the most common issue.

### Protection

1. `FIEO`
2. `Whitelist` & `Blacklist`

Out of `white-listing` and `black-listing` the former is the most secure. `Black-listing` is not recommended since it is hard to keep track of all possible attacks.

Using the `CSP` HTTP header whitelists allowed sources of scripts, style and other resources. Using for example helmetjs allows this to be set up easily.

## CSRF

This attack is done by using session-cookies to do state-changing requests (transfer of funds, change password, change email adress etc). If the victim has administrator privilieges it can compromise the entire application.

### Protection

**Forms**

1. `STP`, checks if the request was made by the client by including a `token` in forms (and/or in a meta tag). The `token` must be `unique` for each request.

**Methods**

1. `Same-site`
   - `strict` Only sends the cookie when requests from originating site that set the cookie (same-site). Blocks `GET`.
   - `lax` Cookie is not sent on cross-site requests. Blocks `POST`.
   - `none` Sends the cookie with both cross-site and same-site requests.

```js
const sessionOptions = {
  cookie: {
    secure: true, // Website must be using HTTPS.
    httpOnly: true, // Forbids JS from accessing the cookie.
    maxAge: 3200, // Lives for 1 day.
    sameSite: "lax", // Default.
  },
};
```

## Keys

**Generating SSH-key**

Follow instructions found [here (github generate SSH-key)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
