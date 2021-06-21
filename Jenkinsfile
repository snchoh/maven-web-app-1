
node{
  def mavenHome = tool name: 'maven  3.8.1'
  stage('CodeClone') {
   git 'https://github.com/snchoh/maven-web-app-1.git'
  }
  stage('mavenBuild') {
    sh "${mavenHome}/bin/mvn clean package"
  }
  stage('CodeQuality') {
    sh "${mavenHome}/bin/mvn sonar:sonar"
  // execute the CodeQuality report with sonar
  }
   stage('uploadtonexus') {
    sh "${mavenHome}/bin/mvn deploy"
   }
   stage('deploytotomcat') {
    deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.95.58.149:8080/')], contextPath: null, war: 'target/*war'
   }
   stage('emailnottification') {
    emailext body: 'thanks ', recipientProviders: [developers()], subject: 'status of build', to: 'stefanchoh15@gmail.com'
   }
}
