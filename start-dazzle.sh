sudo /usr/bin/buildkitd --debug  --config ./buildkitd.toml &
mkdir -p /tmp/registry &
docker run -p 5000:5000 --name registry --rm -v /tmp/registry:/var/lib/registry registry:2