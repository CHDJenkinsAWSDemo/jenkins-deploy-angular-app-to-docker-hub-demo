@echo off
call npm run ng build
call npm run ng serve
REM echo Done > .done.txt
REM type .done.txt
echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'
REM curl http://localhost:4200
