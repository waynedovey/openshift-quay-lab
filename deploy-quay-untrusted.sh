#!/bin/bash

BUILD_LAB=gsslab

# Set the Cluster 
if [ "$1" != "--silent" ]; then
    printf "Specify Build Name (gsslab, pek2lab, <custom> ): (Press ENTER for default: ${BUILD_LAB})\n"
    read -r BUILD_LAB_CHOICE
    if [ "${BUILD_LAB_CHOICE}" != "" ]; then
        BUILD_LAB=${BUILD_LAB_CHOICE}
    fi
fi
printf "* Cluster Name: ${BUILD_LAB}\n\n"

# Build Node
ansible-playbook -e "BUILD_LAB=${BUILD_LAB}" -e @./vars/vars-${BUILD_LAB}.yml -e @./vars/vars-quay-untrusted-${BUILD_LAB}.yaml deploy-quay-untrusted-vsphere.yml --vault-password-file=openshift-quay-lab-vault.yml
