node ('docker') {
  stage ('SCM Checkout') {
    checkout scm
  }
  
  stage ('Docker image build') {
    sh 'docker build -t flaskr .'
  }
  
  stage ('Docker deploy') {
    sh "docker run -d --name flaskr flaskr"
  }
}
