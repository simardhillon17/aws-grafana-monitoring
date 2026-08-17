node('example-synthetic-us-east-1') {
  timestamps {
    deleteDir()
    git branch: "develop", url: "https://git.git.example.com/scm/cdm/basescripts.git"
    
    withEnv(["HELM_CHART_DIR=src/grafana-operator",
            "HARBOR_HELM_REPO_NAME=awsdevops",
            "HELM_CHART_NAME=grafana-operator"])
    {
        load("scripts/jenkins-scripts/buildHelmChart.groovy").build()
    }
  }
}