# PwaExample

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 17.0.9.

## Generating pwa app

You need Angular CLI installed to generate such app (`npm install -g @angular/cli`). \
Create a project (`ng new name-of-the-app --no-standalone`), `cd` there, then `ng add @angular/pwa`. All necessary files and dependencies for manifest and service worker conf are created. \
-> manifest.webmanifest - more modern approach of manifest.json
-> ngsw-config.json - config of service worker (caching and stuff).

## Build - start here from GIT

Run `ng build` to build the project. The build artifacts will be stored in the `dist/*name-of-the-app*/browser` directory.

## Running a server

To see the application working, it can be run on localhost. To run it, try: `npx http-server -p 8080 -c-1 dist/pwa-example/browser`. then, enter localhost on port 8080 and see the app working.

Go to Dev tools -> Application: \
-> Manifest: There are items from the manifest. \
-> Service workers: There should be a service worker registered. \
-> Storage: There should be info about cache.

## Working offline

To simulate network problems, go to Dev tools -> Network -> Throttling -> Offline. Try refreshing the page or navigating it (it should work).
When you try to refesh, in the Network panel you should see where the components are loaded from (Size column).
