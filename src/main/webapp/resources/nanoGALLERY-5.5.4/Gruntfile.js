module.exports=function(s){s.initConfig({pkg:s.file.readJSON("package.json"),cssmin:{target:{files:{"dist/css/nanogallery.min.css":"css/nanogallery.css","dist/css/nanogallery.woff.min.css":"css/nanogallery.woff.css","dist/css/themes/clean/nanogallery_clean.min.css":"css/themes/clean/nanogallery_clean.css","dist/css/themes/clean/nanogallery_clean.woff.min.css":"css/themes/clean/nanogallery_clean.woff.css","dist/css/themes/light/nanogallery_light.min.css":"css/themes/light/nanogallery_light.css","dist/css/themes/light/nanogallery_light.woff.min.css":"css/themes/light/nanogallery_light.woff.css"}}},uglify:{options:{preserveComments:"some"},build:{src:"jquery.<%= pkg.name %>.js",dest:"dist/jquery.<%= pkg.name %>.min.js"}}}),s.loadNpmTasks("grunt-contrib-uglify"),s.loadNpmTasks("grunt-contrib-cssmin"),s.registerTask("default",["uglify","cssmin"])};