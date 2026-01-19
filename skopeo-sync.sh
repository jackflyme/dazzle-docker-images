# !/bin/bash
# This script syncs the built images to GitHub Container Registry

source ./setup-repo.sh

yq eval '.combiner.combinations[].name' dazzle.yaml | while read -r combination; do
  skopeo sync \
    --src docker \
    --dest docker \
    --src-tls-verify=false \
    "${REPO}:${combination}"  \
    "ghcr.io/jacknic/"
done
