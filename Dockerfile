# BUILD-USING: docker build -t derbyjs/derby-examples .
# RUN-USING: docker run -p 80:80 --name derby-examples --rm derbyjs/derby-examples

# specify base docker image
FROM dockerfile/nodejs

# copy over dependencies
WORKDIR /var
RUN mkdir derby-examples

ADD package.json /var/derby-examples/
ADD server.js /var/derby-examples/
ADD charts /var/derby-examples/charts
ADD chat /var/derby-examples/chat
ADD codemirror /var/derby-examples/codemirror
ADD directory /var/derby-examples/directory
ADD hello /var/derby-examples/hello
ADD sink /var/derby-examples/sink
ADD todos /var/derby-examples/todos
ADD widgets /var/derby-examples/widgets

# npm install all the things
WORKDIR /var/derby-examples
RUN npm install

# expose any ports we need
EXPOSE 8080
ENV PORT 8080
# the command that gets run inside the docker container
CMD ["/usr/local/bin/node", "/var/derby-examples/server.js"]
