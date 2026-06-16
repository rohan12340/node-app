#!/bin/bash

docker stop node-app || true

docker rm node-app || true