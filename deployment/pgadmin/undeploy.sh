#!/usr/bin/env bash

# ==============================================================================
#
# Deletes pgAdmin from the cluster
#
# ==============================================================================

# Internal parameters

# ------------------------------------------------------------
source ../shared.sh

# Stop immediately if any of the deployments fail
trap errorHandler ERR

# ------------------------------------------------------------
echoSection "Validating parameters"

checkAppName "pgadmin"

# ------------------------------------------------------------
echoSection "Removing via Helm"

helm del --purge ${PGADMIN_APP_NAME}

# ------------------------------------------------------------
echoSection "Deleting namespace"

deleteNamespace ${PGADMIN_APP_NAME}

# ------------------------------------------------------------
echoSection "PgAdmin has been removed from your cluster"

