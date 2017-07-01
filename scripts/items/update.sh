#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "name": "bba",
      "description": "WDFSSF",
      "price": 9.99,
      "currency": "USD"
    }
  }'

echo
