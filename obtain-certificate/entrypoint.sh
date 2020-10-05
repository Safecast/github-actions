#!/usr/bin/env bash

set -euo pipefail

aws s3 sync "${INPUT_S3_URI}" ./lego

IFS=$'\n' read -d '' -r -a DOMAINS <<< "${INPUT_DOMAINS}" || true

unset DOMAIN_ARGS
for (( i=0; i<${#DOMAINS[*]}; ++i)); do
    DOMAIN_ARGS+=( "--domains" "${DOMAINS[$i]}" )
done

if [[ -n "${INPUT_ACCEPT_TOS}" ]]; then
  ACCEPT_TOS_ARG="--accept-tos"
fi

LEGO_ARGS=(
  "${ACCEPT_TOS_ARG}"
  --path ./lego
  --email "${INPUT_EMAIL}"
  --server "${INPUT_SERVER}"
  "${DOMAIN_ARGS[@]}"
  --dns route53
)

lego "${LEGO_ARGS[@]}" renew || lego "${LEGO_ARGS[@]}" run

aws s3 sync ./lego "${INPUT_S3_URI}"
