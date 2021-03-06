LOCUST="locust"
LOCUS_OPTS="-f /demo/locust.py --host=$TARGET_HOST"

# Default = standalone
LOCUST_MODE=${LOCUST_MODE:-standalone}

# Master node
if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUS_OPTS="$LOCUS_OPTS --master"

# Worker/slave node
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUS_OPTS="$LOCUS_OPTS --worker --master-host=$LOCUST_MASTER_URL"
fi

echo "$LOCUST $LOCUS_OPTS"
$LOCUST $LOCUS_OPTS