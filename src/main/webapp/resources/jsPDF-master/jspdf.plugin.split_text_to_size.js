!function(n){"use strict";var t=n.getCharWidthsArray=function(n,t){t||(t={});var e,i,r,a=t.widths?t.widths:this.internal.getFont().metadata.Unicode.widths,s=a.fof?a.fof:1,h=t.kerning?t.kerning:this.internal.getFont().metadata.Unicode.kerning,o=h.fof?h.fof:1,l=0,f=a[0]||s,u=[];for(e=0,i=n.length;i>e;e++)r=n.charCodeAt(e),u.push((a[r]||f)/s+(h[r]&&h[r][l]||0)/o),l=r;return u},e=function(n){for(var t=n.length,e=0;t;)t--,e+=n[t];return e},i=n.getStringUnitWidth=function(n,i){return e(t.call(this,n,i))},r=function(n,t,e,i){for(var r=[],a=0,s=n.length,h=0;a!==s&&h+t[a]<e;)h+=t[a],a++;r.push(n.slice(0,a));var o=a;for(h=0;a!==s;)h+t[a]>i&&(r.push(n.slice(o,a)),h=0,o=a),h+=t[a],a++;return o!==a&&r.push(n.slice(o,a)),r},a=function(n,a,s){s||(s={});var h,o,l,f,u,c,d=[],g=[d],p=s.textIndent||0,v=0,k=0,m=n.split(" "),w=t(" ",s)[0];if(c=-1===s.lineIndent?m[0].length+2:s.lineIndent||0){var I=Array(c).join(" "),F=[];m.map(function(n){n=n.split(/\s*\n/),n.length>1?F=F.concat(n.map(function(n,t){return(t&&n.length?"\n":"")+n})):F.push(n[0])}),m=F,c=i(I,s)}for(l=0,f=m.length;f>l;l++){var A=0;if(h=m[l],c&&"\n"==h[0]&&(h=h.substr(1),A=1),o=t(h,s),k=e(o),p+v+k>a||A){if(k>a){for(u=r(h,o,a-(p+v),a),d.push(u.shift()),d=[u.pop()];u.length;)g.push([u.shift()]);k=e(o.slice(h.length-d[0].length))}else d=[h];g.push(d),p=k+c,v=w}else d.push(h),p+=v+k,v=w}if(c)var x=function(n,t){return(t?I:"")+n.join(" ")};else var x=function(n){return n.join(" ")};return g.map(x)};n.splitTextToSize=function(n,t,e){e||(e={});var i,r=e.fontSize||this.internal.getFontSize(),s=function(n){var t={0:1},e={};if(n.widths&&n.kerning)return{widths:n.widths,kerning:n.kerning};var i=this.internal.getFont(n.fontName,n.fontStyle),r="Unicode";return i.metadata[r]?{widths:i.metadata[r].widths||t,kerning:i.metadata[r].kerning||e}:{widths:t,kerning:e}}.call(this,e);i=Array.isArray(n)?n:n.split(/\r?\n/);var h=1*this.internal.scaleFactor*t/r;s.textIndent=e.textIndent?1*e.textIndent*this.internal.scaleFactor/r:0,s.lineIndent=e.lineIndent;var o,l,f=[];for(o=0,l=i.length;l>o;o++)f=f.concat(a(i[o],h,s));return f}}(jsPDF.API);