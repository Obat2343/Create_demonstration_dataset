# Create_demonstration_dataset

docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg ROS_MASTER_IP=<TODO: write IP> -t <TODO: write image name> .
docker run -it --net host -v .:/app/Create_demonstration_dataset -v /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket <TODO: write image name> bash