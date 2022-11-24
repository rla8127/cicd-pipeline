pipeline {
    agent any
    environment {
        PATH = "$PATH:/usr/local/bin/"  // skaffold, gradle , argocd path
        SOURCECODE_JENKINS_CREDENTIAL_ID = 'github'
        SOURCE_CODE_URL = 'https://github.com/rla8127/demo-scg'
        RELEASE_BRANCH = 'main'
        REGISTRY = 'rla8127/demo-scg'
    }

    stages {

        stage('init') {
            steps {
                echo 'init'
                echo "Current workspace : ${workspace}"
            }
        }

      stage('clone') {
        steps {
            echo 'clone'
            git url: "$SOURCE_CODE_URL",
            branch: "$RELEASE_BRANCH",
            credentialsId: "$SOURCECODE_JENKINS_CREDENTIAL_ID"
            sh 'ls -al'
        }
      }

    stage('Build') {
        steps {
            withDockerRegistry([ credentialsId: 'dockerhub', url: '' ]) { sh "skaffold build -p dev -t ${TAG}"}
        }
    }

    stage('workspace clear'){
        steps {
            cleanWs()
        }
    }

    }
}
