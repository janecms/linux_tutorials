#!/bin/bash
sed '=' $1 | sed 'N; s/\n/ /'
