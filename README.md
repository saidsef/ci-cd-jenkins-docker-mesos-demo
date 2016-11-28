# CI/CD Pipeline

Demo for a full CI/CD pipeline with Git, Jenkins, Docker, Docker-Compose, Mesos

All of the environment parameters are taken from the usage instructions for the images on the Docker Hub.

The Mesos slave container also using the trick with the mounted socket, but nothing needs to be fixed here since slave is running the root user that has permissions to access the socket.

It is important to note that the Jenkins container now includes a link to Marathon. This is required to be able to post the requests from the Jenkins container to the Marathon container. We will see it in the next part about deployment.
