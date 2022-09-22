node {
    def app
    stage('Clone repository') {
        git clone https://github.com/shruti52/argo-cd-demo.git
    }

    stage('Build image') {
       app = docker.build("shrutibagwe/demo")
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
    stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
}
