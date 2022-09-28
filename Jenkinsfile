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
            sh '$(cat dockerlogin.txt | docker login -u shrutibagwe --password-stdin)'
            app = docker.build("shrutibagwe/demo")
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
              def app = docker.build("shrutibagwe/demo:${env.BUILD_ID}")
              app.push()
            }
        }
      } 
    }

  }
}
