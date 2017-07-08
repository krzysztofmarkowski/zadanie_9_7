REM -------------------------------
REM Przygotowanie katalogow
REM -------------------------------
md grafika-nieskompresowana
md images
md js
echo. >> js/scripts.js
md roboczy
md sass
echo. >>sass/style.sass
md css
echo. >> css/style.css
echo. >> index.html
md www
copy "E:\repo\AUTOMATYCZNE PRZYGOTOWANIE KATALOGU\reset.css" css
REM -------------------------------
REM Obsluga pliku .gitignore
REM -------------------------------
del .gitignore
echo *.sublime-project >> .gitignore
echo *.sublime-workspace >> .gitignore
echo start-grunt.bat >> .gitignore
echo .sass-cache >> .gitignore
echo /node_modules/* >> .gitignore
echo /grafika-nieskompresowana/* >> .gitignore
echo /roboczy/* >> .gitignore
echo /css/*.css.map >> .gitignore
echo /www/* >> .gitignore
REM -------------------------------
REM Tworzenie pliku gruntfile.js
REM -------------------------------
del gruntfile.js
echo module.exports = function(grunt) {  >> gruntfile.js
echo   // Project configuration.  >> gruntfile.js
echo   grunt.initConfig({  >> gruntfile.js
echo     sass: {  >> gruntfile.js
echo       options: {  >> gruntfile.js
echo         sourceMap: true  >> gruntfile.js
echo       },  >> gruntfile.js
echo       dist: {  >> gruntfile.js
echo         files: {  >> gruntfile.js
echo           'css/style.css': 'sass/style.sass'  >> gruntfile.js
echo         }  >> gruntfile.js
echo       }    >> gruntfile.js
echo     },  >> gruntfile.js
echo     imagemin: {  >> gruntfile.js
echo       dynamic: {  >> gruntfile.js
echo         files: [{  >> gruntfile.js
echo           expand: true,  >> gruntfile.js
echo           cwd: 'grafika-nieskompresowana/',  >> gruntfile.js
echo           src: ['**/*.{png,jpg,gif}'],  >> gruntfile.js
echo           dest: 'images/'  >> gruntfile.js
echo         }]  >> gruntfile.js
echo       }  >> gruntfile.js
echo     },  >> gruntfile.js
echo     jshint: {  >> gruntfile.js
echo          all: ['js/*.js']  >> gruntfile.js
echo     },  >> gruntfile.js
echo     watch: {  >> gruntfile.js
echo       scripts: {  >> gruntfile.js
echo           files: ['**/*.sass', 'js/*.js'],  >> gruntfile.js
echo           tasks: ['sass', 'jshint'],  >> gruntfile.js
echo           options: {  >> gruntfile.js
echo               spawn: false,  >> gruntfile.js
echo           },  >> gruntfile.js
echo       }  >> gruntfile.js
echo   }  >> gruntfile.js
echo   });  >> gruntfile.js
echo   // Load the plugins tasks   >> gruntfile.js
echo   grunt.loadNpmTasks('grunt-sass');  >> gruntfile.js
echo   grunt.loadNpmTasks('grunt-contrib-imagemin');  >> gruntfile.js
echo   grunt.loadNpmTasks('grunt-contrib-jshint');  >> gruntfile.js
echo   grunt.loadNpmTasks('grunt-contrib-watch');  >> gruntfile.js
echo   // Default task(s)  >> gruntfile.js
echo   grunt.registerTask('default', ['sass', 'imagemin', 'jshint', 'watch']);  >> gruntfile.js
echo };  >> gruntfile.js
REM -------------------------------
REM Utworzenie pliku startuj¹cego grunta
del start-grunt.bat
echo start grunt  >> start-grunt.bat
REM -------------------------------
REM Instalacja Grunta
call npm install -g grunt-cli
REM -------------------------------
REM Utworzenie package.json
call npm init
REM -------------------------------
REM Dodanie grunta do projektu
call npm install grunt --save-dev
REM -------------------------------
REM Plugin sass
call npm install --save-dev grunt-sass
REM -------------------------------
REM Pomniejszanie obrazków
call npm install --save-dev grunt-contrib-imagemin
REM -------------------------------
REM Automatyczna kompilacja sass
call npm install --save-dev grunt-contrib-watch
REM -------------------------------
REM Instalacja JS-hint
call npm install grunt grunt-contrib-jshint --save-dev
REM -------------------------------
REM Inicjacja Gita
call git init
