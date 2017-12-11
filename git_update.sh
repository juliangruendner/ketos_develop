githubBase="git@github.com:juliangruendner/"
mlServiceRepos=("mlService_mlServiceApi" "mlService_dockerApi" "mlService_dataPreprocessing" "mlService_frontend")
baseDir=$(pwd)

for repoName in ${mlServiceRepos[@]}
do
  curRepo="$baseDir/$repoName"
  if [ -d "$curRepo" ]
  then
        cd $curRepo
        echo "****updating git repo $repoName****"
        git pull
   else
        cd $baseDir
        echo "****initialising git repo $repoName****"
        git clone "$githubBase$repoName.git"
  fi
done