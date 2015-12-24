var path = require('path');

var filerevProcessor = function(grunt) {
  return {
    name: 'filerev',
    createConfig: function (context, block) {
      var files = {src: []};
      var summary = grunt.filerev.summary;
      // console.log('CREATIGN CONFIG!');
      // console.log(summary);
      // console.log(context);
      // console.log(context);
      context.inFiles.forEach(function (f) {
        var inFile = path.join(context.inDir, f);
        var hashedFile = summary[inFile];
        context.outFiles.push(hashedFile);
      });
      context.outDir = '';
      return {files: []};
    },
  };
};

module.exports = function(grunt) {

  grunt.initConfig({
    clean: {
      dist: ['dist'],
    },
    copy: {
      main: {
        expand: true,
        cwd: 'src/',
        src: '**',
        dest: 'dist/',
      },
    },
    filerev: {
      unminifiedSource: {
        src: 'dist/**/*.js',
      },
    },
    uglify: {
      options: {
        sourceMap: true,
      },
    },
    useminPrepare: {
      html: 'dist/index.html',
      options: {
        flow: {
          html: {
            steps: {
              js: [filerevProcessor(grunt), 'uglify'],
            },
          },
        },
      },
    },
    usemin: {
      html: 'dist/index.html',
    },
  });

  grunt.loadNpmTasks('grunt-filerev');
  grunt.loadNpmTasks('grunt-usemin');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', [
    'clean',
    'copy',
    'filerev',
    'useminPrepare',
    'uglify:generated',
    'usemin',
  ]);

}
