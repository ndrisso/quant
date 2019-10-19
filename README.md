## Quant

This repository basically allows to run `zipline` with Docker, so you don't have to deal with the whole lot of dependencies and errors that arise whilst trying to install `zipline` the usual way.

### Running

Should be as easy as: `docker-compose up`, first run will take a while since it needs to download and build a bunch of things. Doing so will start a _jupyter notebook_ with all the needed dependencies in order to use `zipline`.

If you would like to use the `zipline` command instead, run the following:
1. `docker-compose run quant /bin/bash`
2. `pipenv shell`
3. `zipline ...` 

### Troubleshooting

At the time of writing of this README, `zipline` does *not* work out of the box, you will need to modify 
a file within the library, details here: https://github.com/quantopian/zipline/issues/2480#issuecomment-502798293 (Having an account at https://iexcloud.io is required in order to get the token)

Use `find / -name benchmarks.py` to find the file and modify it as suggested in the link above. Sadly, you will need to do this from within the container, which means that you'll have to commit the change afterwards (`docker commit container-ID image-name`)
