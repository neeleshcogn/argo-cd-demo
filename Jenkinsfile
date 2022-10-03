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
                sh 'docker build -t ngurjar/demo:$BUILD_ID --network=host -f Dockerfile .'
                withCredentials([usernamePassword(credentialsId: 'dockerhub_pwd', usernameVariable: 'dockerhubuser', passwordVariable: 'dockerhubpwd')]) {
                       sh 'docker login -u ${dockerhubuser} -p ${dockerhubpwd}'
                       sh 'docker push ngurjar/demo:$BUILD_ID'
                }
            }
        }
      }
    }
  }
}
