FROM node:18-slim
WORKDIR /Ying_Li_site
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm install -g serve
EXPOSE 7775
CMD ["serve", "-s", "build", "-l", "7775"]
