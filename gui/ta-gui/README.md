# TaGui

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 1.2.6.

## Rodar atualmente
O projeto é antigo, com versão do node de 2018 mais ou menos, nesse caso precisamos mudar a versão, pode usar o nvm ou o fnm, prefiro o fnm pois ele muda por projeto.
```bash
curl -fsSL https://fnm.vercel.app/install | bash
```
uma vez instalado reinicia o terminal e ao entrar na pasta que tem o .node-version, ele ja pega a versão do node e do npm certa. Só aí podemos rodar `npm install`.

Aí podemos instalar o angular-cli, na versão 7.3.10, com:
```bash
npm install --save-dev @angular/cli@7.3.10
```
Isso vai instalar localmente, por projeto da mesma forma que o node e o npm específico, para rodar ele então vai sempre usar antes o comando `npx`, que ele chama o npm local, tipo
```bash
npx ng serve
```

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).
Before running the tests make sure you are serving the app via `ng serve`.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
