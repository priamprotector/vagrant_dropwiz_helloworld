## Vagrant/DropWizard Test
A simple project that uses vagrant to launch a virtualbox instance that will build and start a dropwizard example application.

## Getting Started
The bootstrap script for this project will do the following:
* Install all required yum packages.
* Copy the 'hello-world' project into the vagrant user home directory. 
* Compile the 'hello-world' project.
* Start the 'hello-world' application in the background as the vagrant user.

#### Start Image and Verify
To begin, tell vagrant to start the virtual box instance and run the bootstrap script.
```
./run.sh
```
Once the image is up, verify/test the application.
```
vagrant ssh
curl -v http://localhost:8080/hello-world
```

## Analysis
This current incarnation has a lot to be desired.

1. It takes roughly 3-5min to start the vagrant image.  
2. Always downloads all packages from entire internet.
3. The bootstrap script is a bit heavy for me.

#### Todos?
1. Should the vagrant box build the project?
2. Should a new vagrant box be created from the base centos7 box?

