# Security Guide
- This product gets all of it's sensitive information from Vault.  User access to the UI is controlled via the OIDC configuration that is passed in from vault and the chart parameters.
- Prisma Scan pipeline has been used for product image vulnerabilities findings and required remidiations subsequently performed.
- Eventually vulnerability management would be part of product development lifecycle where each new image needs to be scanned and necessary remidiation taken place before pushing it.