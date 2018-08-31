var jsPDF=function(t){"use strict";function e(e){var n={};this.subscribe=function(t,e,r){if("function"!=typeof e)return!1;n.hasOwnProperty(t)||(n[t]={});var o=Math.random().toString(35);return n[t][o]=[e,!!r],o},this.unsubscribe=function(t){for(var e in n)if(n[e][t])return delete n[e][t],!0;return!1},this.publish=function(r){if(n.hasOwnProperty(r)){var o=Array.prototype.slice.call(arguments,1),i=[];for(var a in n[r]){var s=n[r][a];try{s[0].apply(e,o)}catch(u){t.console&&console.error("jsPDF PubSub Error",u.message,u)}s[1]&&i.push(a)}i.length&&i.forEach(this.unsubscribe)}}}function n(i,a,s,u){var c={};"object"==typeof i&&(c=i,i=c.orientation,a=c.unit||a,s=c.format||s,u=c.compress||c.compressPdf||u),a=a||"mm",s=s||"a4",i=(""+(i||"P")).toLowerCase();var f,l,d,h,p,g,b,y,v,m=((""+s).toLowerCase(),!!u&&"function"==typeof Uint8Array),w=c.textColor||"0 g",j=c.drawColor||"0 G",P=c.fontSize||16,C=c.lineHeight||1.15,S=c.lineWidth||.200025,T=2,F=!1,O=[],A={},R={},k=0,L=[],x={},I=[],B=0,D=0,M=0,E={title:"",subject:"",author:"",keywords:"",creator:""},U={},N=new e(U),z=function(t){return t.toFixed(2)},H=function(t){return t.toFixed(3)},J=function(t){return("0"+parseInt(t)).slice(-2)},W=function(t){F?L[h].push(t):(M+=t.length+1,I.push(t))},q=function(){return T++,O[T]=M,W(T+" 0 obj"),T},G=function(){return T++,O[T]=function(){return M},T},X=function(t){O[t]=M},K=function(t){W("stream"),W(t),W("endstream")},Q=function(){var e,r,o,i,a,s,u,c,f;for(u=t.adler32cs||n.adler32cs,m&&"undefined"==typeof u&&(m=!1),e=1;k>=e;e++){if(q(),c=(p=x[e].width)*l,f=(g=x[e].height)*l,W("<</Type /Page"),W("/Parent 1 0 R"),W("/Resources 2 0 R"),W("/MediaBox [0 0 "+z(c)+" "+z(f)+"]"),W("/Contents "+(T+1)+" 0 R"),N.publish("putPage",{pageNumber:e,page:L[e]}),W(">>"),W("endobj"),r=L[e].join("\n"),q(),m){for(o=[],i=r.length;i--;)o[i]=r.charCodeAt(i);s=u.from(r),a=new Deflater(6),a.append(new Uint8Array(o)),r=a.flush(),o=new Uint8Array(r.length+6),o.set(new Uint8Array([120,156])),o.set(r,2),o.set(new Uint8Array([255&s,s>>8&255,s>>16&255,s>>24&255]),r.length+2),r=String.fromCharCode.apply(null,o),W("<</Length "+r.length+" /Filter [/FlateDecode]>>")}else W("<</Length "+r.length+">>");K(r),W("endobj")}O[1]=M,W("1 0 obj"),W("<</Type /Pages");var d="/Kids [";for(i=0;k>i;i++)d+=3+2*i+" 0 R ";W(d+"]"),W("/Count "+k),W(">>"),W("endobj")},Y=function(t){t.objectNumber=q(),W("<</BaseFont/"+t.PostScriptName+"/Type/Font"),"string"==typeof t.encoding&&W("/Encoding/"+t.encoding),W("/Subtype/Type1>>"),W("endobj")},V=function(){for(var t in A)A.hasOwnProperty(t)&&Y(A[t])},Z=function(){N.publish("putXobjectDict")},$=function(){W("/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]"),W("/Font <<");for(var t in A)A.hasOwnProperty(t)&&W("/"+t+" "+A[t].objectNumber+" 0 R");W(">>"),W("/XObject <<"),Z(),W(">>")},_=function(){V(),N.publish("putResources"),O[2]=M,W("2 0 obj"),W("<<"),$(),W(">>"),W("endobj"),N.publish("postPutResources")},tt=function(t,e,n){R.hasOwnProperty(e)||(R[e]={}),R[e][n]=t},et=function(t,e,n,r){var o="F"+(Object.keys(A).length+1).toString(10),i=A[o]={id:o,PostScriptName:t,fontName:e,fontStyle:n,encoding:r,metadata:{}};return tt(o,e,n),N.publish("addFont",i),o},nt=function(){for(var t="helvetica",e="times",n="courier",r="normal",o="bold",i="italic",a="bolditalic",s="StandardEncoding",u=[["Helvetica",t,r],["Helvetica-Bold",t,o],["Helvetica-Oblique",t,i],["Helvetica-BoldOblique",t,a],["Courier",n,r],["Courier-Bold",n,o],["Courier-Oblique",n,i],["Courier-BoldOblique",n,a],["Times-Roman",e,r],["Times-Bold",e,o],["Times-Italic",e,i],["Times-BoldItalic",e,a]],c=0,f=u.length;f>c;c++){var l=et(u[c][0],u[c][1],u[c][2],s),d=u[c][0].split("-");tt(l,d[0],d[1]||"")}N.publish("addFonts",{fonts:A,dictionary:R})},rt=function(e){return e.foo=function(){try{return e.apply(this,arguments)}catch(n){var r=n.stack||"";~r.indexOf(" at ")&&(r=r.split(" at ")[1]);var o="Error in function "+r.split("\n")[0].split("<")[0]+": "+n.message;if(!t.console)throw new Error(o);t.console.error(o,n),t.alert&&alert(o)}},e.foo.bar=e,e.foo},ot=function(t,e){var n,r,o,i,a,s,u,c,l;if(e=e||{},o=e.sourceEncoding||"Unicode",a=e.outputEncoding,(e.autoencode||a)&&A[f].metadata&&A[f].metadata[o]&&A[f].metadata[o].encoding&&(i=A[f].metadata[o].encoding,!a&&A[f].encoding&&(a=A[f].encoding),!a&&i.codePages&&(a=i.codePages[0]),"string"==typeof a&&(a=i[a]),a)){for(u=!1,s=[],n=0,r=t.length;r>n;n++)c=a[t.charCodeAt(n)],s.push(c?String.fromCharCode(c):t[n]),s[n].charCodeAt(0)>>8&&(u=!0);t=s.join("")}for(n=t.length;void 0===u&&0!==n;)t.charCodeAt(n-1)>>8&&(u=!0),n--;if(!u)return t;for(s=e.noBOM?[]:[254,255],n=0,r=t.length;r>n;n++){if(c=t.charCodeAt(n),l=c>>8,l>>8)throw new Error("Character at position "+n+" of string '"+t+"' exceeds 16bits. Cannot be encoded into UCS-2 BE");s.push(l),s.push(c-(l<<8))}return String.fromCharCode.apply(void 0,s)},it=function(t,e){return ot(t,e).replace(/\\/g,"\\\\").replace(/\(/g,"\\(").replace(/\)/g,"\\)")},at=function(){W("/Producer (jsPDF "+n.version+")");for(var t in E)E.hasOwnProperty(t)&&E[t]&&W("/"+t.substr(0,1).toUpperCase()+t.substr(1)+" ("+it(E[t])+")");var e=new Date,r=e.getTimezoneOffset(),o=0>r?"+":"-",i=Math.floor(Math.abs(r/60)),a=Math.abs(r%60),s=[o,J(i),"'",J(a),"'"].join("");W(["/CreationDate (D:",e.getFullYear(),J(e.getMonth()+1),J(e.getDate()),J(e.getHours()),J(e.getMinutes()),J(e.getSeconds()),s,")"].join(""))},st=function(){switch(W("/Type /Catalog"),W("/Pages 1 0 R"),y||(y="fullwidth"),y){case"fullwidth":W("/OpenAction [3 0 R /FitH null]");break;case"fullheight":W("/OpenAction [3 0 R /FitV null]");break;case"fullpage":W("/OpenAction [3 0 R /Fit]");break;case"original":W("/OpenAction [3 0 R /XYZ null null 1]");break;default:var t=""+y;"%"===t.substr(t.length-1)&&(y=parseInt(y)/100),"number"==typeof y&&W("/OpenAction [3 0 R /XYZ null null "+z(y)+"]")}switch(v||(v="continuous"),v){case"continuous":W("/PageLayout /OneColumn");break;case"single":W("/PageLayout /SinglePage");break;case"two":case"twoleft":W("/PageLayout /TwoColumnLeft");break;case"tworight":W("/PageLayout /TwoColumnRight")}b&&W("/PageMode /"+b),N.publish("putCatalog")},ut=function(){W("/Size "+(T+1)),W("/Root "+T+" 0 R"),W("/Info "+(T-1)+" 0 R")},ct=function(t,e){var n="string"==typeof e&&e.toLowerCase();if("string"==typeof t){var r=t.toLowerCase();o.hasOwnProperty(r)&&(t=o[r][0]/l,e=o[r][1]/l)}if(Array.isArray(t)&&(e=t[1],t=t[0]),n){switch(n.substr(0,1)){case"l":e>t&&(n="s");break;case"p":t>e&&(n="s")}"s"===n&&(d=t,t=e,e=d)}F=!0,L[++k]=[],x[k]={width:Number(t)||p,height:Number(e)||g},lt(k)},ft=function(){ct.apply(this,arguments),W(z(S*l)+" w"),W(j),0!==B&&W(B+" J"),0!==D&&W(D+" j"),N.publish("addPage",{pageNumber:k})},lt=function(t){t>0&&k>=t&&(h=t,p=x[t].width,g=x[t].height)},dt=function(t,e){var n;t=void 0!==t?t:A[f].fontName,e=void 0!==e?e:A[f].fontStyle;try{n=R[t][e]}catch(r){}if(!n)throw new Error("Unable to look up font label for font '"+t+"', '"+e+"'. Refer to getFontList() for available fonts.");return n},ht=function(){F=!1,T=2,I=[],O=[],W("%PDF-"+r),Q(),_(),q(),W("<<"),at(),W(">>"),W("endobj"),q(),W("<<"),st(),W(">>"),W("endobj");var t,e=M,n="0000000000";for(W("xref"),W("0 "+(T+1)),W(n+" 65535 f "),t=1;T>=t;t++){var o=O[t];W("function"==typeof o?(n+O[t]()).slice(-10)+" 00000 n ":(n+O[t]).slice(-10)+" 00000 n ")}return W("trailer"),W("<<"),ut(),W(">>"),W("startxref"),W(e),W("%%EOF"),F=!0,I.join("\n")},pt=function(t){var e="S";return"F"===t?e="f":"FD"===t||"DF"===t?e="B":("f"===t||"f*"===t||"B"===t||"B*"===t)&&(e=t),e},gt=function(){for(var t=ht(),e=t.length,n=new ArrayBuffer(e),r=new Uint8Array(n);e--;)r[e]=t.charCodeAt(e);return n},bt=function(){return new Blob([gt()],{type:"application/pdf"})},yt=rt(function(e,n){var r="dataur"===(""+e).substr(0,6)?"data:application/pdf;base64,"+btoa(ht()):0;switch(e){case void 0:return ht();case"save":if(navigator.getUserMedia&&(void 0===t.URL||void 0===t.URL.createObjectURL))return U.output("dataurlnewwindow");saveAs(bt(),n),"function"==typeof saveAs.unload&&t.setTimeout&&setTimeout(saveAs.unload,911);break;case"arraybuffer":return gt();case"blob":return bt();case"bloburi":case"bloburl":return t.URL&&t.URL.createObjectURL(bt())||void 0;case"datauristring":case"dataurlstring":return r;case"dataurlnewwindow":var o=t.open(r);if(o||"undefined"==typeof safari)return o;case"datauri":case"dataurl":return t.document.location.href=r;default:throw new Error('Output type "'+e+'" is not supported.')}});switch(a){case"pt":l=1;break;case"mm":l=72/25.4000508;break;case"cm":l=72/2.54000508;break;case"in":l=72;break;case"px":l=96/72;break;case"pc":l=12;break;case"em":l=12;break;case"ex":l=6;break;default:throw"Invalid unit: "+a}U.internal={pdfEscape:it,getStyle:pt,getFont:function(){return A[dt.apply(U,arguments)]},getFontSize:function(){return P},getLineHeight:function(){return P*C},write:function(t){W(1===arguments.length?t:Array.prototype.join.call(arguments," "))},getCoordinateString:function(t){return z(t*l)},getVerticalCoordinateString:function(t){return z((g-t)*l)},collections:{},newObject:q,newObjectDeferred:G,newObjectDeferredBegin:X,putStream:K,events:N,scaleFactor:l,pageSize:{get width(){return p},get height(){return g}},output:function(t,e){return yt(t,e)},getNumberOfPages:function(){return L.length-1},pages:L,out:W,f2:z,getPageInfo:function(t){var e=2*(t-1)+3;return{objId:e,pageNumber:t}},getCurrentPageInfo:function(){var t=2*(h-1)+3;return{objId:t,pageNumber:h}}},U.addPage=function(){return ft.apply(this,arguments),this},U.setPage=function(){return lt.apply(this,arguments),this},U.insertPage=function(t){return this.addPage(),this.movePage(h,t),this},U.movePage=function(t,e){if(t>e){for(var n=L[t],r=x[t],o=t;o>e;o--)L[o]=L[o-1],x[o]=x[o-1];L[e]=n,x[e]=r,this.setPage(e)}else if(e>t){for(var n=L[t],r=x[t],o=t;e>o;o++)L[o]=L[o+1],x[o]=x[o+1];L[e]=n,x[e]=r,this.setPage(e)}return this},U.deletePage=function(t){for(var e=t;k>e;e++)L[e]=L[e+1],x[e]=x[e+1];return k--,h>k&&(h=k),this.setPage(h),this},U.setDisplayMode=function(t,e,n){return y=t,v=e,b=n,this},U.text=function(t,e,n,r,o,i){function a(t){return t=t.split("	").join(Array(c.TabLen||9).join(" ")),it(t,r)}"number"==typeof t&&(d=n,n=e,e=t,t=d),"string"==typeof t&&(t=t.match(/[\n\r]/)?t.split(/\r\n|\r|\n/g):[t]),"string"==typeof o&&(i=o,o=null),"string"==typeof r&&(i=r,r=null),"number"==typeof r&&(o=r,r=null);var s,u="",h="Td";if(o){o*=Math.PI/180;var p=Math.cos(o),b=Math.sin(o);u=[z(p),z(b),z(-1*b),z(p),""].join(" "),h="Tm"}r=r||{},"noBOM"in r||(r.noBOM=!0),"autoencode"in r||(r.autoencode=!0);var y="";if(!0===r.stroke?this.lastTextWasStroke!==!0&&(y="1 Tr\n",this.lastTextWasStroke=!0):(this.lastTextWasStroke&&(y="0 Tr\n"),this.lastTextWasStroke=!1),!(t instanceof Array))throw new Error('Type of text must be string or Array. "'+t+'" is not recognized.');for(var v,m=t.concat(),j=[],S=m.length;S--;)j.push(a(m.shift()));var T=Math.ceil((g-n)*l/(P*C));if(T>=0&&T<j.length+1&&(s=j.splice(T-1)),i){var F,O=P*C,A=t.map(function(t){return this.getStringUnitWidth(t)*P/l},this);if("center"===i)e-=A[0]/2;else{if("right"!==i)throw new Error('Unrecognized alignment option, use "center" or "right".');e-=A[0]}for(F=e,t=j[0],v=1,S=j.length;S>v;v++){var R=A[v-1]-A[v];"center"===i&&(R/=2),t+=") Tj\n"+R+" -"+O+" Td ("+j[v],F+=R}}else t=j.join(") Tj\nT* (");return W("BT\n/"+f+" "+P+" Tf\n"+P*C+" TL\n"+y+w+"\n"+u+z(e*l)+" "+z((g-n)*l)+" "+h+"\n("+t+") Tj\nET"),s&&(this.addPage(),this.text(s,e,1.7*P/l)),this},U.lstext=function(t,e,n,r){for(var o=0,i=t.length;i>o;o++,e+=r)this.text(t[o],e,n)},U.line=function(t,e,n,r){return this.lines([[n-t,r-e]],t,e)},U.clip=function(){W("W"),W("S")},U.lines=function(t,e,n,r,o,i){var a,s,u,c,f,h,p,b,y,v,m;for("number"==typeof t&&(d=n,n=e,e=t,t=d),r=r||[1,1],W(H(e*l)+" "+H((g-n)*l)+" m "),a=r[0],s=r[1],c=t.length,v=e,m=n,u=0;c>u;u++)f=t[u],2===f.length?(v=f[0]*a+v,m=f[1]*s+m,W(H(v*l)+" "+H((g-m)*l)+" l")):(h=f[0]*a+v,p=f[1]*s+m,b=f[2]*a+v,y=f[3]*s+m,v=f[4]*a+v,m=f[5]*s+m,W(H(h*l)+" "+H((g-p)*l)+" "+H(b*l)+" "+H((g-y)*l)+" "+H(v*l)+" "+H((g-m)*l)+" c"));return i&&W(" h"),null!==o&&W(pt(o)),this},U.rect=function(t,e,n,r,o){pt(o);return W([z(t*l),z((g-e)*l),z(n*l),z(-r*l),"re"].join(" ")),null!==o&&W(pt(o)),this},U.triangle=function(t,e,n,r,o,i,a){return this.lines([[n-t,r-e],[o-n,i-r],[t-o,e-i]],t,e,[1,1],a,!0),this},U.roundedRect=function(t,e,n,r,o,i,a){var s=4/3*(Math.SQRT2-1);return this.lines([[n-2*o,0],[o*s,0,o,i-i*s,o,i],[0,r-2*i],[0,i*s,-(o*s),i,-o,i],[-n+2*o,0],[-(o*s),0,-o,-(i*s),-o,-i],[0,-r+2*i],[0,-(i*s),o*s,-i,o,-i]],t+o,e,[1,1],a),this},U.ellipse=function(t,e,n,r,o){var i=4/3*(Math.SQRT2-1)*n,a=4/3*(Math.SQRT2-1)*r;return W([z((t+n)*l),z((g-e)*l),"m",z((t+n)*l),z((g-(e-a))*l),z((t+i)*l),z((g-(e-r))*l),z(t*l),z((g-(e-r))*l),"c"].join(" ")),W([z((t-i)*l),z((g-(e-r))*l),z((t-n)*l),z((g-(e-a))*l),z((t-n)*l),z((g-e)*l),"c"].join(" ")),W([z((t-n)*l),z((g-(e+a))*l),z((t-i)*l),z((g-(e+r))*l),z(t*l),z((g-(e+r))*l),"c"].join(" ")),W([z((t+i)*l),z((g-(e+r))*l),z((t+n)*l),z((g-(e+a))*l),z((t+n)*l),z((g-e)*l),"c"].join(" ")),null!==o&&W(pt(o)),this},U.circle=function(t,e,n,r){return this.ellipse(t,e,n,n,r)},U.setProperties=function(t){for(var e in E)E.hasOwnProperty(e)&&t[e]&&(E[e]=t[e]);return this},U.setFontSize=function(t){return P=t,this},U.setFont=function(t,e){return f=dt(t,e),this},U.setFontStyle=U.setFontType=function(t){return f=dt(void 0,t),this},U.getFontList=function(){var t,e,n,r={};for(t in R)if(R.hasOwnProperty(t)){r[t]=n=[];for(e in R[t])R[t].hasOwnProperty(e)&&n.push(e)}return r},U.setLineWidth=function(t){return W((t*l).toFixed(2)+" w"),this},U.setDrawColor=function(t,e,n,r){var o;return o=void 0===e||void 0===r&&t===e===n?"string"==typeof t?t+" G":z(t/255)+" G":void 0===r?"string"==typeof t?[t,e,n,"RG"].join(" "):[z(t/255),z(e/255),z(n/255),"RG"].join(" "):"string"==typeof t?[t,e,n,r,"K"].join(" "):[z(t),z(e),z(n),z(r),"K"].join(" "),W(o),this},U.setFillColor=function(t,e,n,r){var o;return o=void 0===e||void 0===r&&t===e===n?"string"==typeof t?t+" g":z(t/255)+" g":void 0===r?"string"==typeof t?[t,e,n,"rg"].join(" "):[z(t/255),z(e/255),z(n/255),"rg"].join(" "):"string"==typeof t?[t,e,n,r,"k"].join(" "):[z(t),z(e),z(n),z(r),"k"].join(" "),W(o),this},U.setTextColor=function(t,e,n){if("string"==typeof t&&/^#[0-9A-Fa-f]{6}$/.test(t)){var r=parseInt(t.substr(1),16);t=r>>16&255,e=r>>8&255,n=255&r}return w=0===t&&0===e&&0===n||"undefined"==typeof e?H(t/255)+" g":[H(t/255),H(e/255),H(n/255),"rg"].join(" "),this},U.CapJoinStyles={0:0,butt:0,but:0,miter:0,1:1,round:1,rounded:1,circle:1,2:2,projecting:2,project:2,square:2,bevel:2},U.setLineCap=function(t){var e=this.CapJoinStyles[t];if(void 0===e)throw new Error("Line cap style of '"+t+"' is not recognized. See or extend .CapJoinStyles property for valid styles");return B=e,W(e+" J"),this},U.setLineJoin=function(t){var e=this.CapJoinStyles[t];if(void 0===e)throw new Error("Line join style of '"+t+"' is not recognized. See or extend .CapJoinStyles property for valid styles");return D=e,W(e+" j"),this},U.output=yt,U.save=function(t){U.output("save",t)};for(var vt in n.API)n.API.hasOwnProperty(vt)&&("events"===vt&&n.API.events.length?!function(t,e){var n,r,o;for(o=e.length-1;-1!==o;o--)n=e[o][0],r=e[o][1],t.subscribe.apply(t,[n].concat("function"==typeof r?[r]:r))}(N,n.API.events):U[vt]=n.API[vt]);return nt(),f="F1",ft(s,i),N.publish("initialized"),U}var r="1.3",o={a0:[2383.94,3370.39],a1:[1683.78,2383.94],a2:[1190.55,1683.78],a3:[841.89,1190.55],a4:[595.28,841.89],a5:[419.53,595.28],a6:[297.64,419.53],a7:[209.76,297.64],a8:[147.4,209.76],a9:[104.88,147.4],a10:[73.7,104.88],b0:[2834.65,4008.19],b1:[2004.09,2834.65],b2:[1417.32,2004.09],b3:[1000.63,1417.32],b4:[708.66,1000.63],b5:[498.9,708.66],b6:[354.33,498.9],b7:[249.45,354.33],b8:[175.75,249.45],b9:[124.72,175.75],b10:[87.87,124.72],c0:[2599.37,3676.54],c1:[1836.85,2599.37],c2:[1298.27,1836.85],c3:[918.43,1298.27],c4:[649.13,918.43],c5:[459.21,649.13],c6:[323.15,459.21],c7:[229.61,323.15],c8:[161.57,229.61],c9:[113.39,161.57],c10:[79.37,113.39],dl:[311.81,623.62],letter:[612,792],"government-letter":[576,756],legal:[612,1008],"junior-legal":[576,360],ledger:[1224,792],tabloid:[792,1224],"credit-card":[153,243]};return n.API={events:[]},n.version="1.0.0-trunk","function"==typeof define&&define.amd?define("jsPDF",function(){return n}):t.jsPDF=n,n}("undefined"!=typeof self&&self||"undefined"!=typeof window&&window||this);