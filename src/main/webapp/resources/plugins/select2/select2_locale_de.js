!function(e){"use strict";e.extend(e.fn.select2.defaults,{formatNoMatches:function(){return"Keine Übereinstimmungen gefunden"},formatInputTooShort:function(e,n){var t=n-e.length;return"Bitte "+t+" Zeichen mehr eingeben"},formatInputTooLong:function(e,n){var t=e.length-n;return"Bitte "+t+" Zeichen weniger eingeben"},formatSelectionTooBig:function(e){return"Sie können nur "+e+" Eintr"+(1===e?"ag":"äge")+" auswählen"},formatLoadMore:function(e){return"Lade mehr Ergebnisse..."},formatSearching:function(){return"Suche..."}})}(jQuery);