!function(e){function t(e,t,n){var s=e[0];if(o=/er/.test(n)?b:/bl/.test(n)?h:f,active=n==g?{checked:s[f],disabled:s[h],indeterminate:"true"==e.attr(b)||"false"==e.attr(v)}:s[o],/^(ch|di|in)/.test(n)&&!active)i(e,o);else if(/^(un|en|de)/.test(n)&&active)a(e,o);else if(n==g)for(var o in active)active[o]?i(e,o,!0):a(e,o,!0);else t&&"toggle"!=n||(t||e[x]("ifClicked"),active?s[y]!==u&&a(e,o):i(e,o))}function i(t,i,n){var l=t[0],g=t.parent(),k=i==f,m=i==b,x=m?v:k?p:"enabled",A=s(t,x+o(l[y])),D=s(t,i+o(l[y]));if(l[i]!==!0){if(!n&&i==f&&l[y]==u&&l.name){var P=t.closest("form"),T='input[name="'+l.name+'"]';T=P.length?P.find(T):e(T),T.each(function(){this!==l&&e(this).data(c)&&a(e(this),i)})}m?(l[i]=!0,l[f]&&a(t,f,"force")):(n||(l[i]=!0),k&&l[b]&&a(t,b,!1)),r(t,k,i,n)}l[h]&&s(t,H,!0)&&g.find("."+d).css(H,"default"),g[C](D||s(t,i)||""),g[w](A||s(t,x)||"")}function a(e,t,i){var a=e[0],n=e.parent(),c=t==f,l=t==b,u=l?v:c?p:"enabled",g=s(e,u+o(a[y])),k=s(e,t+o(a[y]));a[t]!==!1&&((l||!i||"force"==i)&&(a[t]=!1),r(e,c,u,i)),!a[h]&&s(e,H,!0)&&n.find("."+d).css(H,"pointer"),n[w](k||s(e,t)||""),n[C](g||s(e,u)||"")}function n(t,i){t.data(c)&&(t.parent().html(t.attr("style",t.data(c).s||"")),i&&t[x](i),t.off(".i").unwrap(),e(A+'[for="'+t[0].id+'"]').add(t.closest(A)).off(".i"))}function s(e,t,i){return e.data(c)?e.data(c).o[t+(i?"":"Class")]:void 0}function o(e){return e.charAt(0).toUpperCase()+e.slice(1)}function r(e,t,i,a){a||(t&&e[x]("ifToggled"),e[x]("ifChanged")[x]("if"+o(i)))}var c="iCheck",d=c+"-helper",l="checkbox",u="radio",f="checked",p="un"+f,h="disabled",v="determinate",b="in"+v,g="update",y="type",k="click",m="touchbegin.i touchend.i",C="addClass",w="removeClass",x="trigger",A="label",H="cursor",D=/ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);e.fn[c]=function(s,o){var r='input[type="'+l+'"], input[type="'+u+'"]',p=e(),v=function(t){t.each(function(){var t=e(this);p=p.add(t.is(r)?t:t.find(r))})};if(/^(check|uncheck|toggle|indeterminate|determinate|disable|enable|update|destroy)$/i.test(s))return s=s.toLowerCase(),v(this),p.each(function(){var i=e(this);"destroy"==s?n(i,"ifDestroyed"):t(i,!0,s),e.isFunction(o)&&o()});if("object"!=typeof s&&s)return this;var H=e.extend({checkedClass:f,disabledClass:h,indeterminateClass:b,labelHover:!0},s),P=H.handle,T=H.hoverClass||"hover",j=H.focusClass||"focus",F=H.activeClass||"active",I=!!H.labelHover,L=H.labelHoverClass||"hover",N=0|(""+H.increaseArea).replace("%","");return(P==l||P==u)&&(r='input[type="'+P+'"]'),-50>N&&(N=-50),v(this),p.each(function(){var s=e(this);n(s);var o=this,r=o.id,p=-N+"%",v=100+2*N+"%",b={position:"absolute",top:p,left:p,display:"block",width:v,height:v,margin:0,padding:0,background:"#fff",border:0,opacity:0},P=D?{position:"absolute",visibility:"hidden"}:N?b:{position:"absolute",opacity:0},U=o[y]==l?H.checkboxClass||"i"+l:H.radioClass||"i"+u,Z=e(A+'[for="'+r+'"]').add(s.closest(A)),$=s.wrap('<div class="'+U+'"/>')[x]("ifCreated").parent().append(H.insert),q=e('<ins class="'+d+'"/>').css(b).appendTo($);s.data(c,{o:H,s:s.attr("style")}).css(P),!!H.inheritClass&&$[C](o.className||""),!!H.inheritID&&r&&$.attr("id",c+"-"+r),"static"==$.css("position")&&$.css("position","relative"),t(s,!0,g),Z.length&&Z.on(k+".i mouseover.i mouseout.i "+m,function(i){var a=i[y],n=e(this);if(!o[h]){if(a==k?t(s,!1,!0):I&&(/ut|nd/.test(a)?($[w](T),n[w](L)):($[C](T),n[C](L))),!D)return!1;i.stopPropagation()}}),s.on(k+".i focus.i blur.i keyup.i keydown.i keypress.i",function(e){var t=e[y],n=e.keyCode;return t==k?!1:"keydown"==t&&32==n?(o[y]==u&&o[f]||(o[f]?a(s,f):i(s,f)),!1):void("keyup"==t&&o[y]==u?!o[f]&&i(s,f):/us|ur/.test(t)&&$["blur"==t?w:C](j))}),q.on(k+" mousedown mouseup mouseover mouseout "+m,function(e){var i=e[y],a=/wn|up/.test(i)?F:T;if(!o[h]){if(i==k?t(s,!1,!0):(/wn|er|in/.test(i)?$[C](a):$[w](a+" "+F),Z.length&&I&&a==T&&Z[/ut|nd/.test(i)?w:C](L)),!D)return!1;e.stopPropagation()}})})}}(Zepto);