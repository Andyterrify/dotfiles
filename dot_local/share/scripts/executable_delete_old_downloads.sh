#!/bin/env bash

fd . $HOME/Downloads --changed-before 30days -x trash
