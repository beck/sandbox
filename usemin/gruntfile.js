module.exports = function(grunt) {

  grunt.initConfig({
    clean: {
      dist: ['dist'],
    },
    copy: {
      main: {
        expand: true,
        cwd: 'src/',
        src: 'index.html',
        dest: 'dist/',
      },
    },
    uglify: {
      options: {
        sourceMap: true,
      },
    },
    useminPrepare: {
      html: 'src/index.html',
    },
    usemin: {
      html: 'dist/index.html',
    },
  });

  grunt.loadNpmTasks('grunt-usemin');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', [
    'clean',
    'copy',
    'useminPrepare',
    'concat',
    'uglify:generated',
    'usemin',
  ]);

}
