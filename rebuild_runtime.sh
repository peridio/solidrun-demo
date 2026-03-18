#!/bin/bash

export AVOCADO_TARGET=rzv2n-sr-som

rm -rf .avocado && avocado clean && avocado install -f && avocado build
