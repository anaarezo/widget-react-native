'use strict';

var gulp          = require('gulp');
var imagemin      = require('gulp-imagemin');
var changed       = require('gulp-changed');
var less          = require('gulp-less');
var path          = require('path');
var clean         = require('gulp-clean');
var jshint        = require('gulp-jshint');
var connect       = require('gulp-connect');
var fileinclude   = require('gulp-file-include');
var browserSync   = require('browser-sync').create();
var sourcemaps    = require('gulp-sourcemaps');

var bases = {
    dev: 'dev/',
    build: 'build/'
};

var paths = {
    less: ['dev/less/*.less'],
    scripts: ['dev/js/**/*.js'],
    html: ['dev/**/*.html'],
    images: ['dev/images/**/*'],
    vendor: ['dev/vendor/**/*'],
    json: ['dev/json/*.json'],
};

gulp.task('clean', function() {
    return gulp.src(bases.build)
        .pipe(clean());
});

gulp.task('copy', function() {
    gulp.src(paths.vendor)
        .pipe(gulp.dest('build/vendor/'))
});

gulp.task('html', function () {
    return gulp.src(paths.html)
        .pipe(fileinclude({
          prefix: '@@',
          basepath: '@file'
        }))
        .pipe(gulp.dest(bases.build));
});

gulp.task('less', function () {
    return gulp.src(paths.less)
        .pipe(sourcemaps.init())
        .pipe(less({
        paths: [ path.join(__dirname, 'less', 'includes') ]
        }))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./build/css/'));
});


gulp.task('images', function () {
    return gulp.src(paths.images)
        .pipe(changed('build/images'))
        .pipe(imagemin({
            optimizationLevel: 5,
            progressive: true
        }))
        .pipe(gulp.dest('build/images'));
});

gulp.task('json', function () {
    return gulp.src(paths.json)
        .pipe(changed('build/json'))
        .pipe(imagemin({
            optimizationLevel: 5,
            progressive: true
        }))
        .pipe(gulp.dest('build/json'));
});

gulp.task('lint', function () {
  return gulp.src('./dev/js/**/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'))
    .pipe(jshint.reporter('fail'));
});

gulp.task('scripts', function () {
    return gulp.src(paths.scripts)
        .pipe(gulp.dest('build/js'));
});

gulp.task('html-watch', ['html'], function (done) {
    browserSync.reload();
    done();
});

gulp.task('scripts-watch', ['scripts'], function (done) {
    browserSync.reload();
    done();
});

gulp.task('images-watch', ['images'], function (done) {
    console.log('reload')
    browserSync.reload();
    done();
});

gulp.task('json-watch', ['json'], function (done) {
    console.log('reload')
    browserSync.reload();
    done();
});

gulp.task('copy-watch', ['copy'], function (done) {
    browserSync.reload();
    done();
});

gulp.task('serve', ['html', 'scripts', 'images', 'less', 'json', 'copy'], function() {

    browserSync.init({
        server: bases.build
    });

    gulp.watch(paths.html, ['html-watch']);
    gulp.watch(['./dev/js/**/*.js'], ['scripts-watch']);
    gulp.watch(['./dev/less/*.less'], ['less']);
    gulp.watch(paths.images, ['images-watch']);
    gulp.watch(paths.json, ['json-watch']);
    gulp.watch(paths.vendor, ['copy-watch']);
});

gulp.task('default', ['serve']);
gulp.task('build', ['default']);