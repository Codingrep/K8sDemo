pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/Codingrep/K8sDemo.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("deepanshuc33/hellowhale:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker_Registry_Credentials') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
        script {
          //kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
           withKubeConfig([credentialsId: 'kubernetes-config']) {  
            //bat 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"'  
            //bat 'chmod u+x ./kubectl'  
            bat 'kubectl apply -f hellowhale.yml'  
           }  
        }
      }
    }

  }

}
