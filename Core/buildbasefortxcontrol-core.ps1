# First - copy C:\Windows\Fonts (the whole folder) to this dir (then it is in context for the dockerfile, so it can copy into the image)
# Then from the TxTextControl install dir, copy bin64 to this folder 
# change the tags (all 4 places) to todays date
docker build -t aspnetcore-with-txcontrol-dependencies-v32:8.0-windowsservercore-ltsc2022-20250130 .

# tag with public repo prefix, so can push the update
docker tag aspnetcore-with-txcontrol-dependencies-v32:8.0-windowsservercore-ltsc2022-20250130 wallism/aspnetcore-with-txcontrol-dependencies-v32:8.0-windowsservercore-ltsc2022-20250130
# push to public repo (you need to login to dockerhub)
docker push wallism/aspnetcore-with-txcontrol-dependencies-v32:8.0-windowsservercore-ltsc2022-20250130
