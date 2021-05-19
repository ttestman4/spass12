set appName=spass12
@echo on
rd foo /s /q
mkdir foo
cd foo
call npm install @angular/cli --save
cd ..
call foo/node_modules/.bin/ng --version
call foo/node_modules/.bin/ng new --help
rd %appName% /s /q
git clone https://github.com/ttestman4/%appName%.git
call foo/node_modules/.bin/ng new spa --directory %appName% --create-application false --routing --style scss --strict -v  --defaults 
rd foo /s /q
cd %appName%
copy ..\newproj.cmd
copy ..\.eslintrc.json
call npm run ng -- g application spa1 -p spa  --routing --style scss --strict 
call npm run ng -- add @angular-eslint/schematics  --defaults --skip-confirmation
call npm run ng -- g library non-functional -p nf
call npm install @ngrx/store @ngrx/store-devtools @ngrx/effects  @ngrx/router-store @ngrx/entity @ngrx/component-store @ngrx/data @ngrx/component --save
call npm install @ngrx/schematics --save-dev
call npm install -D jest jest-preset-angular
call npm run ng -- add @angular/material --defaults --skip-confirmation
call code .
call npm install
call npm run ng -- build
call npm run ng -- lint
