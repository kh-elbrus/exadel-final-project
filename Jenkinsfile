pipeline {
  agent {
    label 'agent-1'
  }

  environment {
    DOCKERHUB_CREDS = credentials('DOCKERHUB')
  }

  stages {
    stage('Setupping ENV file') {
        steps{
          script {
            withCredentials([file(credentialsId: 'ENV_FILE', variable: 'ENV_FILE')]){
              writeFile(file: ".env", text: readFile(ENV_FILE))
            }
          }
        }
    }
    stage('Check docker & docker compose versions') {
      steps {
          sh '''
            docker --version 
            docker-compose --version
          '''
      }
    }
    stage('Build docker image') {
      steps {
        sh 'docker-compose build'
      }
    }
    stage('Running docker container') {
        steps {
            sh 'docker-compose up -d'
        }
    }
    stage('Testing Wagtail App'){
      steps {
        sh 'docker exec -i wagtail python manage.py test'
      }
    }
    stage('Availability test') {
        steps {
            sh 'sleep 20'
            sh 'curl -I https://0.0.0.0 -k'
        }
    }
    stage('Login to DockerHub'){
        steps {
            sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
        }
    }
    stage('Pushing to DockerHub') {
        steps {
            sh 'docker-compose push'
        }
    }
    stage('Deploying app to k8s') {
        steps {
           script {
                kubernetesDeploy(
                    configs: 'k8s/',
                    kubeconfigId: 'AKS_CONFIG',
                    enableConfigSubstitution: true
                )
            }
        }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
