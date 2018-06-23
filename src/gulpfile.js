var gulp = require('gulp');
var plumber = require('gulp-plumber');
var rename = require('gulp-rename');
var sass = require('gulp-sass');
var autoPrefixer = require('gulp-autoprefixer');
var gcmq = require('gulp-group-css-media-queries');
var cleanCss = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var print = require('gulp-print');
var sassGlob = require('gulp-sass-glob');
var babel = require("gulp-babel");
var browserSync = require('browser-sync');

var docs = '../catalog/view/theme/zoo/';
var subfolder = 'css';

gulp.task('browser-sync', function () {
    browserSync({
        proxy: "zoo.loc",
        notify: false
    });
});

gulp.task('sass', function () {
    subfolder = 'css';
    gulp.src(['./css/main.scss'])
        .pipe(plumber({
            handleError: function (err) {
                console.log(err);
                this.emit('end');
            }
        }))
        .pipe(sassGlob())
        .pipe(sass())
        .pipe(autoPrefixer(['last 15 versions']))
        .pipe(gcmq())
        .pipe(concat('main.css'))
        .pipe(gulp.dest(docs + 'stylesheet/'))
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(cleanCss({level: {1: {specialComments: 0}}}))
        .pipe(gulp.dest(docs + 'stylesheet/'))
});

gulp.task('js', function () {
    subfolder = 'js';
    gulp.src(['./js/*.js'])
        .pipe(babel())
        .pipe(concat('main.js'))
        .pipe(gulp.dest(docs + 'javascript/'))
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(uglify())
        .pipe(gulp.dest(docs + 'javascript/'))
});

gulp.task('images', function () {
    gulp.src(['./img/**/*'])
        .pipe(print())
        .pipe(plumber({
            handleError: function (err) {
                console.log(err);
                this.emit('end');
            }
        }))
        .pipe(imagemin({
            optimizationLevel: 3,
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant()],
            interlaced: true
        }))
        .pipe(gulp.dest(docs + 'image/'))
});

gulp.task('fonts', function () {
    return gulp.src('./fonts/**/*.*')
        .pipe(gulp.dest(docs + 'fonts/'))
});

gulp.task('watch', ['browser-sync'], function () {
    gulp.watch(['./css/**/*.scss', './css/main.scss'], ['sass', browserSync.reload]);
    gulp.watch('../catalog/view/theme/zoo/template/**/*.twig', [browserSync.reload]);
    gulp.watch('./js/!*.js', ['js', browserSync.reload]);
    gulp.watch('./img/!**/!*', ['images', browserSync.reload]);
});

gulp.task('default', ['watch']);