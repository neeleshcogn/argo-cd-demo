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
  }
}
