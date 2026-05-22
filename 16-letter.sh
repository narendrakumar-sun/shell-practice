#!/bin/bash

X=mississippi

grep -o "s" <<< '$X' | wc -l