#! /usr/bin/env bash

packer build \
    -only=digitalocean \
    -var "digitalocean_id=$DIGITALOCEAN_ID" \
    -var "digitalocean_api_key=$DIGITALOCEAN_API_KEY" \
    packer.json