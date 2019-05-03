#/usr/bin/env bash
docker run -it --name interactive-python --mount type=bind,source="/shared/WeatherAndElectricity-Runtime",target="/WeatherAndElectricity" python-run python
