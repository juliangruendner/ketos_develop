githubBase="git@github.com:juliangruendner/"
mlServiceRepos=("ketos_brain_api" "ketos_environment_api" "ketos_preprocessing" "ketos_gui" "ketos_atlas" "ketos_data" "ketos_app" "ketos_annotation")
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
