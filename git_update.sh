githubBase="git@github.com:juliangruendner/"
mlServiceRepos=("mlService_mlServiceApi" "mlService_dockerApi" "mlService_dataPreprocessing" "mlService_frontend" "mlService_atlas" "mlService_data-service_fhirOmop" "mlService_smartapps")
baseDir=$(pwd)

echo "****updating base repo Develop****"
git pull

for repoName in ${mlServiceRepos[@]}
do
  curRepo="$baseDir/$repoName"
  if [ ! -d "$curRepo" ]
  then
        cd $baseDir
        echo "****initialising git repo $repoName****"
        git clone "$githubBase$repoName.git"
  fi
done

ls | grep '\<mlService_' | xargs -P10 -I{} git --git-dir={}/.git --work-tree=$PWD/{} pull origin master
