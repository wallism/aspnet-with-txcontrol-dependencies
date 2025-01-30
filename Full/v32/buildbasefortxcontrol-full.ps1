# First - copy C:\Windows\Fonts (the whole folder) to this dir (then it is in context for the dockerfile, so it can copy into the image)
# change the tags (all 4 places) to todays date
docker build -t aspnet-with-txcontrol-dependencies-v32:4.8-windowsservercore-ltsc2022-20250130 .

# test locally
docker run -d --rm --name v32-txtextcontrol-test lpcontainerregistry.azurecr.io/aspnet-with-txcontrol-dependencies-v32:4.8-windowsservercore-ltsc2022-20250130
# tag with public repo prefix, so can push the update
docker tag aspnet-with-txcontrol-dependencies-v32:4.8-windowsservercore-ltsc2022-20250130 wallism/aspnet-with-txcontrol-dependencies-v32:4.8-windowsservercore-ltsc2022-20250130
# push to public repo (you need to login to dockerhub)
docker push wallism/aspnet-with-txcontrol-dependencies-v32:4.8-windowsservercore-ltsc2022-20250130
