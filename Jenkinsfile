pipeline {
  agent {
    kubernetes {
      label 'kubeagent'
    }
  }
  stages {
    stage('test') {
      steps {
        sh 'echo "hello"'
      }
      
    }
    stage('Build image') {
        steps {
          script {
            withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u shrutibagwe -p ${dockerhubpwd}'
                  
                   docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                   def app = docker.build("shrutibagwe/demo:${env.BUILD_ID}")
                   app.push()
              }
            }
        }
      } 
    }

  }
}
