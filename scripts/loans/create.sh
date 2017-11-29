curl --include --request POST "http://localhost:4741/loans" \
  --header "Content-Type: application/json" \
  --data '{
    "loan": {
      "borrower_id": "'"${BORROWER_ID}"'",
      "owner_id": "'"${OWNER_ID}"'",
      "gear_id": "'"${GEAR_ID}"'",
      "loan_start": "'"${LOAN_START}"'",
      "loan_end": "'"${LOAN_END}"'"
    }
  }'
