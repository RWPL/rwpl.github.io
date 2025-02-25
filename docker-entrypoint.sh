#!/bin/bash
set -e

bundle _${BUNDLER_VERSION}_ install

exec "$@"
