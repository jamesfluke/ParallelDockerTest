
node {
    stage('Build components') {
        steps {
            script {
                def components = [
                    ["name": "firstcomponent"],
                    ["name": "secondcomponent"],
                ]
                def componentJobs = generateJobs(components)
                parallel componentJobs
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
                }
            }
        }
    }
}