!function(t){"use strict";t.addHTML=function(t,e,i,n,a){if("undefined"==typeof html2canvas&&"undefined"==typeof rasterizeHTML)throw new Error("You need either https://github.com/niklasvh/html2canvas or https://github.com/cburgmer/rasterizeHTML.js");"number"!=typeof e&&(n=e,a=i),"function"==typeof n&&(a=n,n=null);var r=this.internal,h=r.scaleFactor,d=r.pageSize.width,o=r.pageSize.height;if(n=n||{},n.onrendered=function(t){e=parseInt(e)||0,i=parseInt(i)||0;var r=n.dim||{},s=r.h||0,f=r.w||Math.min(d,t.width/h)-e,u="JPEG";if(n.format&&(u=n.format),t.height>o&&n.pagesplit){var g=function(){for(var n=0;;){var r=document.createElement("canvas");r.width=Math.min(d*h,t.width),r.height=Math.min(o*h,t.height-n);var s=r.getContext("2d");s.drawImage(t,0,n,t.width,r.height,0,0,r.width,r.height);var g=[r,e,n?0:i,r.width/h,r.height/h,u,null,"SLOW"];if(this.addImage.apply(this,g),n+=r.height,n>=t.height)break;this.addPage()}a(f,n,null,g)}.bind(this);if("CANVAS"===t.nodeName){var m=new Image;m.onload=g,m.src=t.toDataURL("image/png"),t=m}else g()}else{var l=Math.random().toString(35),c=[t,e,i,f,s,u,l,"SLOW"];this.addImage.apply(this,c),a(f,s,l,c)}}.bind(this),"undefined"!=typeof html2canvas&&!n.rstz)return html2canvas(t,n);if("undefined"!=typeof rasterizeHTML){var s="drawDocument";return"string"==typeof t&&(s=/^http/.test(t)?"drawURL":"drawHTML"),n.width=n.width||d*h,rasterizeHTML[s](t,void 0,n).then(function(t){n.onrendered(t.image)},function(t){a(null,t)})}return null}}(jsPDF.API);