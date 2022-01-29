# Alpine Linux Angular Docker Image
A trivial Dockerfile which installs all basic [Angular](https://angular.io/) dependencies onto a vanilla [Alpine Linux](https://alpinelinux.org/) Docker image. Can be used for Angular development without needing to install the Angular libraries and dependencies (e.g. `node`, `npm` etc) onto your local machine.

## Getting Started

### Prerequisites
* Local [Docker](https://www.docker.com/) installation

### Install
To build this Docker image, simply run the command below, substituting the tag name with one of your choice (if required).<br>
```
docker build . -t nextmetaphor/dockerized-alpine-angular
```

## Deployment
To execute a shell on the created image, simply run the command below.
```
$ docker run -v $(pwd)/src:/var/opt/angular -p 4200:4200 -w /var/opt/angular -it nextmetaphor/dockerized-alpine-angular sh
```

This will:

* mount `$(pwd)/src` on the host machine to `/var/opt/angular` on the Docker container. <br>*Ensure that the `src` directory directory exists within the current directory on the local machine - this will be where the Angular project will reside.*
* publish port `4200` on the container to port `4200` on the host machine; we will use this to access the Angular application using a browser on [http://localhost:4200/](http://localhost:4200/)
* set the working directory on the container to `/var/opt/angular`
* execute a `sh` shell. The container will die when this shell process is ended.

## Validation
To test that the Angular Docker image has been created successfully, we can create a new sample app in the default working directory of the container, serve the site and verify from a browser.

First, create a sample app called `sample-app` by executing the command `ng new sample-app` from the (current) `/var/opt/angular` directory within the container shell process:
```
/var/opt/angular # ng new sample-app
? Would you like to add Angular routing? No
? Which stylesheet format would you like to use? CSS
CREATE sample-app/README.md (1055 bytes)
CREATE sample-app/.editorconfig (274 bytes)
CREATE sample-app/.gitignore (548 bytes)
CREATE sample-app/angular.json (3063 bytes)
CREATE sample-app/package.json (1073 bytes)
CREATE sample-app/tsconfig.json (863 bytes)
CREATE sample-app/.browserslistrc (600 bytes)
CREATE sample-app/karma.conf.js (1427 bytes)
CREATE sample-app/tsconfig.app.json (287 bytes)
CREATE sample-app/tsconfig.spec.json (333 bytes)
CREATE sample-app/.vscode/extensions.json (130 bytes)
CREATE sample-app/.vscode/launch.json (474 bytes)
CREATE sample-app/.vscode/tasks.json (938 bytes)
CREATE sample-app/src/favicon.ico (948 bytes)
CREATE sample-app/src/index.html (295 bytes)
CREATE sample-app/src/main.ts (372 bytes)
CREATE sample-app/src/polyfills.ts (2338 bytes)
CREATE sample-app/src/styles.css (80 bytes)
CREATE sample-app/src/test.ts (745 bytes)
CREATE sample-app/src/assets/.gitkeep (0 bytes)
CREATE sample-app/src/environments/environment.prod.ts (51 bytes)
CREATE sample-app/src/environments/environment.ts (658 bytes)
CREATE sample-app/src/app/app.module.ts (314 bytes)
CREATE sample-app/src/app/app.component.css (0 bytes)
CREATE sample-app/src/app/app.component.html (23332 bytes)
CREATE sample-app/src/app/app.component.spec.ts (968 bytes)
CREATE sample-app/src/app/app.component.ts (214 bytes)
✔ Packages installed successfully.
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