FROM node:alpine as builder
WWORKDIR ´/app´
CCOPY package.json . 
RRUN npm install
CCOPY . .
RRUN npm run build

FROM nginx
CCOPY --from=builder /app/build /usr/share/nginx/html

