!function(t){"use strict";t.extend(t.fn.select2.defaults,{formatNoMatches:function(){return"Нічого не знайдено"},formatInputTooShort:function(t,n){var r=n-t.length,o=["","и","ів"],e=[2,0,1,1,1,2];return"Введіть буль ласка ще "+r+" символ"+o[r%100>4&&20>=r%100?2:e[Math.min(r%10,5)]]},formatInputTooLong:function(t,n){var r=t.length-n,o=["","и","ів"],e=[2,0,1,1,1,2];return"Введіть буль ласка на "+r+" символ"+o[r%100>4&&20>=r%100?2:e[Math.min(r%10,5)]]+" менше"},formatSelectionTooBig:function(t){var n=["","и","ів"],r=[2,0,1,1,1,2];return"Ви можете вибрати лише "+t+" елемент"+n[t%100>4&&20>=t%100?2:r[Math.min(t%10,5)]]},formatLoadMore:function(t){return"Завантаження даних..."},formatSearching:function(){return"Пошук..."}})}(jQuery);