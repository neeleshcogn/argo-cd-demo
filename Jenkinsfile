pipeline {
  agent none
  stages {
    //Build container image
    stage('Build') {
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
