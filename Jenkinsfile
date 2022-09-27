pipeline {
  agent none
  stages {
    //Build container image
    stage('Build') {
      agent {
        kubernetes {
          label 'kubeagent'
          defaultContainer 'dind'
          yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: dind
    image: docker:18.05-dind
    securityContext:
      privileged: true
    volumeMounts:
      - name: dind-storage
        mountPath: /var/lib/docker
  volumes:
    - name: dind-storage
      emptyDir: {}
"""
        }
      }
      steps {
        container('dind') {
          script {
            sh '$(dckr_pat_f-LOV5C6B5q_MC9Vd7hZ_ZwHmJk | docker login -u shrutibagwe --password-stdin)'
//tell jenkins where to save the image
            //notice this is https:// followed by the repositoryUri you created earlier
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
//build the image
              def app = docker.build("shrutibagwe/demo:${env.BUILD_ID}")
//upload it to the registry
              app.push()
            }
          } //script
        } //container
      } //steps
    } //stage(build)
  } //stages
} //pipeline
