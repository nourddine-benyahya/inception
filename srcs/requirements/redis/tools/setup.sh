REDIS_CONF="/etc/redis/redis.conf"

sed -i 's/^# daemonize no/daemonize yes/' $REDIS_CONF
sed -i 's/^# maxmemory <bytes>/maxmemory 256mb/' $REDIS_CONF
sed -i 's/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/' $REDIS_CONF
sed -i 's/^bind 127.0.0.1 -::1/bind 0.0.0.0/' $REDIS_CONF
sed -i 's/^protected-mode yes/protected-mode no/' $REDIS_CONF

redis-server $REDIS_CONF

yes > /dev/null