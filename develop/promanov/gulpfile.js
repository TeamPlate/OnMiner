
var gulp = require('gulp');
var browserify = require('browserify');
var source = require('vinyl-source-stream');
var reactify = require('reactify');

gulp.task('default', function() {
	var bundler = browserify({
		entries: ['./main.js']
	});

	return bundler
		.transform(reactify)
		.bundle()
		.pipe(source('main.js'))
		.pipe(gulp.dest('./web/js/'));
});
