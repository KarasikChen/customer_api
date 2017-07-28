#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/customers"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "customer": {
      "name": "bbbhbj",
      "email": "aaa",
      "phone": 3278492374
    }
  }'

echo
