var UITreeview=function(){var e=function(){$("#tree").dynatree({}),$("#tree2").dynatree({onActivate:function(e){alert("You activated "+e.data.title)},children:[{title:"Item 1"},{title:"Folder 2",isFolder:!0,key:"folder2",children:[{title:"Sub-item 2.1"},{title:"Sub-item 2.2"}]},{title:"Item 3"}]}),$("#tree3").dynatree({initAjax:{url:"assets/plugins/dynatree/tests/sample-data1.json"},onActivate:function(e){$("#echoActive").text(e.data.title)},onDeactivate:function(e){$("#echoActive").text("-")}});var e=[{title:"item1 with key and tooltip",tooltip:"Look, a tool tip!"},{title:"item2: selected on init"},{title:"Folder",isFolder:!0,key:"id3",children:[{title:"Sub-item 3.1",children:[{title:"Sub-item 3.1.1",key:"id3.1.1"},{title:"Sub-item 3.1.2",key:"id3.1.2"}]},{title:"Sub-item 3.2",children:[{title:"Sub-item 3.2.1",key:"id3.2.1"},{title:"Sub-item 3.2.2",key:"id3.2.2"}]}]},{title:"Document with some children (expanded on init)",key:"id4",children:[{title:"Sub-item 4.1 (active on init)",activate:!0,children:[{title:"Sub-item 4.1.1",key:"id4.1.1"},{title:"Sub-item 4.1.2",key:"id4.1.2"}]},{title:"Sub-item 4.2 (selected on init)",select:!0,children:[{title:"Sub-item 4.2.1",key:"id4.2.1"},{title:"Sub-item 4.2.2",key:"id4.2.2"}]},{title:"Sub-item 4.3 (hideCheckbox)",hideCheckbox:!0},{title:"Sub-item 4.4 (unselectable)",unselectable:!0}]}];$("#tree4").dynatree({checkbox:!0,classNames:{checkbox:"dynatree-radio"},selectMode:1,children:e,onActivate:function(e){$("#echoActive1").text(e.data.title)},onSelect:function(e,t){var i=t.tree.getSelectedNodes().join(", ");$("#echoSelection1").text(i)},onDblClick:function(e,t){e.toggleSelect()},onKeydown:function(e,t){return 32==t.which?(e.toggleSelect(),!1):void 0},cookieId:"dynatree-Cb1",idPrefix:"dynatree-Cb1-"}),$("#tree5").dynatree({checkbox:!0,selectMode:2,children:e,onSelect:function(e,t){var i=t.tree.getSelectedNodes(),n=$.map(i,function(e){return"["+e.data.key+"]: '"+e.data.title+"'"});$("#echoSelection3").text(n.join(", "))},onClick:function(e,t){"title"==e.getEventTargetType(t)&&e.toggleSelect()},onKeydown:function(e,t){return 32==t.which?(e.toggleSelect(),!1):void 0},cookieId:"dynatree-Cb2",idPrefix:"dynatree-Cb2-"}),$("#tree6").dynatree({initAjax:{url:"assets/plugins/dynatree/tests/sample-data1.json"},onLazyRead:function(e){e.appendAjax({url:"sample-data2.json",debugLazyDelay:750})},dnd:{preventVoidMoves:!0,onDragStart:function(e){return!0},onDragEnter:function(e,t){return e.parent!==t.parent?!1:["before","after"]},onDrop:function(e,t,i,n,o){t.move(e,i)}}})};return{init:function(){e()}}}();