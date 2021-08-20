#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/functions.sh

KAFKA_CLUSTER_ID=$(get_kafka_cluster_id_from_container)

auth="superUser:superUser"

create_topic kafka1:8091 ${KAFKA_CLUSTER_ID} users true ${auth}
create_topic kafka1:8092 ${KAFKA_CLUSTER_ID} shop.platform.erp.order.dev false ${auth}
create_topic kafka1:8092 ${KAFKA_CLUSTER_ID} shop.platform.order.request.dev false ${auth}
create_topic kafka1:8092 ${KAFKA_CLUSTER_ID} shop.platform.order.response.dev false ${auth}
