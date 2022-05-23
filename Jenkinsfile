pipeline {
    agent any
    parameters {
        string(name: 'name_container', defaultValue: 'proyecto-qa', description: 'nombre del docker')
        string(name: 'name_imagen', defaultValue: 'iproyecto-qa', description: 'nombre del la imagen')
        string(name: 'tag_imagen', defaultValue: 'latest', description: 'etiqueta de la imagen')
        string(name: 'puerto_imagen', defaultValue: '81', description: 'puerto a publicar')
    }
    environment {
        name_final = "${name_container}${tag_imagen}${puerto_imagen}"
    }
    stages {
        stage('stop/rm') {
            when {
                expresion {
                    DOCKER_EXIST = sh(returnStdout: true, script: 'echo "$(docker ps -q --filter name=${name_final})"')
                    return DOCKER_EXIST != ''
                }
            }
            steps {
                sh 'docker stop ${name_final}'
            }
        }

        stage('build') {
            step {
                script {
                    sh '''docker build . -t ${name_imagen}:${tag_imagen}'''
                }
            }
        }

        stage('run') {
            step {
                script {
                    sh ' docker run -dtp ${puerto_imagen}:80 --name ${name_final} ${name_imagen}:${tag_imagen}'
                }
            }
        }
    }
}