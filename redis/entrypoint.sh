#!/bin/bash

sed -i "s|>username|${REDIS_USERNAME}|g" /usr/local/etc/redis/redis.conf
sed -i "s|>password|>${REDIS_PASSWORD}|g" /usr/local/etc/redis/redis.conf

redis-server /usr/local/etc/redis/redis.conf
