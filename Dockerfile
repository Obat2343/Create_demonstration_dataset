# Base image
FROM ros:noetic

# Get User ID and Group ID as environment variables
ARG USER_ID
ARG GROUP_ID
ARG ROS_MASTER_IP
ARG ROS_MASTER_PORT=11311

# Update and install packages
RUN apt update && apt upgrade -y
RUN apt install -y \
    vim \
    less \
    iputils-ping

# Add command to bashrc for root
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

# set ROS_URI
ENV ROS_MASTER_URI=http://${ROS_MASTER_IP}:${ROS_MASTER_PORT}

# Set the working directory inside the container
WORKDIR /app/Create_demonstration_dataset

# Add a new user
RUN addgroup --gid $GROUP_ID user && adduser --uid $USER_ID --ingroup user --disabled-password --gecos "" user
USER user

# Add command to bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Define the command to run when the container starts
# CMD source /