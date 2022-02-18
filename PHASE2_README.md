For Phase 2 I decided to choose the Artitect option. 

For local Kubernetes orchestration I decided to go with Minikube. From what I understand is a local Kubernetes instance that focuses on making it easy to learn and use. It's cross platform and can even be deployed in the cloud. It's open source, so devs and architects can dig into the code and even create add-ons that fit their needs. There are also built-in add-ons which can be enabled or disabled when evaluating. For example, there's an add-on for a Kubernetes Web UI Dashboard that will give the user insight and usage metrics on their tool/app. It's good for creating a proof of concept, making a case for a new app or technology, without needing to invest so much into the infrastructure. A use case for this would be running a new tool or app locally to showcase in a presentation. 

Setting up was fairly easy. Selecting the appropriate OS then running:

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64

The above downloads it to the current working directory. 

To install it run:

sudo install minikube-darwin-amd64 /usr/local/bin/minikube

to start minikubectl:

minikube start

Running the above command downloads the preloaded k8 image along with creating the docker container using 2 CPUs, about 2GB of RAM and 20GB of local disk space. It should look something like below:

cisco@FZMacbookPro2017 ~ % minikube start
😄  minikube v1.25.1 on Darwin 12.0.1
✨  Automatically selected the docker driver
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.23.1 preload ...
    > preloaded-images-k8s-v16-v1...: 504.42 MiB / 504.42 MiB  100.00% 1.21 MiB
    > gcr.io/k8s-minikube/kicbase: 378.98 MiB / 378.98 MiB  100.00% 858.96 KiB 


🔥  Creating docker container (CPUs=2, Memory=1985MB) ...
🐳  Preparing Kubernetes v1.23.1 on Docker 20.10.12 ...
    ▪ kubelet.housekeeping-interval=5m
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass

❗  /usr/local/bin/kubectl is version 1.21.5, which may have incompatibilites with Kubernetes 1.23.1.
    ▪ Want kubectl v1.23.1? Try 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

You can manually start the dashboard too using: minikube dashboard 

which will launch a local kubernetes dashboard web app using your current default browser. Screenshot file named kubernetes_local_dashboard has been uploaded to demonstrate an example with a running container.

From here devs can use "minikube kubectl create" to create their image and "minikube kubectl expose" to expose it locally (you can also create an alias like kubectl which contains the command minikube kubectl).


https://opensource.com/article/20/11/run-kubernetes-locally

https://acloudguru.com/hands-on-labs/installing-minikube-in-the-cloud

https://www.radishlogic.com/kubernetes/running-minikube-in-aws-ec2-ubuntu/

https://kubernetes.io/docs/tutorials/hello-minikube/

https://enterprisersproject.com/article/2019/4/minikube-how-to-use

https://minikube.sigs.k8s.io/docs/start/

