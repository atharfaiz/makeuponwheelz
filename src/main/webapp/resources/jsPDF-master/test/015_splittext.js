!function(){var e=.5,t="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id eros turpis. Vivamus tempor urna vitae sapien mollis molestie. Vestibulum in lectus non enim bibendum laoreet at at libero. Etiam malesuada erat sed sem blandit in varius orci porttitor. Sed at sapien urna. Fusce augue ipsum, molestie et adipiscing at, varius quis enim. Morbi sed magna est, vel vestibulum urna. Sed tempor ipsum vel mi pretium at elementum urna tempor. Nulla faucibus consectetur felis, elementum venenatis mi mollis gravida. Aliquam mi ante, accumsan eu tempus vitae, viverra quis justo.\n\nProin feugiat augue in augue rhoncus eu cursus tellus laoreet. Pellentesque eu sapien at diam porttitor venenatis nec vitae velit. Donec ultrices volutpat lectus eget vehicula. Nam eu erat mi, in pulvinar eros. Mauris viverra porta orci, et vehicula lectus sagittis id. Nullam at magna vitae nunc fringilla posuere. Duis volutpat malesuada ornare. Nulla in eros metus. Vivamus a posuere libero. Proin ut placerat lectus. Duis vitae felis eget eros feugiat congue. Donec tempus, arcu a consectetur mollis, magna augue consequat augue, vel blandit eros ligula non tellus.",i=function(t){return t.setDrawColor(0,0,255).setLineWidth(1/72).line(e,e,e,11-e).line(8.5-e,e,8.5-e,11-e),t},a=function(a){var u=new a("p","in","letter"),n=16,s=12,l=u.setFontSize(n).splitTextToSize(t,7.5),r=u.splitTextToSize(t,7.5,{fontSize:s});i(u),u.text(.5,.5+n/72,l);var o=l.length*n/72+2*s/72;return u.setFontSize(s).text(.5,e+o,r),o+=r.length*s/72+2*s/72,r=u.splitTextToSize(t,7.5,{fontSize:s,fontStyle:"Italic",fontName:"Times"}),u.setFont("Times","Italic").text(.5,e+o,r),u};define(function(){return a})}();