#!/usr/bin/env bash

build_conf="build.conf"

function help {
    echo "$0 (local|vc|vagrantcloud)"
    echo
    echo "local           - build box and DO NOT upload to vagrantcloud (for testing)"
    echo "vc|vagrantcloud - build box and upload to vagrantcloud"
    exit 0
}

function die_var_unset {
    echo "ERROR: Variable '$1' is required to be set. Please edit '${build_conf}' and set."
    exit 1
}

PACKER=$(type -P packer)
[[ $? -eq 0 && -n "$PACKER" ]] || { echo "Unable to find 'packer' command"; exit 1; }

target=${1:-}
[[ -z "$target" ]] && help


[[ -f $build_conf ]] || { echo "User variables file '$build_conf' not found."; exit 1; }

source $build_conf

[[ -z "$dist_name" ]] && die_var_unset "dist_name"
[[ -z "$dist_vers" ]] && die_var_unset "dist_vers"
[[ -z "$dist_rel" ]] && die_var_unset "dist_rel"
[[ -z "$dist_arch" ]] && die_var_unset "dist_arch"
[[ -z "$VAGRANTCLOUD_USER" ]] && die_var_unset "VAGRANTCLOUD_USER"
[[ -z "$BOX_NAME" ]] && BOX_NAME="${dist_name}-${dist_vers}-${dist_arch}"
[[ -z "$BOX_VERSION" ]] && BOX_VERSION="${dist_vers}"
[[ -z "$BOX_RELEASE" ]] && BOX_RELEASE="${dist_rel}"

template_name="${BOX_NAME}.json"

[[ -f $template_name ]] || { echo "Template (${template_name}) not found."; exit 1; }

case $target in
    local)
        echo "Building box locally (for testing)"
        export VC_TOKEN="noop"
        ;;
    vc|vagrantcloud)
        [[ -z "$VAGRANTCLOUD_TOKEN" ]] && die_var_unset "VAGRANTCLOUD_TOKEN"
        export VC_TOKEN=$VAGRANTCLOUD_TOKEN
        echo "Building box locally, then uploading to vagrantcloud.com"
        echo
        echo "!!! IMPORTANT !!!"
        echo
        echo "Ensure existing vagrant box on vagrantcloud.com named:"
        echo
        echo "${VAGRANTCLOUD_USER}/${BOX_NAME}"
        echo
        echo "Otherwise, the vagrantcloud post-processor upload will fail."
        ;;
    *)
        help
        ;;
esac

export VC_BOX_TAG="${VAGRANTCLOUD_USER}/${BOX_NAME}"
export VC_BOX_VER=$BOX_VERSION
export VC_BOX_REL=$BOX_RELEASE

$PACKER build $template_name

unset VC_TOKEN
unset VC_BOX_VER
unset VC_BOX_REL
unset VC_BOX_TAG
