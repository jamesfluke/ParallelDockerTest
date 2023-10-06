
pipeline {
    agent {label 'ubuntu'}
    stages{
        stage('Build components') {
            steps {
                script {
                    def componentJobs = generateJobs(components)
                    parallel componentJobs
                }
            }
        }
    }
}



def generateJobs(components){
    def componentJobs = [:]
    components.each { component ->

        componentJobs[component.name] = {
            //place each in their own workspace to avoid shared file conflicts
            def mainWorkspace = WORKSPACE
            def componentWorkspace = "${WORKSPACE}/.component-stages/${component.name}"
            ws(componentWorkspace) {
                stage("Build ${component.name}") {
                    agent {
                        docker {
                            image 'hello-world'
                            // label ''
                            // args
                        }
                    }
                    sh "echo hello ${component.name}"
                }
            }
        }
    }
    return componentJobs
}