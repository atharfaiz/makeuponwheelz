!function(e){function t(e,t,s){var n=e[0];if(o=/er/.test(s)?b:/bl/.test(s)?p:f,active=s==g?{checked:n[f],disabled:n[p],indeterminate:"true"==e.attr(b)||"false"==e.attr(v)}:n[o],/^(ch|di|in)/.test(s)&&!active)i(e,o);else if(/^(un|en|de)/.test(s)&&active)a(e,o);else if(s==g)for(var o in active)active[o]?i(e,o,!0):a(e,o,!0);else t&&"toggle"!=s||(t||e[x]("ifClicked"),active?n[k]!==u&&a(e,o):i(e,o))}function i(t,i,s){var l=t[0],g=t.parent(),m=i==f,C=i==b,x=C?v:m?h:"enabled",A=n(l,x+o(l[k])),j=n(l,i+o(l[k]));if(l[i]!==!0){if(!s&&i==f&&l[k]==u&&l.name){var D=t.closest("form"),P='input[name="'+l.name+'"]';P=D.length?D.find(P):e(P),P.each(function(){this!==l&&e.data(this,c)&&a(e(this),i)})}C?(l[i]=!0,l[f]&&a(t,f,"force")):(s||(l[i]=!0),m&&l[b]&&a(t,b,!1)),r(t,m,i,s)}l[p]&&n(l,H,!0)&&g.find("."+d).css(H,"default"),g[y](j||n(l,i)),g[w](A||n(l,x)||"")}function a(e,t,i){var a=e[0],s=e.parent(),c=t==f,l=t==b,u=l?v:c?h:"enabled",g=n(a,u+o(a[k])),m=n(a,t+o(a[k]));a[t]!==!1&&((l||!i||"force"==i)&&(a[t]=!1),r(e,c,u,i)),!a[p]&&n(a,H,!0)&&s.find("."+d).css(H,"pointer"),s[w](m||n(a,t)||""),s[y](g||n(a,u))}function s(t,i){if(e.data(t,c)){var a=e(t);a.parent().html(a.attr("style",e.data(t,c).s||"")[x](i||"")),a.off(".i").unwrap(),e(A+'[for="'+t.id+'"]').add(a.closest(A)).off(".i")}}function n(t,i,a){return e.data(t,c)?e.data(t,c).o[i+(a?"":"Class")]:void 0}function o(e){return e.charAt(0).toUpperCase()+e.slice(1)}function r(e,t,i,a){a||(t&&e[x]("ifToggled"),e[x]("ifChanged")[x]("if"+o(i)))}var c="iCheck",d=c+"-helper",l="checkbox",u="radio",f="checked",h="un"+f,p="disabled",v="determinate",b="in"+v,g="update",k="type",m="click",C="touchbegin.i touchend.i",y="addClass",w="removeClass",x="trigger",A="label",H="cursor",j=/ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);e.fn[c]=function(n,o){var r=":"+l+", :"+u,h=e(),v=function(t){t.each(function(){var t=e(this);h=h.add(t.is(r)?t:t.find(r))})};if(/^(check|uncheck|toggle|indeterminate|determinate|disable|enable|update|destroy)$/i.test(n))return n=n.toLowerCase(),v(this),h.each(function(){"destroy"==n?s(this,"ifDestroyed"):t(e(this),!0,n),e.isFunction(o)&&o()});if("object"!=typeof n&&n)return this;var H=e.extend({checkedClass:f,disabledClass:p,indeterminateClass:b,labelHover:!0},n),D=H.handle,P=H.hoverClass||"hover",T=H.focusClass||"focus",F=H.activeClass||"active",I=!!H.labelHover,L=H.labelHoverClass||"hover",N=0|(""+H.increaseArea).replace("%","");return(D==l||D==u)&&(r=":"+D),-50>N&&(N=-50),v(this),h.each(function(){s(this);var n=e(this),o=this,r=o.id,h=-N+"%",v=100+2*N+"%",b={position:"absolute",top:h,left:h,display:"block",width:v,height:v,margin:0,padding:0,background:"#fff",border:0,opacity:0},D=j?{position:"absolute",visibility:"hidden"}:N?b:{position:"absolute",opacity:0},Q=o[k]==l?H.checkboxClass||"i"+l:H.radioClass||"i"+u,U=e(A+'[for="'+r+'"]').add(n.closest(A)),$=n.wrap('<div class="'+Q+'"/>')[x]("ifCreated").parent().append(H.insert),q=e('<ins class="'+d+'"/>').css(b).appendTo($);n.data(c,{o:H,s:n.attr("style")}).css(D),!!H.inheritClass&&$[y](o.className),!!H.inheritID&&r&&$.attr("id",c+"-"+r),"static"==$.css("position")&&$.css("position","relative"),t(n,!0,g),U.length&&U.on(m+".i mouseenter.i mouseleave.i "+C,function(i){var a=i[k],s=e(this);if(!o[p]){if(a==m?t(n,!1,!0):I&&(/ve|nd/.test(a)?($[w](P),s[w](L)):($[y](P),s[y](L))),!j)return!1;i.stopPropagation()}}),n.on(m+".i focus.i blur.i keyup.i keydown.i keypress.i",function(e){var t=e[k],s=e.keyCode;return t==m?!1:"keydown"==t&&32==s?(o[k]==u&&o[f]||(o[f]?a(n,f):i(n,f)),!1):void("keyup"==t&&o[k]==u?!o[f]&&i(n,f):/us|ur/.test(t)&&$["blur"==t?w:y](T))}),q.on(m+" mousedown mouseup mouseover mouseout "+C,function(e){var i=e[k],a=/wn|up/.test(i)?F:P;if(!o[p]){if(i==m?t(n,!1,!0):(/wn|er|in/.test(i)?$[y](a):$[w](a+" "+F),U.length&&I&&a==P&&U[/ut|nd/.test(i)?w:y](L)),!j)return!1;e.stopPropagation()}})})}}(jQuery);