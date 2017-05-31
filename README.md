# Alpine Linux Angular Docker Image
A trivial Dockerfile which installs all basic [Angular](https://angular.io/) dependencies onto a vanilla [Alpine Linux](https://alpinelinux.org/) Docker image. Can be used for Angular development without needing to install the Angular libraries and dependencies (e.g. `node`, `npm` etc) onto your local machine.

## Getting Started

### Prerequisites
* Local [Docker](https://www.docker.com/) installation

### Install
To build this Docker image, simply run the command below, substituting the tag name with one of your choice if required.<br>
```
docker build . -t nextmetaphor/dockerized-alpine-angular
```

## Deployment
To execute a shell on the created image, simply run the command below.
```
$ docker run -v $(pwd)/src:/var/opt/angular -p 4200:4200 -w /var/opt/angular -it nextmetaphor/dockerized-alpine-angular sh
```
This will:
* mount `$(pwd)/src` on the host machine to `/var/opt/angular` on the Docker container. <br>*Ensure that the `src` directory directory exists within the current directory - this will be where the Angular project will reside.*
* publish port `4200` on the container to port `4200` on the host machine; we will use this to access the Angular application using a browser on [http://localhost:4200/](http://localhost:4200/)
* set the working directory on the container to `/var/opt/angular`
* execute a `sh` shell. The container will die when this shell process ends.

## Validation
To test that the Angular Docker image has been created successfully, we will create a new sample app in the default working directory of the container, serve the site and verify from a browser.

First, create a sample app called `sample-app` by executing the command `ng new sample-app` from the (current) `/var/opt/angular` directory within the container shell process:
```
/var/opt/angular # ng new sample-app

installing ng
  create .editorconfig
  create README.md
  create src/app/app.component.css
  create src/app/app.component.html
  create src/app/app.component.spec.ts
  create src/app/app.component.ts
  create src/app/app.module.ts
  create src/assets/.gitkeep
  create src/environments/environment.prod.ts
  create src/environments/environment.ts
  create src/favicon.ico
  create src/index.html
  create src/main.ts
  create src/polyfills.ts
  create src/styles.css
  create src/test.ts
  create src/tsconfig.app.json
  create src/tsconfig.spec.json
  create src/typings.d.ts
  create .angular-cli.json
  create e2e/app.e2e-spec.ts
  create e2e/app.po.ts
  create e2e/tsconfig.e2e.json
  create .gitignore
  create karma.conf.js
  create package.json
  create protractor.conf.js
  create tsconfig.json
  create tslint.json
Installing packages for tooling via npm.
Installed packages for tooling via npm.
Project 'sample-app' successfully created.
```

Set the currently directory to the newly created `sample-app` directory:
```
/var/opt/angular # cd sample-app
```

From this directory, serve the angular code using the `ng serve --host 0.0.0.0` command. *(Note that the `--host 0.0.0.0` parameter is important: without this, the site will be served on `localhost` which will not be accessible outside of the Docker container).* 
```
/var/opt/angular/sample-app # ng serve --host 0.0.0.0

** NG Live Development Server is listening on 0.0.0.0:4200, open your browser on http://localhost:4200 **
Hash: 0fd4e4806d63a19e34a4                                                              
Time: 13400ms
chunk    {0} polyfills.bundle.js, polyfills.bundle.js.map (polyfills) 158 kB {4} [initial] [rendered]
chunk    {1} main.bundle.js, main.bundle.js.map (main) 3.63 kB {3} [initial] [rendered]
chunk    {2} styles.bundle.js, styles.bundle.js.map (styles) 10.5 kB {4} [initial] [rendered]
chunk    {3} vendor.bundle.js, vendor.bundle.js.map (vendor) 2.4 MB [initial] [rendered]
chunk    {4} inline.bundle.js, inline.bundle.js.map (inline) 0 bytes [entry] [rendered]
webpack: Compiled successfully.
```

Verify that the app is successfully being served from [http://localhost:4200/](http://localhost:4200/) by accessing from a local browser.

## Licence ##
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.