!function(n){"use strict";n.extend(n.fn.select2.defaults,{formatNoMatches:function(){return"Non se atoparon resultados"},formatInputTooShort:function(n,e){var t=e-n.length;return 1===t?"Engada un carácter":"Engada "+t+" caracteres"},formatInputTooLong:function(n,e){var t=n.length-e;return 1===t?"Elimine un carácter":"Elimine "+t+" caracteres"},formatSelectionTooBig:function(n){return 1===n?"Só pode seleccionar un elemento":"Só pode seleccionar "+n+" elementos"},formatLoadMore:function(n){return"Cargando máis resultados..."},formatSearching:function(){return"Buscando..."}})}(jQuery);