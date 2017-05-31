# Alpine Linux Angular Docker Image
A trivial Dockerfile which simply installs all basic [Angular](https://angular.io/) dependencies onto a vanilla [Alpine Linux](https://alpinelinux.org/) Docker image. 

## Getting Started

### Prerequisites
* Local [Docker](https://www.docker.com/) installation

### Install
`docker build . -t nextmetaphor/dockerized-alpine-angular`

## Deployment
```bash
$ docker run -v $(pwd)/src:/var/opt/angular -p 4200:4200 -w /var/opt/angular -it nextmetaphor/dockerized-alpine-angular sh
```

## Validation
```bash
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

/var/opt/angular # cd sample-app

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

From the local browser go to [http://localhost:4200/](http://localhost:4200/)