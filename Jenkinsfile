pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes-plugin-test'
      label 'kubeagent'
      containerTemplate {
        name 'jnlp'
        image 'maven:3.3.9-jdk-8-alpine'
        ttyEnabled true
        command 'cat'
      }
    }
  }
  stages {
    stage('Run maven') {
      steps {
        sh 'mvn -version'
      }
    }
  }
}
