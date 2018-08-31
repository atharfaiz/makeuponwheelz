!function(t){"use strict";var e,i,n,o,r=3,s=13,a={x:void 0,y:void 0,w:void 0,h:void 0,ln:void 0},h=1,l=function(t,e,i,n,o){a={x:t,y:e,w:i,h:n,ln:o}},d=function(){return a},f={left:0,top:0,bottom:0};t.setHeaderFunction=function(t){o=t},t.getTextDimensions=function(t){e=this.internal.getFont().fontName,i=this.table_font_size||this.internal.getFontSize(),n=this.internal.getFont().fontStyle;var o,r,s=19.049976/25.4;return r=document.createElement("font"),r.id="jsPDFCell",r.style.fontStyle=n,r.style.fontName=e,r.style.fontSize=i+"pt",r.textContent=t,document.body.appendChild(r),o={w:(r.offsetWidth+1)*s,h:(r.offsetHeight+1)*s},document.body.removeChild(r),o},t.cellAddPage=function(){var t=this.margins||f;this.addPage(),l(t.left,t.top,void 0,void 0),h+=1},t.cellInitialize=function(){a={x:void 0,y:void 0,w:void 0,h:void 0,ln:void 0},h=1},t.cell=function(t,e,i,n,o,a,h){var g=d();if(void 0!==g.ln)if(g.ln===a)t=g.x+g.w,e=g.y;else{var c=this.margins||f;g.y+g.h+n+s>=this.internal.pageSize.height-c.bottom&&(this.cellAddPage(),this.printHeaders&&this.tableHeaderRow&&this.printHeaderRow(a,!0)),e=d().y+d().h}if(void 0!==o[0])if(this.printingHeaderRow?this.rect(t,e,i,n,"FD"):this.rect(t,e,i,n),"right"===h){if(o instanceof Array)for(var v=0;v<o.length;v++){var u=o[v],p=this.getStringUnitWidth(u)*this.internal.getFontSize();this.text(u,t+i-p-r,e+this.internal.getLineHeight()*(v+1))}}else this.text(o,t+r,e+this.internal.getLineHeight());return l(t,e,i,n,a),this},t.arrayMax=function(t,e){var i,n,o,r=t[0];for(i=0,n=t.length;n>i;i+=1)o=t[i],e?-1===e(r,o)&&(r=o):o>r&&(r=o);return r},t.table=function(e,i,n,o,r){if(!n)throw"No data for PDF table";var s,l,d,g,c,v,u,p,w,H,m=[],y=[],b={},S={},x=[],R=[],z=!1,F=!0,P=12,T=f;if(T.width=this.internal.pageSize.width,r&&(r.autoSize===!0&&(z=!0),r.printHeaders===!1&&(F=!1),r.fontSize&&(P=r.fontSize),r.margins&&(T=r.margins)),this.lnMod=0,a={x:void 0,y:void 0,w:void 0,h:void 0,ln:void 0},h=1,this.printHeaders=F,this.margins=T,this.setFontSize(P),this.table_font_size=P,void 0===o||null===o)m=Object.keys(n[0]);else if(o[0]&&"string"!=typeof o[0]){var D=19.049976/25.4;for(l=0,d=o.length;d>l;l+=1)s=o[l],m.push(s.name),y.push(s.prompt),S[s.name]=s.width*D}else m=o;if(z)for(H=function(t){return t[s]},l=0,d=m.length;d>l;l+=1){for(s=m[l],b[s]=n.map(H),x.push(this.getTextDimensions(y[l]||s).w),v=b[s],u=0,g=v.length;g>u;u+=1)c=v[u],x.push(this.getTextDimensions(c).w);S[s]=t.arrayMax(x)}if(F){var C=this.calculateLineHeight(m,S,y.length?y:m);for(l=0,d=m.length;d>l;l+=1)s=m[l],R.push([e,i,S[s],C,String(y.length?y[l]:s)]);this.setTableHeaderRow(R),this.printHeaderRow(1,!1)}for(l=0,d=n.length;d>l;l+=1){var C;for(p=n[l],C=this.calculateLineHeight(m,S,p),u=0,w=m.length;w>u;u+=1)s=m[u],this.cell(e,i,S[s],C,p[s],l+2,s.align)}return this.lastCellPos=a,this.table_x=e,this.table_y=i,this},t.calculateLineHeight=function(t,e,i){for(var n,o=0,s=0;s<t.length;s++){n=t[s],i[n]=this.splitTextToSize(String(i[n]),e[n]-r);var a=this.internal.getLineHeight()*i[n].length+r;a>o&&(o=a)}return o},t.setTableHeaderRow=function(t){this.tableHeaderRow=t},t.printHeaderRow=function(t,e){if(!this.tableHeaderRow)throw"Property tableHeaderRow does not exist.";var i,n,r,s;if(this.printingHeaderRow=!0,void 0!==o){var a=o(this,h);l(a[0],a[1],a[2],a[3],-1)}this.setFontStyle("bold");var d=[];for(r=0,s=this.tableHeaderRow.length;s>r;r+=1)this.setFillColor(200,200,200),i=this.tableHeaderRow[r],e&&(i[1]=this.margins&&this.margins.top||0,d.push(i)),n=[].concat(i),this.cell.apply(this,n.concat(t));d.length>0&&this.setTableHeaderRow(d),this.setFontStyle("normal"),this.printingHeaderRow=!1}}(jsPDF.API);