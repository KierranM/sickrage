#kierranm/sickrage
<i>A minimal sickrage image that updates with every container</i>

This is a minimal image based on ```phusion/baseimage```, it has a barebones
 install of sickrage installed in /sickrage, each time a container is run
 sickrage is updated from the git repo.

 ##Configuration
  Sickrage is installed in ```/sickrage```, and is set to use ```/config``` directory to hold the sickrage data, this should be mounted to a host folder to perserve the database between different sickrage containers

  There are also these directories for your other data, you need to point sickrage at these yourself:
  * ```/tv``` -> This is where TV shows are located
  * ```/downloads``` -> This is where downloaded TV shows will be placed to be harvested by sickrage
  * ```/blackhole``` -> This is where sickrage will save torrents to be picked up by your BitTorrent client


  ##Install
  To setup a new container simply run:
  ```bash
    docker run --name="sickrage" \
      -v /path/to/config:/config \
      -v /path/to/downloads:/downloads \
      -v /path/to/tv/shows:/tv \
      -v /path/to/blackhole:/blackhole \
      -p 8081:8081 \
      kierranm/sickrage
  ```
