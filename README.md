## Set up


## Run in dev mode
```
npm install
npm start
```

## Run in docker mode

1. build the Docker image
```
docker build -t my-react-app .
```
2. run a Docker container based on the image
```
docker run -p 3000:3000 my-react-app
```