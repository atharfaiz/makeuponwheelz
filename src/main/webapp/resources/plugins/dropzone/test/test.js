(function(){chai.should(),describe("Dropzone",function(){var e,t;return e=function(){return{name:"test file name",size:123456,type:"text/html"}},t=null,beforeEach(function(){return t=sinon.useFakeXMLHttpRequest()}),describe("static functions",function(){return describe("Dropzone.createElement()",function(){var e;return e=Dropzone.createElement('<div class="test"><span>Hallo</span></div>'),it("should properly create an element from a string",function(){return e.tagName.should.equal("DIV")}),it("should properly add the correct class",function(){return e.classList.contains("test").should.be.ok}),it("should properly create child elements",function(){return e.querySelector("span").tagName.should.equal("SPAN")}),it("should always return only one element",function(){return e=Dropzone.createElement("<div></div><span></span>"),e.tagName.should.equal("DIV")})}),describe("Dropzone.elementInside()",function(){var e,t,o;return o=Dropzone.createElement('<div id="test"><div class="child1"><div class="child2"></div></div></div>'),document.body.appendChild(o),e=o.querySelector(".child1"),t=o.querySelector(".child2"),after(function(){return document.body.removeChild(o)}),it("should return yes if elements are the same",function(){return Dropzone.elementInside(o,o).should.be.ok}),it("should return yes if element is direct child",function(){return Dropzone.elementInside(e,o).should.be.ok}),it("should return yes if element is some child",function(){return Dropzone.elementInside(t,o).should.be.ok,Dropzone.elementInside(t,document.body).should.be.ok}),it("should return no unless element is some child",function(){return Dropzone.elementInside(o,e).should.not.be.ok,Dropzone.elementInside(document.body,e).should.not.be.ok})}),describe("Dropzone.optionsForElement()",function(){var e,t;return t={url:"/some/url",method:"put"},before(function(){return Dropzone.options.testElement=t}),after(function(){return delete Dropzone.options.testElement}),e=document.createElement("div"),it("should take options set in Dropzone.options from camelized id",function(){return e.id="test-element",Dropzone.optionsForElement(e).should.equal(t)}),it("should return undefined if no options set",function(){return e.id="test-element2",expect(Dropzone.optionsForElement(e)).to.equal(void 0)})}),describe("Dropzone.forElement()",function(){var e,t;return t=document.createElement("div"),t.id="some-test-element",e=null,before(function(){return document.body.appendChild(t),e=new Dropzone(t,{url:"/test"})}),after(function(){return e.disable(),document.body.removeChild(t)}),it("should throw an exception if no dropzone attached",function(){return expect(function(){return Dropzone.forElement(document.createElement("div"))}).to["throw"]("No Dropzone found for given element. This is probably because you're trying to access it before Dropzone had the time to initialize. Use the `init` option to setup any additional observers on your Dropzone.")}),it("should accept css selectors",function(){return expect(Dropzone.forElement("#some-test-element")).to.equal(e)}),it("should accept native elements",function(){return expect(Dropzone.forElement(t)).to.equal(e)})}),describe("Dropzone.discover()",function(){var e,t,o;return e=document.createElement("div"),e.className="dropzone",t=e.cloneNode(),o=e.cloneNode(),e.id="test-element-1",t.id="test-element-2",o.id="test-element-3",describe("specific options",function(){return before(function(){return Dropzone.options.testElement1={url:"test-url"},Dropzone.options.testElement2=!1,document.body.appendChild(e),document.body.appendChild(t),Dropzone.discover()}),after(function(){return document.body.removeChild(e),document.body.removeChild(t)}),it("should find elements with a .dropzone class",function(){return e.dropzone.should.be.ok}),it("should not create dropzones with disabled options",function(){return expect(t.dropzone).to.not.be.ok})}),describe("Dropzone.autoDiscover",function(){return before(function(){return Dropzone.options.testElement3={url:"test-url"},document.body.appendChild(o)}),after(function(){return document.body.removeChild(o)}),it("should create dropzones even if Dropzone.autoDiscover == false",function(){return Dropzone.autoDiscover=!1,Dropzone.discover(),expect(o.dropzone).to.be.ok}),it("should not automatically be called if Dropzone.autoDiscover == false",function(){return Dropzone.autoDiscover=!1,Dropzone.discover=function(){return expect(!1).to.be.ok},Dropzone._autoDiscoverFunction()})})}),describe("Dropzone.isValidFile()",function(){return it("should return true if called without acceptedFiles",function(){return Dropzone.isValidFile({type:"some/type"},null).should.be.ok}),it("should properly validate if called with concrete mime types",function(){var e;return e="text/html,image/jpeg,application/json",Dropzone.isValidFile({type:"text/html"},e).should.be.ok,Dropzone.isValidFile({type:"image/jpeg"},e).should.be.ok,Dropzone.isValidFile({type:"application/json"},e).should.be.ok,Dropzone.isValidFile({type:"image/bmp"},e).should.not.be.ok}),it("should properly validate if called with base mime types",function(){var e;return e="text/*,image/*,application/*",Dropzone.isValidFile({type:"text/html"},e).should.be.ok,Dropzone.isValidFile({type:"image/jpeg"},e).should.be.ok,Dropzone.isValidFile({type:"application/json"},e).should.be.ok,Dropzone.isValidFile({type:"image/bmp"},e).should.be.ok,Dropzone.isValidFile({type:"some/type"},e).should.not.be.ok}),it("should properly validate if called with mixed mime types",function(){var e;return e="text/*,image/jpeg,application/*",Dropzone.isValidFile({type:"text/html"},e).should.be.ok,Dropzone.isValidFile({type:"image/jpeg"},e).should.be.ok,Dropzone.isValidFile({type:"image/bmp"},e).should.not.be.ok,Dropzone.isValidFile({type:"application/json"},e).should.be.ok,Dropzone.isValidFile({type:"some/type"},e).should.not.be.ok}),it("should properly validate even with spaces in between",function(){var e;return e="text/html ,   image/jpeg, application/json",Dropzone.isValidFile({type:"text/html"},e).should.be.ok,Dropzone.isValidFile({type:"image/jpeg"},e).should.be.ok}),it("should properly validate extensions",function(){var e;return e="text/html ,    image/jpeg, .pdf  ,.png",Dropzone.isValidFile({name:"somxsfsd",type:"text/html"},e).should.be.ok,Dropzone.isValidFile({name:"somesdfsdf",type:"image/jpeg"},e).should.be.ok,Dropzone.isValidFile({name:"somesdfadfadf",type:"application/json"},e).should.not.be.ok,Dropzone.isValidFile({name:"some-file file.pdf",type:"random/type"},e).should.be.ok,Dropzone.isValidFile({name:"some-file.pdf file.gif",type:"random/type"},e).should.not.be.ok,Dropzone.isValidFile({name:"some-file file.png",type:"random/type"},e).should.be.ok})}),describe("Dropzone.confirm",function(){return beforeEach(function(){return sinon.stub(window,"confirm")}),afterEach(function(){return window.confirm.restore()}),it("should forward to window.confirm and call the callbacks accordingly",function(){var e,t;return e=t=!1,window.confirm.returns(!0),Dropzone.confirm("test question",function(){return e=!0},function(){return t=!0}),window.confirm.args[0][0].should.equal("test question"),e.should.equal(!0),t.should.equal(!1),e=t=!1,window.confirm.returns(!1),Dropzone.confirm("test question 2",function(){return e=!0},function(){return t=!0}),window.confirm.args[1][0].should.equal("test question 2"),e.should.equal(!1),t.should.equal(!0)}),it("should not error if rejected is not provided",function(){var e,t;return e=t=!1,window.confirm.returns(!1),Dropzone.confirm("test question",function(){return e=!0}),window.confirm.args[0][0].should.equal("test question"),e.should.equal(!1),t.should.equal(!1)})})}),describe("Dropzone.getElement() / getElements()",function(){var e;return e=[],beforeEach(function(){return e=[],e.push(Dropzone.createElement('<div class="tmptest"></div>')),e.push(Dropzone.createElement('<div id="tmptest1" class="random"></div>')),e.push(Dropzone.createElement('<div class="random div"></div>')),e.forEach(function(e){return document.body.appendChild(e)})}),afterEach(function(){return e.forEach(function(e){return document.body.removeChild(e)})}),describe(".getElement()",function(){return it("should accept a string",function(){var t;return t=Dropzone.getElement(".tmptest"),t.should.equal(e[0]),t=Dropzone.getElement("#tmptest1"),t.should.equal(e[1])}),it("should accept a node",function(){var t;return t=Dropzone.getElement(e[2]),t.should.equal(e[2])}),it("should fail if invalid selector",function(){var e;return e="Invalid `clickable` option provided. Please provide a CSS selector or a plain HTML element.",expect(function(){return Dropzone.getElement("lblasdlfsfl","clickable")}).to["throw"](e),expect(function(){return Dropzone.getElement({lblasdlfsfl:"lblasdlfsfl"},"clickable")}).to["throw"](e),expect(function(){return Dropzone.getElement(["lblasdlfsfl"],"clickable")}).to["throw"](e)})}),describe(".getElements()",function(){return it("should accept a list of strings",function(){var t;return t=Dropzone.getElements([".tmptest","#tmptest1"]),t.should.eql([e[0],e[1]])}),it("should accept a list of nodes",function(){var t;return t=Dropzone.getElements([e[0],e[2]]),t.should.eql([e[0],e[2]])}),it("should accept a mixed list",function(){var t;return t=Dropzone.getElements(["#tmptest1",e[2]]),t.should.eql([e[1],e[2]])}),it("should accept a string selector",function(){var t;return t=Dropzone.getElements(".random"),t.should.eql([e[1],e[2]])}),it("should accept a single node",function(){var t;return t=Dropzone.getElements(e[1]),t.should.eql([e[1]])}),it("should fail if invalid selector",function(){var e;return e="Invalid `clickable` option provided. Please provide a CSS selector, a plain HTML element or a list of those.",expect(function(){return Dropzone.getElements("lblasdlfsfl","clickable")}).to["throw"](e),expect(function(){return Dropzone.getElements(["lblasdlfsfl"],"clickable")}).to["throw"](e)})})}),describe("constructor()",function(){var e;return e=null,afterEach(function(){return null!=e?e.destroy():void 0}),it("should throw an exception if the element is invalid",function(){return expect(function(){return e=new Dropzone("#invalid-element")}).to["throw"]("Invalid dropzone element.")}),it("should throw an exception if assigned twice to the same element",function(){var t;return t=document.createElement("div"),e=new Dropzone(t,{url:"url"}),expect(function(){return new Dropzone(t,{url:"url"})}).to["throw"]("Dropzone already attached.")}),it("should throw an exception if both acceptedFiles and acceptedMimeTypes are specified",function(){var t;return t=document.createElement("div"),expect(function(){return e=new Dropzone(t,{url:"test",acceptedFiles:"param",acceptedMimeTypes:"types"})}).to["throw"]("You can't provide both 'acceptedFiles' and 'acceptedMimeTypes'. 'acceptedMimeTypes' is deprecated.")}),it("should set itself as element.dropzone",function(){var t;return t=document.createElement("div"),e=new Dropzone(t,{url:"url"}),t.dropzone.should.equal(e)}),it("should use the action attribute not the element with the name action",function(){var t;return t=Dropzone.createElement('<form action="real-action"><input type="hidden" name="action" value="wrong-action" /></form>'),e=new Dropzone(t),e.options.url.should.equal("real-action")}),describe("options",function(){var t,o;return t=null,o=null,beforeEach(function(){return t=document.createElement("div"),t.id="test-element",o=document.createElement("div"),o.id="test-element2",Dropzone.options.testElement={url:"/some/url",parallelUploads:10}}),afterEach(function(){return delete Dropzone.options.testElement}),it("should take the options set in Dropzone.options",function(){return e=new Dropzone(t),e.options.url.should.equal("/some/url"),e.options.parallelUploads.should.equal(10)}),it("should prefer passed options over Dropzone.options",function(){return e=new Dropzone(t,{url:"/some/other/url"}),e.options.url.should.equal("/some/other/url")}),it("should take the default options if nothing set in Dropzone.options",function(){return e=new Dropzone(o,{url:"/some/url"}),e.options.parallelUploads.should.equal(2)}),it("should call the fallback function if forceFallback == true",function(o){return e=new Dropzone(t,{url:"/some/other/url",forceFallback:!0,fallback:function(){return o()}})}),it("should set acceptedFiles if deprecated acceptedMimetypes option has been passed",function(){return e=new Dropzone(t,{url:"/some/other/url",acceptedMimeTypes:"my/type"}),e.options.acceptedFiles.should.equal("my/type")}),describe("options.clickable",function(){var o;return o=null,e=null,beforeEach(function(){return o=document.createElement("div"),o.className="some-clickable",document.body.appendChild(o)}),afterEach(function(){return document.body.removeChild(o),null!=e?e.destroy:void 0}),it("should use the default element if clickable == true",function(){return e=new Dropzone(t,{clickable:!0}),e.clickableElements.should.eql([e.element])}),it("should lookup the element if clickable is a CSS selector",function(){return e=new Dropzone(t,{clickable:".some-clickable"}),e.clickableElements.should.eql([o])}),it("should simply use the provided element",function(){return e=new Dropzone(t,{clickable:o}),e.clickableElements.should.eql([o])}),it("should accept multiple clickable elements",function(){return e=new Dropzone(t,{clickable:[document.body,".some-clickable"]}),e.clickableElements.should.eql([document.body,o])}),it("should throw an exception if the element is invalid",function(){return expect(function(){return e=new Dropzone(t,{clickable:".some-invalid-clickable"})}).to["throw"]("Invalid `clickable` option provided. Please provide a CSS selector, a plain HTML element or a list of those.")})})})}),describe("init()",function(){return describe("clickable",function(){var e,t,o,n;t={"using acceptedFiles":new Dropzone(Dropzone.createElement('<form action="/"></form>'),{clickable:!0,acceptedFiles:"audio/*,video/*"}),"using acceptedMimeTypes":new Dropzone(Dropzone.createElement('<form action="/"></form>'),{clickable:!0,acceptedMimeTypes:"audio/*,video/*"})},it("should not add an accept attribute if no acceptParameter",function(){var e;return e=new Dropzone(Dropzone.createElement('<form action="/"></form>'),{clickable:!0,acceptParameter:null,acceptedMimeTypes:null}),e.hiddenFileInput.hasAttribute("accept").should.be["false"]}),n=[];for(o in t)e=t[o],n.push(describe(o,function(){return function(e){return it("should create a hidden file input if clickable",function(){return e.hiddenFileInput.should.be.ok,e.hiddenFileInput.tagName.should.equal("INPUT")}),it("should use the acceptParameter",function(){return e.hiddenFileInput.getAttribute("accept").should.equal("audio/*,video/*")}),it("should create a new input element when something is selected to reset the input field",function(){var t,o,n,l,r;for(r=[],n=l=0;3>=l;n=++l)o=e.hiddenFileInput,t=document.createEvent("HTMLEvents"),t.initEvent("change",!0,!0),o.dispatchEvent(t),e.hiddenFileInput.should.not.equal(o),r.push(Dropzone.elementInside(o,document).should.not.be.ok);return r})}(e)}));return n}),it("should create a .dz-message element",function(){var e,t;return t=Dropzone.createElement('<form class="dropzone" action="/"></form>'),e=new Dropzone(t,{clickable:!0,acceptParameter:null,acceptedMimeTypes:null}),t.querySelector(".dz-message").should.be["instanceof"](Element)}),it("should not create a .dz-message element if there already is one",function(){var e,t,o;return t=Dropzone.createElement('<form class="dropzone" action="/"></form>'),o=Dropzone.createElement('<div class="dz-message">TEST</div>'),t.appendChild(o),e=new Dropzone(t,{clickable:!0,acceptParameter:null,acceptedMimeTypes:null}),t.querySelector(".dz-message").should.equal(o),t.querySelectorAll(".dz-message").length.should.equal(1)})}),describe("options",function(){var e,t;return t=null,e=null,beforeEach(function(){return t=Dropzone.createElement("<div></div>"),e=new Dropzone(t,{maxFilesize:4,url:"url",acceptedMimeTypes:"audio/*,image/png",maxFiles:3})}),describe("file specific",function(){var t;return t=null,beforeEach(function(){return t={name:"test name",size:2e6},e.options.addedfile.call(e,t)}),describe(".addedFile()",function(){return it("should properly create the previewElement",function(){return t.previewElement.should.be["instanceof"](Element),t.previewElement.querySelector("[data-dz-name]").innerHTML.should.eql("test name"),t.previewElement.querySelector("[data-dz-size]").innerHTML.should.eql("<strong>2</strong> MB")})}),describe(".error()",function(){return it("should properly insert the error",function(){return e.options.error.call(e,t,"test message"),t.previewElement.querySelector("[data-dz-errormessage]").innerHTML.should.eql("test message")})}),describe(".thumbnail()",function(){return it("should properly insert the error",function(){var o,n;return n="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==",e.options.thumbnail.call(e,t,n),o=t.previewElement.querySelector("[data-dz-thumbnail]"),o.src.should.eql(n),o.alt.should.eql("test name")})}),describe(".uploadprogress()",function(){return it("should properly set the width",function(){return e.options.uploadprogress.call(e,t,0),t.previewElement.querySelector("[data-dz-uploadprogress]").style.width.should.eql("0%"),e.options.uploadprogress.call(e,t,80),t.previewElement.querySelector("[data-dz-uploadprogress]").style.width.should.eql("80%"),e.options.uploadprogress.call(e,t,90),t.previewElement.querySelector("[data-dz-uploadprogress]").style.width.should.eql("90%"),e.options.uploadprogress.call(e,t,100),t.previewElement.querySelector("[data-dz-uploadprogress]").style.width.should.eql("100%")})})})}),describe("instance",function(){var o,n,l;return n=null,o=null,l=null,beforeEach(function(){return l=[],t.onCreate=function(e){return l.push(e)},n=Dropzone.createElement("<div></div>"),document.body.appendChild(n),o=new Dropzone(n,{maxFilesize:4,maxFiles:100,url:"url",acceptedMimeTypes:"audio/*,image/png",uploadprogress:function(){}})}),afterEach(function(){return document.body.removeChild(n),o.destroy(),t.restore()}),describe(".accept()",function(){return it("should pass if the filesize is OK",function(){return o.accept({size:2097152,type:"audio/mp3"},function(e){return expect(e).to.be.undefined})}),it("shouldn't pass if the filesize is too big",function(){return o.accept({size:10485760,type:"audio/mp3"},function(e){return e.should.eql("File is too big (10MB). Max filesize: 4MB.")})}),it("should properly accept files which mime types are listed in acceptedFiles",function(){return o.accept({type:"audio/mp3"},function(e){return expect(e).to.be.undefined}),o.accept({type:"image/png"},function(e){return expect(e).to.be.undefined}),o.accept({type:"audio/wav"},function(e){return expect(e).to.be.undefined})}),it("should properly reject files when the mime type isn't listed in acceptedFiles",function(){return o.accept({type:"image/jpeg"},function(e){return e.should.eql("You can't upload files of this type.")})}),it("should fail if maxFiles has been exceeded and call the event maxfilesexceeded",function(){var e,t;return sinon.stub(o,"getAcceptedFiles"),t={type:"audio/mp3"},o.getAcceptedFiles.returns({length:99}),e=!1,o.on("maxfilesexceeded",function(o){return o.should.equal(t),e=!0}),o.accept(t,function(e){return expect(e).to.be.undefined}),e.should.not.be.ok,o.getAcceptedFiles.returns({length:100}),o.accept(t,function(e){return expect(e).to.equal("You can only upload 100 files.")}),e.should.be.ok,o.getAcceptedFiles.restore()})}),describe(".removeFile()",function(){return it("should abort uploading if file is currently being uploaded",function(t){var n;return n=e(),o.uploadFile=function(e){},o.accept=function(e,t){return t()},sinon.stub(o,"cancelUpload"),o.addFile(n),setTimeout(function(){return n.status.should.equal(Dropzone.UPLOADING),o.getUploadingFiles()[0].should.equal(n),o.cancelUpload.callCount.should.equal(0),o.removeFile(n),o.cancelUpload.callCount.should.equal(1),t()},10)})}),describe(".cancelUpload()",function(){return it("should properly cancel upload if file currently uploading",function(t){var n;return n=e(),o.accept=function(e,t){return t()},o.addFile(n),setTimeout(function(){return n.status.should.equal(Dropzone.UPLOADING),o.getUploadingFiles()[0].should.equal(n),o.cancelUpload(n),n.status.should.equal(Dropzone.CANCELED),o.getUploadingFiles().length.should.equal(0),o.getQueuedFiles().length.should.equal(0),t()},10)}),it("should properly cancel the upload if file is not yet uploading",function(){var t;return t=e(),o.accept=function(e,t){return t()},o.options.parallelUploads=0,o.addFile(t),t.status.should.equal(Dropzone.QUEUED),o.getQueuedFiles()[0].should.equal(t),o.cancelUpload(t),t.status.should.equal(Dropzone.CANCELED),o.getQueuedFiles().length.should.equal(0),o.getUploadingFiles().length.should.equal(0)}),it("should call processQueue()",function(t){var n;return n=e(),o.accept=function(e,t){return t()},o.options.parallelUploads=0,sinon.spy(o,"processQueue"),o.addFile(n),setTimeout(function(){return o.processQueue.callCount.should.equal(1),o.cancelUpload(n),o.processQueue.callCount.should.equal(2),t()},10)}),it("should properly cancel all files with the same XHR if uploadMultiple is true",function(t){var n,l,r;return n=e(),l=e(),r=e(),o.accept=function(e,t){return t()},o.options.uploadMultiple=!0,o.options.parallelUploads=3,sinon.spy(o,"processFiles"),o.addFile(n),o.addFile(l),o.addFile(r),setTimeout(function(){var e;return o.processFiles.callCount.should.equal(1),sinon.spy(n.xhr,"abort"),o.cancelUpload(n),expect(n.xhr===(e=l.xhr)&&e===r.xhr).to.be.ok,n.status.should.equal(Dropzone.CANCELED),l.status.should.equal(Dropzone.CANCELED),r.status.should.equal(Dropzone.CANCELED),n.xhr.abort.callCount.should.equal(1),t()},10)})}),describe(".disable()",function(){return it("should properly cancel all pending uploads",function(t){return o.accept=function(e,t){return t()},o.options.parallelUploads=1,o.addFile(e()),o.addFile(e()),setTimeout(function(){return o.getUploadingFiles().length.should.equal(1),o.getQueuedFiles().length.should.equal(1),o.files.length.should.equal(2),sinon.spy(l[0],"abort"),l[0].abort.callCount.should.equal(0),o.disable(),l[0].abort.callCount.should.equal(1),o.getUploadingFiles().length.should.equal(0),o.getQueuedFiles().length.should.equal(0),o.files.length.should.equal(2),o.files[0].status.should.equal(Dropzone.CANCELED),o.files[1].status.should.equal(Dropzone.CANCELED),t()},10)})}),describe(".destroy()",function(){return it("should properly cancel all pending uploads and remove all file references",function(t){return o.accept=function(e,t){return t()},o.options.parallelUploads=1,o.addFile(e()),o.addFile(e()),setTimeout(function(){return o.getUploadingFiles().length.should.equal(1),o.getQueuedFiles().length.should.equal(1),o.files.length.should.equal(2),sinon.spy(o,"disable"),o.destroy(),o.disable.callCount.should.equal(1),n.should.not.have.property("dropzone"),t()},10)}),it("should be able to create instance of dropzone on the same element after destroy",function(){return o.destroy(),function(){return new Dropzone(n,{maxFilesize:4,url:"url",acceptedMimeTypes:"audio/*,image/png",uploadprogress:function(){}})}.should.not["throw"](Error)})}),describe(".filesize()",function(){return it("should convert to KiloBytes, etc.. not KibiBytes",function(){return o.filesize(2097152).should.eql("<strong>2.1</strong> MB"),o.filesize(2e6).should.eql("<strong>2</strong> MB"),o.filesize(2147483648).should.eql("<strong>2.1</strong> GB"),o.filesize(2e9).should.eql("<strong>2</strong> GB")})}),describe("._updateMaxFilesReachedClass()",function(){return it("should properly add the dz-max-files-reached class",function(){return o.getAcceptedFiles=function(){return{length:10}},o.options.maxFiles=10,o.element.classList.contains("dz-max-files-reached").should.not.be.ok,o._updateMaxFilesReachedClass(),o.element.classList.contains("dz-max-files-reached").should.be.ok}),it("should properly remove the dz-max-files-reached class",function(){return o.getAcceptedFiles=function(){return{length:10}},o.options.maxFiles=10,o.element.classList.contains("dz-max-files-reached").should.not.be.ok,o._updateMaxFilesReachedClass(),o.element.classList.contains("dz-max-files-reached").should.be.ok,o.getAcceptedFiles=function(){return{length:9}},o._updateMaxFilesReachedClass(),o.element.classList.contains("dz-max-files-reached").should.not.be.ok})}),describe("events",function(){return describe("progress updates",function(){return it("should properly emit a totaluploadprogress event",function(e){var t,n;return o.files=[{size:1990,accepted:!0,upload:{progress:20,total:2e3,bytesSent:400}},{size:1990,accepted:!0,upload:{progress:10,total:2e3,bytesSent:200}}],n=0,o.on("totaluploadprogress",function(o){return o.should.equal(t),3===++n?e():void 0}),t=15,o.emit("uploadprogress",{}),t=97.5,o.files[0].upload.bytesSent=2e3,o.files[1].upload.bytesSent=1900,o.emit("uploadprogress",{}),t=100,o.files[0].upload.bytesSent=2e3,o.files[1].upload.bytesSent=2e3,o.emit("uploadprogress",{})})})})}),describe("helper function",function(){var t,o;return o=null,t=null,beforeEach(function(){return o=Dropzone.createElement("<div></div>"),t=new Dropzone(o,{url:"url"})}),describe("getExistingFallback()",function(){return it("should return undefined if no fallback",function(){return expect(t.getExistingFallback()).to.equal(void 0)}),it("should only return the fallback element if it contains exactly fallback",function(){return o.appendChild(Dropzone.createElement('<form class="fallbacks"></form>')),o.appendChild(Dropzone.createElement('<form class="sfallback"></form>')),expect(t.getExistingFallback()).to.equal(void 0)}),it("should return divs as fallback",function(){var e;return e=Dropzone.createElement('<form class=" abc fallback test "></form>'),o.appendChild(e),e.should.equal(t.getExistingFallback())}),it("should return forms as fallback",function(){var e;return e=Dropzone.createElement('<div class=" abc fallback test "></div>'),o.appendChild(e),e.should.equal(t.getExistingFallback())})}),describe("getFallbackForm()",function(){return it("should use the paramName without [] if uploadMultiple is false",function(){var e,o;return t.options.uploadMultiple=!1,t.options.paramName="myFile",e=t.getFallbackForm(),o=e.querySelector("input[type=file]"),o.name.should.equal("myFile")}),it("should properly add [] to the file name if uploadMultiple is true",function(){var e,o;return t.options.uploadMultiple=!0,t.options.paramName="myFile",e=t.getFallbackForm(),o=e.querySelector("input[type=file]"),o.name.should.equal("myFile[]")})}),describe("getAcceptedFiles() / getRejectedFiles()",function(){var o,n,l,r;return o=n=l=r=null,beforeEach(function(){return o=e(),n=e(),l=e(),r=e(),t.options.accept=function(e,t){return e===o||e===l?t():t("error")},t.addFile(o),t.addFile(n),t.addFile(l),t.addFile(r)}),it("getAcceptedFiles() should only return accepted files",function(){return t.getAcceptedFiles().should.eql([o,l])}),it("getRejectedFiles() should only return rejected files",function(){return t.getRejectedFiles().should.eql([n,r])})}),describe("getQueuedFiles()",function(){return it("should return all files with the status Dropzone.QUEUED",function(){var o,n,l,r;return o=e(),n=e(),l=e(),r=e(),t.options.accept=function(e,t){return e.done=t},t.addFile(o),t.addFile(n),t.addFile(l),t.addFile(r),t.getQueuedFiles().should.eql([]),o.done(),l.done(),t.getQueuedFiles().should.eql([o,l]),o.status.should.equal(Dropzone.QUEUED),l.status.should.equal(Dropzone.QUEUED),n.status.should.equal(Dropzone.ADDED),r.status.should.equal(Dropzone.ADDED)})}),describe("getUploadingFiles()",function(){return it("should return all files with the status Dropzone.UPLOADING",function(o){var n,l,r,u;return n=e(),l=e(),r=e(),u=e(),t.options.accept=function(e,t){return e.done=t},t.uploadFile=function(){},t.addFile(n),t.addFile(l),t.addFile(r),t.addFile(u),t.getUploadingFiles().should.eql([]),n.done(),r.done(),setTimeout(function(){return t.getUploadingFiles().should.eql([n,r]),n.status.should.equal(Dropzone.UPLOADING),r.status.should.equal(Dropzone.UPLOADING),l.status.should.equal(Dropzone.ADDED),u.status.should.equal(Dropzone.ADDED),o()},10)})})}),describe("file handling",function(){var o,n;return n=null,o=null,beforeEach(function(){var t;return n=e(),t=Dropzone.createElement("<div></div>"),o=new Dropzone(t,{url:"/the/url"})}),afterEach(function(){return o.destroy()}),describe("addFile()",function(){return it("should properly set the status of the file",function(){var t;return t=null,o.accept=function(e,o){return t=o},o.processFile=function(){},o.uploadFile=function(){},o.addFile(n),n.status.should.eql(Dropzone.ADDED),t(),n.status.should.eql(Dropzone.QUEUED),n=e(),o.addFile(n),n.status.should.eql(Dropzone.ADDED),t("error"),n.status.should.eql(Dropzone.ERROR)}),it("should properly set the status of the file if autoProcessQueue is false and not call processQueue",function(e){var t;return t=null,o.options.autoProcessQueue=!1,o.accept=function(e,o){return t=o},o.processFile=function(){},o.uploadFile=function(){},o.addFile(n),sinon.stub(o,"processQueue"),n.status.should.eql(Dropzone.ADDED),t(),n.status.should.eql(Dropzone.QUEUED),o.processQueue.callCount.should.equal(0),setTimeout(function(){return o.processQueue.callCount.should.equal(0),e()},10)})}),describe("enqueueFile()",function(){return it("should be wrapped by enqueueFiles()",function(){var t,n,l;return sinon.stub(o,"enqueueFile"),t=e(),n=e(),l=e(),o.enqueueFiles([t,n,l]),o.enqueueFile.callCount.should.equal(3),o.enqueueFile.args[0][0].should.equal(t),o.enqueueFile.args[1][0].should.equal(n),o.enqueueFile.args[2][0].should.equal(l)}),it("should fail if the file has already been processed",function(){return n.status=Dropzone.ERROR,expect(function(){return o.enqueueFile(n)}).to["throw"]("This file can't be queued because it has already been processed or was rejected."),n.status=Dropzone.COMPLETE,expect(function(){return o.enqueueFile(n)}).to["throw"]("This file can't be queued because it has already been processed or was rejected."),n.status=Dropzone.UPLOADING,expect(function(){return o.enqueueFile(n)}).to["throw"]("This file can't be queued because it has already been processed or was rejected.")}),it("should set the status to QUEUED and call processQueue asynchronously if everything's ok",function(e){return n.status=Dropzone.ADDED,sinon.stub(o,"processQueue"),o.processQueue.callCount.should.equal(0),o.enqueueFile(n),n.status.should.equal(Dropzone.QUEUED),o.processQueue.callCount.should.equal(0),setTimeout(function(){return o.processQueue.callCount.should.equal(1),e()},10)})}),describe("uploadFiles()",function(){var l;return l=null,beforeEach(function(){return l=[],t.onCreate=function(e){return l.push(e)}}),afterEach(function(){return t.restore()}),it("should be wrapped by uploadFile()",function(){return sinon.stub(o,"uploadFiles"),o.uploadFile(n),o.uploadFiles.callCount.should.equal(1),o.uploadFiles.calledWith([n]).should.be.ok}),it("should ignore the onreadystate callback if readyState != 4",function(e){return o.addFile(n),setTimeout(function(){return n.status.should.eql(Dropzone.UPLOADING),l[0].status=200,l[0].readyState=3,l[0].onload(),n.status.should.eql(Dropzone.UPLOADING),l[0].readyState=4,l[0].onload(),n.status.should.eql(Dropzone.SUCCESS),e()},10)}),it("should emit error and errormultiple when response was not OK",function(e){var t,r,u,i;return o.options.uploadMultiple=!0,u=!1,i=!1,t=!1,r=!1,o.on("error",function(){return u=!0}),o.on("errormultiple",function(){return i=!0}),o.on("complete",function(){return t=!0}),o.on("completemultiple",function(){return r=!0}),o.addFile(n),setTimeout(function(){return n.status.should.eql(Dropzone.UPLOADING),l[0].status=400,l[0].readyState=4,l[0].onload(),expect(!0===u&&u===i&&i===t&&t===r).to.be.ok,e()},10)}),it("should include hidden files in the form and unchecked checkboxes and radiobuttons should be excluded",function(t){var n,l,r;return n=Dropzone.createElement('<form action="/the/url">\n  <input type="hidden" name="test" value="hidden" />\n  <input type="checkbox" name="unchecked" value="1" />\n  <input type="checkbox" name="checked" value="value1" checked="checked" />\n  <input type="radio" value="radiovalue1" name="radio1" />\n  <input type="radio" value="radiovalue2" name="radio1" checked="checked" />\n</form>'),
o=new Dropzone(n,{url:"/the/url"}),l=null,o.on("sending",function(e,t,o){return l=o,sinon.spy(o,"append")}),r=e(),o.addFile(r),setTimeout(function(){return l.append.callCount.should.equal(4),l.append.args[0][0].should.eql("test"),l.append.args[0][1].should.eql("hidden"),l.append.args[1][0].should.eql("checked"),l.append.args[1][1].should.eql("value1"),l.append.args[2][0].should.eql("radio1"),l.append.args[2][1].should.eql("radiovalue2"),l.append.args[3][0].should.eql("file"),l.append.args[3][1].should.equal(r),t()},10)}),describe("settings()",function(){return it("should correctly set `withCredentials` on the xhr object",function(){return o.uploadFile(n),l.length.should.eql(1),l[0].withCredentials.should.eql(!1),o.options.withCredentials=!0,o.uploadFile(n),l.length.should.eql(2),l[1].withCredentials.should.eql(!0)}),it("should correctly override headers on the xhr object",function(){return o.options.headers={"Foo-Header":"foobar"},o.uploadFile(n),l[0].requestHeaders["Foo-Header"].should.eql("foobar")}),it("should properly use the paramName without [] as file upload if uploadMultiple is false",function(t){var n,l,r,u;return o.options.uploadMultiple=!1,o.options.paramName="myName",n=[],u=0,o.on("sending",function(e,t,o){return u++,n.push(o),sinon.spy(o,"append")}),l=e(),r=e(),o.addFile(l),o.addFile(r),setTimeout(function(){return u.should.equal(2),n.length.should.equal(2),n[0].append.callCount.should.equal(1),n[1].append.callCount.should.equal(1),n[0].append.args[0][0].should.eql("myName"),n[0].append.args[0][0].should.eql("myName"),t()},10)}),it("should properly use the paramName with [] as file upload if uploadMultiple is true",function(t){var n,l,r,u,i;return o.options.uploadMultiple=!0,o.options.paramName="myName",n=null,i=0,u=0,o.on("sending",function(e,t,o){return u++}),o.on("sendingmultiple",function(e,t,o){return i++,n=o,sinon.spy(o,"append")}),l=e(),r=e(),o.addFile(l),o.addFile(r),setTimeout(function(){return u.should.equal(2),i.should.equal(1),o.uploadFiles([l,r]),n.append.callCount.should.equal(2),n.append.args[0][0].should.eql("myName[]"),n.append.args[1][0].should.eql("myName[]"),t()},10)})}),describe("should properly set status of file",function(){return it("should correctly set `withCredentials` on the xhr object",function(t){return o.addFile(n),setTimeout(function(){return n.status.should.eql(Dropzone.UPLOADING),l.length.should.equal(1),l[0].status=400,l[0].readyState=4,l[0].onload(),n.status.should.eql(Dropzone.ERROR),n=e(),o.addFile(n),setTimeout(function(){return n.status.should.eql(Dropzone.UPLOADING),l.length.should.equal(2),l[1].status=200,l[1].readyState=4,l[1].onload(),n.status.should.eql(Dropzone.SUCCESS),t()},10)},10)})})})})})}).call(this);