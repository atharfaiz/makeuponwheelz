function RainyDay(t,i,s,r,e,a){this.canvasid=t,this.canvas=document.getElementById(t),this.sourceid=i,this.img=document.getElementById(i),this.opacity=e?e:1,this.blurRadius=a?a:20,this.prepareBackground(s,r),this.w=this.canvas.width,this.h=this.canvas.height,this.prepareGlass(),this.drops=[],this.animateDrops(),this.reflection=this.REFLECTION_MINIATURE,this.trail=this.TRAIL_DROPS,this.gravity=this.GRAVITY_NON_LINEAR,this.VARIABLE_GRAVITY_THRESHOLD=3,this.VARIABLE_GRAVITY_ANGLE=Math.PI/2,this.VARIABLE_GRAVITY_ANGLE_VARIANCE=0,this.VARIABLE_FPS=15,this.VARIABLE_FILL_STYLE="#8ED6FF",this.VARIABLE_COLLISIONS=!0,this.REFLECTION_SCALEDOWN_FACTOR=5,this.REFLECTION_DROP_MAPPING_WIDTH=200,this.REFLECTION_DROP_MAPPING_HEIGHT=200,this.collision=this.COLLISION_SIMPLE}function Drop(t,i,s,r,e){this.x=Math.floor(i),this.y=Math.floor(s),this.r1=Math.random()*e+r,this.rainyday=t;var a=4;this.r2=.8*this.r1,this.linepoints=t.getLinepoints(a),this.context=t.context,this.reflection=t.reflected}function BlurStack(){this.r=0,this.g=0,this.b=0,this.a=0,this.next=null}function CollisionMatrix(t,i,s){this.resolution=s,this.xc=t,this.yc=i,this.matrix=new Array(t);for(var r=0;t+5>=r;r++){this.matrix[r]=Array(i);for(var e=0;i+5>=e;++e)this.matrix[r][e]=new DropItem(null)}}function DropItem(t){this.drop=t,this.next=null}RainyDay.prototype.animateDrops=function(){var t=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(t){window.setTimeout(t,1e3/this.rainyday.VARIABLE_FPS)};this.addDropCallback&&this.addDropCallback();for(var i=this.drops.slice(),s=[],r=0;r<i.length;++r)i[r].animate()&&s.push(i[r]);this.drops=s,t(this.animateDrops.bind(this))},RainyDay.prototype.prepareReflections=function(){this.reflected=document.createElement("canvas"),this.reflected.width=this.canvas.width/this.REFLECTION_SCALEDOWN_FACTOR,this.reflected.height=this.canvas.height/this.REFLECTION_SCALEDOWN_FACTOR;var t=this.reflected.getContext("2d");t.drawImage(this.img,0,0,this.reflected.width,this.reflected.height)},RainyDay.prototype.prepareGlass=function(){this.glass=document.createElement("canvas"),this.glass.width=this.canvas.width,this.glass.height=this.canvas.height,this.context=this.glass.getContext("2d")},RainyDay.prototype.preset=function(t,i,s){return{min:t,base:i,quan:s}},RainyDay.prototype.rain=function(t,i){if(this.reflection!=this.REFLECTION_NONE&&this.prepareReflections(),i>0){if(this.presets=t,this.PRIVATE_GRAVITY_FORCE_FACTOR_Y=.005*this.VARIABLE_FPS/25,this.PRIVATE_GRAVITY_FORCE_FACTOR_X=.005*(Math.PI/2-this.VARIABLE_GRAVITY_ANGLE)*this.VARIABLE_FPS/50,this.VARIABLE_COLLISIONS){for(var s=0,r=0;r<t.length;r++)t[r].base+t[r].min>s&&(s=Math.floor(t[r].base+t[r].min));if(s>0){var e=Math.ceil(this.w/s),a=Math.ceil(this.h/s);this.matrix=new CollisionMatrix(e,a,s)}else this.VARIABLE_COLLISIONS=!1}var h=0;this.addDropCallback=function(){var s=(new Date).getTime();if(!(i>s-h)){h=s;var r=this.canvas.getContext("2d");r.clearRect(0,0,this.canvas.width,this.canvas.height),r.drawImage(this.background,0,0,this.canvas.width,this.canvas.height);for(var e,a=Math.random(),n=0;n<t.length;n++)if(a<t[n].quan){e=t[n];break}e&&this.putDrop(new Drop(this,Math.random()*this.w,Math.random()*this.h,e.min,e.base)),r.save(),r.globalAlpha=this.opacity,r.drawImage(this.glass,0,0,this.canvas.width,this.canvas.height),r.restore()}}.bind(this)}else for(var r=0;r<t.length;r++)for(var n=t[r],o=0;o<n.quan;++o)this.putDrop(new Drop(this,Math.random()*this.w,Math.random()*this.h,n.min,n.base))},RainyDay.prototype.putDrop=function(t){t.draw(),this.gravity&&t.r1>this.VARIABLE_GRAVITY_THRESHOLD&&(this.VARIABLE_COLLISIONS&&this.matrix.update(t),this.drops.push(t))},RainyDay.prototype.clearDrop=function(t,i){var s=t.clear(i);if(s){var r=this.drops.indexOf(t);r>=0&&this.drops.splice(r,1)}return s},RainyDay.prototype.getLinepoints=function(t){var i={};i.first={x:0,y:1};var s,r,e,a,h,n={x:1,y:1},o=1,l=1;i.first.next=n;for(var d=0;t>d;d++)for(s=i.first;null!=s.next;){r=s.next,e=r.x-s.x,a=.5*(s.x+r.x),h=.5*(s.y+r.y),h+=e*(2*Math.random()-1);var R={x:a,y:h};o>h?o=h:h>l&&(l=h),R.next=r,s.next=R,s=r}if(l!=o){var p=1/(l-o);for(s=i.first;null!=s;)s.y=p*(s.y-o),s=s.next}else for(s=i.first;null!=s;)s.y=1,s=s.next;return i},Drop.prototype.draw=function(){var t,i,s,r,e,a=0;for(this.context.save(),this.context.beginPath(),t=this.linepoints.first,s=a,i=this.r2+.5*Math.random()*(this.r2-this.r1),r=this.x+i*Math.cos(s),e=this.y+i*Math.sin(s),this.context.lineTo(r,e);null!=t.next;)t=t.next,s=2*Math.PI*t.x+a,i=this.r2+.5*Math.random()*(this.r2-this.r1),r=this.x+i*Math.cos(s),e=this.y+i*Math.sin(s),this.context.lineTo(r,e);this.context.clip(),this.rainyday.reflection&&this.rainyday.reflection(this),this.context.restore()},Drop.prototype.clear=function(t){return this.context.clearRect(this.x-this.r1-1,this.y-this.r1-1,2*this.r1+2,2*this.r1+2),t?(this.terminate=!0,!0):this.y-this.r1>this.rainyday.h?!0:this.x-this.r1>this.rainyday.w||this.x+this.r1<0?!0:!1},Drop.prototype.animate=function(){if(this.terminate)return!1;var t=this.rainyday.gravity(this);if(!t&&this.rainyday.trail&&this.rainyday.trail(this),this.rainyday.VARIABLE_COLLISIONS){var i=this.rainyday.matrix.update(this,t);i&&this.rainyday.collision(this,i)}return!t||this.terminate},Drop.prototype.merge=function(t){},RainyDay.prototype.TRAIL_NONE=function(t){},RainyDay.prototype.TRAIL_DROPS=function(t){(!t.trail_y||t.y-t.trail_y>=10*Math.random()*t.r1)&&(t.trail_y=t.y,this.putDrop(new Drop(this,t.x,t.y-t.r1-5,0,Math.ceil(t.r1/5))))},RainyDay.prototype.TRAIL_SMUDGE=function(t){var i=(this.canvas.getContext("2d"),t.y-t.r1-2),s=t.x-t.r2+2*Math.random();if(!(0>i||0>s)){var r=t.r2;this.context.drawImage(this.img,s*this.img.width/this.w,i*this.img.height/this.h,r,2,s,i,r,2)}},RainyDay.prototype.GRAVITY_NONE=function(t){return!0},RainyDay.prototype.GRAVITY_LINEAR=function(t){return this.clearDrop(t)?!0:(t.yspeed?(t.yspeed+=this.PRIVATE_GRAVITY_FORCE_FACTOR_Y*Math.floor(t.r1),t.xspeed+=this.PRIVATE_GRAVITY_FORCE_FACTOR_X*Math.floor(t.r1)):(t.yspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_Y,t.xspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_X),t.y+=t.yspeed,t.draw(),!1)},RainyDay.prototype.GRAVITY_NON_LINEAR=function(t){return this.clearDrop(t)?!0:(t.collided?(t.collided=!1,t.seed=Math.floor(t.r1*Math.random()*this.VARIABLE_FPS),t.skipping=!1,t.slowing=!1):(!t.seed||t.seed<0)&&(t.seed=Math.floor(t.r1*Math.random()*this.VARIABLE_FPS),t.skipping=0==t.skipping?!0:!1,t.slowing=!0),t.seed--,t.yspeed?t.slowing?(t.yspeed/=1.1,t.xspeed/=1.1,t.yspeed<this.PRIVATE_GRAVITY_FORCE_FACTOR_Y&&(t.slowing=!1)):t.skipping?(t.yspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_Y,t.xspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_X):(t.yspeed+=1*this.PRIVATE_GRAVITY_FORCE_FACTOR_Y*Math.floor(t.r1),t.xspeed+=1*this.PRIVATE_GRAVITY_FORCE_FACTOR_X*Math.floor(t.r1)):(t.yspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_Y,t.xspeed=this.PRIVATE_GRAVITY_FORCE_FACTOR_X),0!=this.VARIABLE_GRAVITY_ANGLE_VARIANCE&&(t.xspeed+=(2*Math.random()-1)*this.VARIABLE_GRAVITY_ANGLE_VARIANCE),t.y+=t.yspeed,t.x+=t.xspeed,t.draw(),!1)},RainyDay.prototype.REFLECTION_NONE=function(t){this.context.fillStyle=this.VARIABLE_FILL_STYLE,this.context.fill()},RainyDay.prototype.REFLECTION_MINIATURE=function(t){var i=Math.max((t.x-this.REFLECTION_DROP_MAPPING_WIDTH)/this.REFLECTION_SCALEDOWN_FACTOR,0),s=Math.max((t.y-this.REFLECTION_DROP_MAPPING_HEIGHT)/this.REFLECTION_SCALEDOWN_FACTOR,0),r=Math.min(2*this.REFLECTION_DROP_MAPPING_WIDTH/this.REFLECTION_SCALEDOWN_FACTOR,this.reflected.width-i),e=Math.min(2*this.REFLECTION_DROP_MAPPING_HEIGHT/this.REFLECTION_SCALEDOWN_FACTOR,this.reflected.height-s);this.context.drawImage(this.reflected,i,s,r,e,t.x-t.r1,t.y-t.r1,2*t.r1,2*t.r1)},RainyDay.prototype.COLLISION_SIMPLE=function(t,i){for(var s,r=i;null!=r;){var e=r.drop;if(Math.sqrt(Math.pow(t.x-e.x,2)+Math.pow(t.y-e.y,2))<t.r1+e.r1){s=e;break}r=r.next}if(s){var a,h;t.y>s.y?(a=t,h=s):(a=s,h=t),this.clearDrop(h),this.clearDrop(a,!0),h.draw(),a.merge(h),h.r1=.8*Math.sqrt(h.r1*h.r1+a.r2*a.r2),h.r2=.8*h.r1,h.collided=!0}};var mul_table=[512,512,456,512,328,456,335,512,405,328,271,456,388,335,292,512,454,405,364,328,298,271,496,456,420,388,360,335,312,292,273,512,482,454,428,405,383,364,345,328,312,298,284,271,259,496,475,456,437,420,404,388,374,360,347,335,323,312,302,292,282,273,265,512,497,482,468,454,441,428,417,405,394,383,373,364,354,345,337,328,320,312,305,298,291,284,278,271,265,259,507,496,485,475,465,456,446,437,428,420,412,404,396,388,381,374,367,360,354,347,341,335,329,323,318,312,307,302,297,292,287,282,278,273,269,265,261,512,505,497,489,482,475,468,461,454,447,441,435,428,422,417,411,405,399,394,389,383,378,373,368,364,359,354,350,345,341,337,332,328,324,320,316,312,309,305,301,298,294,291,287,284,281,278,274,271,268,265,262,259,257,507,501,496,491,485,480,475,470,465,460,456,451,446,442,437,433,428,424,420,416,412,408,404,400,396,392,388,385,381,377,374,370,367,363,360,357,354,350,347,344,341,338,335,332,329,326,323,320,318,315,312,310,307,304,302,299,297,294,292,289,287,285,282,280,278,275,273,271,269,267,265,263,261,259],shg_table=[9,11,12,13,13,14,14,15,15,15,15,16,16,16,16,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24];RainyDay.prototype.prepareBackground=function(t,i){t&&i?(this.canvas.style.width=t+"px",this.canvas.style.height=i+"px",this.canvas.width=t,this.canvas.height=i):(t=this.canvas.width,i=this.canvas.height),this.background=document.createElement("canvas"),this.background.width=this.canvas.width,this.background.height=this.canvas.height;var s=this.background.getContext("2d");s.clearRect(0,0,t,i),s.drawImage(this.img,0,0,t,i),isNaN(this.blurRadius)||this.blurRadius<1||this.stackBlurCanvasRGB(0,0,t,i,this.blurRadius)},RainyDay.prototype.stackBlurCanvasRGB=function(t,i,s,r,e){e|=0;var a,h,n,o,l,d,R,p,y,c,A,_,I,E,u,f,x,g,m,T,O=this.background.getContext("2d"),C=O.getImageData(t,i,s,r),L=C.data,v=e+e+1,D=s-1,N=r-1,F=e+1,M=F*(F+1)/2,w=new BlurStack,V=w;for(n=1;v>n;n++)if(V=V.next=new BlurStack,n==F)var P=V;V.next=w;var G=null,b=null;R=d=0;var S=mul_table[e],Y=shg_table[e];for(h=0;r>h;h++){for(E=u=f=p=y=c=0,A=F*(x=L[d]),_=F*(g=L[d+1]),I=F*(m=L[d+2]),p+=M*x,y+=M*g,c+=M*m,V=w,n=0;F>n;n++)V.r=x,V.g=g,V.b=m,V=V.next;for(n=1;F>n;n++)o=d+((n>D?D:n)<<2),p+=(V.r=x=L[o])*(T=F-n),y+=(V.g=g=L[o+1])*T,c+=(V.b=m=L[o+2])*T,E+=x,u+=g,f+=m,V=V.next;for(G=w,b=P,a=0;s>a;a++)L[d]=p*S>>Y,L[d+1]=y*S>>Y,L[d+2]=c*S>>Y,p-=A,y-=_,c-=I,A-=G.r,_-=G.g,I-=G.b,o=R+((o=a+e+1)<D?o:D)<<2,E+=G.r=L[o],u+=G.g=L[o+1],f+=G.b=L[o+2],p+=E,y+=u,c+=f,G=G.next,A+=x=b.r,_+=g=b.g,I+=m=b.b,E-=x,u-=g,f-=m,b=b.next,d+=4;R+=s}for(a=0;s>a;a++){for(u=f=E=y=c=p=0,d=a<<2,A=F*(x=L[d]),_=F*(g=L[d+1]),I=F*(m=L[d+2]),p+=M*x,y+=M*g,c+=M*m,V=w,n=0;F>n;n++)V.r=x,V.g=g,V.b=m,V=V.next;for(l=s,n=1;e>=n;n++)d=l+a<<2,p+=(V.r=x=L[d])*(T=F-n),y+=(V.g=g=L[d+1])*T,c+=(V.b=m=L[d+2])*T,E+=x,u+=g,f+=m,V=V.next,N>n&&(l+=s);for(d=a,G=w,b=P,h=0;r>h;h++)o=d<<2,L[o]=p*S>>Y,L[o+1]=y*S>>Y,L[o+2]=c*S>>Y,p-=A,y-=_,c-=I,A-=G.r,_-=G.g,I-=G.b,o=a+((o=h+F)<N?o:N)*s<<2,p+=E+=G.r=L[o],y+=u+=G.g=L[o+1],c+=f+=G.b=L[o+2],G=G.next,A+=x=b.r,_+=g=b.g,I+=m=b.b,E-=x,u-=g,f-=m,b=b.next,d+=s}O.putImageData(C,t,i)},CollisionMatrix.prototype.update=function(t,i){if(t.gid){if(this.matrix[t.gmx][t.gmy].remove(t),i)return null;t.gmx=Math.floor(t.x/this.resolution),t.gmy=Math.floor(t.y/this.resolution),this.matrix[t.gmx][t.gmy].add(t);var s=this.collisions(t);if(s&&null!=s.next)return s.next}else t.gid=Math.random().toString(36).substr(2,9),t.gmx=Math.floor(t.x/this.resolution),t.gmy=Math.floor(t.y/this.resolution),this.matrix[t.gmx][t.gmy].add(t);return null},CollisionMatrix.prototype.collisions=function(t){var i=new DropItem(null),s=i;return i=this.addAll(i,t.gmx-1,t.gmy+1),i=this.addAll(i,t.gmx,t.gmy+1),i=this.addAll(i,t.gmx+1,t.gmy+1),s},CollisionMatrix.prototype.addAll=function(t,i,s){if(i>0&&s>0&&i<this.xc&&s<this.yc)for(var r=this.matrix[i][s];null!=r.next;)r=r.next,t.next=new DropItem(r.drop),t=t.next;return t},DropItem.prototype.add=function(t){for(var i=this;null!=i.next;)i=i.next;i.next=new DropItem(t)},DropItem.prototype.remove=function(t){for(var i=this,s=null;null!=i.next;)s=i,i=i.next,i.drop.gid==t.gid&&(s.next=i.next)};