module.exports=function(s){s.initConfig({qunit:{all:["test/*.html"]},uglify:{my_target:{files:{"build/summernote.min.js":["summernote.js"]}}},recess:{dist:{options:{compile:!0,compress:!0},files:{"build/summernote.css":["summernote.less"]}}}}),s.loadNpmTasks("grunt-contrib-qunit"),s.loadNpmTasks("grunt-contrib-uglify"),s.loadNpmTasks("grunt-recess"),s.registerTask("test","qunit"),s.registerTask("build",["uglify","recess"]),s.registerTask("default",["qunit","uglify","recess"])};