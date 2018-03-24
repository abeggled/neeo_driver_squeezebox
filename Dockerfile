FROM node:8.10.0

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
#RUN npm install --only=production

# Bundle app source
COPY . .

# Replace devicetype.js
RUN rm ./node_modules/neeo-sdk/lib/device/validation/devicetype.js
RUN mv ./devicetype.js ./node_modules/neeo-sdk/lib/device/validation/

VOLUME /config

EXPOSE 9010
CMD [ "node", "index.js" ]
