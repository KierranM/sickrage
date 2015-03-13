#kierranm/sickrage
<i>A minimal sickrage image that updates with every container</i>

This is a minimal image based on ```phusion/baseimage```, it has a barebones
 install of sickrage installed in /sickrage, each time a container is run
 sickrage is updated from the git repo.

 ##Configuration
  Sickrage is installed in ```/sickrage```, and is set to use ```/config``` directory to hold the sickrage data, this should be mounted to a host folder to perserve the database between different sickrage containers

  There are also these directories for your other data, sickrage is configured to
  point to these by default:
  * ```/tv``` -> This is where TV shows are located
  * ```/downloads``` -> This is where downloaded TV shows will be placed to be harvested by sickrage
  * ```/blackhole``` -> This is where sickrage will save torrents to be picked up by your BitTorrent client

  ##Web Login
  By default the username and password to login to the web UI is ```sickrage-user``` and ```sickrage-password```,
   just to be absolutely clear <b>YOU NEED TO CHANGE THIS!!!</b>

 Changing these values is easy, when running the container simply pass the
 ```-e USERNAME="exampleuser"``` and ```-e PASSWORD="examplepassword"``` parameters to the docker run command
 These will then be automagically substituted into the config on startup

  ##Install
  To setup a new container simply run:
  ```bash
    docker run --name="sickrage" \
      -v /path/to/config:/config \
      -v /path/to/downloads:/downloads \
      -v /path/to/tv/shows:/tv \
      -v /path/to/blackhole:/blackhole \
      -p 8081:8081 \
      -e USERNAME="weblogin" \
      -e PASSWORD="password" \
      kierranm/sickrage
  ```
