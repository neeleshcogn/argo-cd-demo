pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: dind
            image: docker:18.05-dind
            command:
            - cat
            tty: true
            volumeMounts:
            - name: dockersock
              mountPath: /var/run/docker.sock
          volumes:
          - name: dockersock
            hostPath:
                path: /var/run/docker.sock
          securityContext:
            privileged: true

        '''
    }
  }
  stages {
    stage('build docker') {
      steps {
        container('dind') {
          script {
            withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u shrutibagwe -p ${dockerhubpwd}'
                   def app = docker.build("shrutibagwe/demo:${env.BUILD_ID}")
                   app.push()     
            }
            
        }
        }
      }
    }
  }
}
