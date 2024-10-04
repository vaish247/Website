## Getting started

First install the npm dependencies:

```bash
npm install
```

Next, run the development server:

```bash
npm run dev
```

Finally, open [http://localhost:3000](http://localhost:3000) in your browser to view the website.

## Building and Running Docker Image

To build the docker image run this line:

docker build -t <name> . 

To run the docker image use this line:

docker run -p 3000:3000 <name>

