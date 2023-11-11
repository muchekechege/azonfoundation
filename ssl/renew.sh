#!/bin/bash
cd ~
# List of domains to renew
domains=("azonfoundation.online" "www.azonfoundation.online")

# Loop through the domains and renew their SSL certificates
for domain in "${domains[@]}"; do
    certbot renew --cert-name "$domain"
done
