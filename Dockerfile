# Use Node.js as the base image
FROM node:18.19

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm config set registry https://registry.npmjs.org/
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

ENV NODE_ENV=development
ENV NEXT_PUBLIC_WEB3AUTH_NETWORK=testnet
ENV NEXT_PUBLIC_WEB3AUTH_CLIENT_ID=BKj3lr6GfN2CnvO4CIKo5fuoCg_TpHsAPK7R8lbl6kUlz0CAH_5mFNswScEb7M6szV4hd1Tkwa2oPZ9KiXJB-44
ENV NEXT_PUBLIC_GHOSTCLOUD_RPC_TARGET=localhost:9090
ENV NEXT_PUBLIC_GHOSTCLOUD_CHAIN_NAMESPACE=other
ENV NEXT_PUBLIC_GHOSTCLOUD_DISPLAY_NAME=Ghostcloud
ENV NEXT_PUBLIC_GHOSTCLOUD_CHAIN_ID=gc-local
ENV NEXT_PUBLIC_GHOSTCLOUD_ADDRESS_PREFIX=gc
ENV NEXT_PUBLIC_GHOSTCLOUD_DENOM=token
ENV NEXT_PUBLIC_GHOSTCLOUD_URL_SCHEME=http
ENV NEXT_PUBLIC_GHOSTCLOUD_URL_DOMAIN=localhost:8880
ENV NEXT_PUBLIC_GHOSTCLOUD_GAS_PRICE=0.000000025
ENV NEXT_PUBLIC_GHOSTCLOUD_GAS_LIMIT_MULTIPLIER=1.5

EXPOSE 3000

# Start the server using the production build
CMD [ "npm", "start" ]