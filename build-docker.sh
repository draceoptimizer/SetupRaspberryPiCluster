#!/usr/bin/env bash
basename="python"
runname="${basename}-run"
echo "updating ${runname}"

desimages=$(./docker_descendants.py ${basename} | awk '{print $1}')
for imag in ${desimages}
do
	echo "Removing docker image ${imag}"
	docker image rm -f ${imag}
done
docker image rm -f ${runname}
docker pull ${basename}
docker build -f ./dockerfile -t ${runname} .
