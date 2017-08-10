#!/usr/bin/env bash

#set -eux

function die_var_unset {
	echo "ERROR: Variable '$1' is required to be set. Please edit $0 and set."
	exit 1
}

[ -f sh_vars ] || { echo "User variables file 'sh_vars' not found."; exit 1; }

source sh_vars

[ -z "$dist_name" ] && die_var_unset "dist_name"
[ -z "$dist_vers" ] && die_var_unset "dist_vers"
[ -z "$dist_arch" ] && die_var_unset "dist_arch"
[ -z "$build_type" ] && die_var_unset "build_type"
[ -z "$VAGRANTCLOUD_USER" ] && die_var_unset "VAGRANTCLOUD_USER"
[ -z "$VAGRANTCLOUD_TOKEN" ] && die_var_unset "VAGRANTCLOUD_TOKEN"
[ -z "$BOX_NAME" ] && BOX_NAME="${dist_name}-${dist_vers}-${dist_arch}"
[ -z "$BOX_VERSION" ] && BOX_VERSION="${dist_vers}"

template_name="${BOX_NAME}.json"

if [ ! -f $template_name ]; then
		echo "No template '$template_name' found!"
		echo "Creating skeleton, edit and run $0 again."
		if [ -f skeltempl.json ]; then
			mv skeltempl.json $template_name
            [ $? -eq 0 ] || { echo "Unable to 'mv skeltempl.json $template_name'."; exit 3; }
		else
			curl -sSo $template_name "https://raw.githubusercontent.com/maier/packer-templates/master/skel/skeltempl.json"
            [ $? -eq 0 ] || { echo "Unable retrieve 'skeltempl.json' from github repository."; exit 3; }
		fi
		exit 2
fi

case $build_type in
remote)
    echo "Pushing $template_name to VagrantCloud/Atlas for remote build. (and making it public)"
    packer push $template_name
    ;;
local)
    export VC_BOX_TAG="${VAGRANTCLOUD_USER}/${BOX_NAME}"
    export VC_BOX_VER=$BOX_VERSION
    export VC_TOKEN=$VAGRANTCLOUD_TOKEN
    echo "Build box locally then push box to VagrantCloud."
    packer build $template_name
    unset VC_TOKEN
    unset VC_BOX_VER
    unset VC_BOX_TAG
    ;;
* )
    echo "Unknown build type '$build_type'"
    exit 1
    ;;
esac

# END
