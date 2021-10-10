(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[514,608],{56316:function(e,t,n){"use strict";n.r(t),n.d(t,{default:function(){return re}});var a=n(67294),r=n(3905),o=n(46291),l=n(56698),i=n(71632),c=n(87462),s=n(63366),u=n(99105),d=n(36742),m=n(86010),p={plain:{backgroundColor:"#2a2734",color:"#9a86fd"},styles:[{types:["comment","prolog","doctype","cdata","punctuation"],style:{color:"#6c6783"}},{types:["namespace"],style:{opacity:.7}},{types:["tag","operator","number"],style:{color:"#e09142"}},{types:["property","function"],style:{color:"#9a86fd"}},{types:["tag-id","selector","atrule-id"],style:{color:"#eeebff"}},{types:["attr-name"],style:{color:"#c4b9fe"}},{types:["boolean","string","entity","url","attr-value","keyword","control","directive","unit","statement","regex","at-rule","placeholder","variable"],style:{color:"#ffcc99"}},{types:["deleted"],style:{textDecorationLine:"line-through"}},{types:["inserted"],style:{textDecorationLine:"underline"}},{types:["italic"],style:{fontStyle:"italic"}},{types:["important","bold"],style:{fontWeight:"bold"}},{types:["important"],style:{color:"#c4b9fe"}}]},h={Prism:n(87410).default,theme:p};function f(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function y(){return y=Object.assign||function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var a in n)Object.prototype.hasOwnProperty.call(n,a)&&(e[a]=n[a])}return e},y.apply(this,arguments)}var g=/\r\n|\r|\n/,v=function(e){0===e.length?e.push({types:["plain"],content:"\n",empty:!0}):1===e.length&&""===e[0].content&&(e[0].content="\n",e[0].empty=!0)},b=function(e,t){var n=e.length;return n>0&&e[n-1]===t?e:e.concat(t)},k=function(e,t){var n=e.plain,a=Object.create(null),r=e.styles.reduce((function(e,n){var a=n.languages,r=n.style;return a&&!a.includes(t)||n.types.forEach((function(t){var n=y({},e[t],r);e[t]=n})),e}),a);return r.root=n,r.plain=y({},n,{backgroundColor:null}),r};function E(e,t){var n={};for(var a in e)Object.prototype.hasOwnProperty.call(e,a)&&-1===t.indexOf(a)&&(n[a]=e[a]);return n}var Z=function(e){function t(){for(var t=this,n=[],a=arguments.length;a--;)n[a]=arguments[a];e.apply(this,n),f(this,"getThemeDict",(function(e){if(void 0!==t.themeDict&&e.theme===t.prevTheme&&e.language===t.prevLanguage)return t.themeDict;t.prevTheme=e.theme,t.prevLanguage=e.language;var n=e.theme?k(e.theme,e.language):void 0;return t.themeDict=n})),f(this,"getLineProps",(function(e){var n=e.key,a=e.className,r=e.style,o=y({},E(e,["key","className","style","line"]),{className:"token-line",style:void 0,key:void 0}),l=t.getThemeDict(t.props);return void 0!==l&&(o.style=l.plain),void 0!==r&&(o.style=void 0!==o.style?y({},o.style,r):r),void 0!==n&&(o.key=n),a&&(o.className+=" "+a),o})),f(this,"getStyleForToken",(function(e){var n=e.types,a=e.empty,r=n.length,o=t.getThemeDict(t.props);if(void 0!==o){if(1===r&&"plain"===n[0])return a?{display:"inline-block"}:void 0;if(1===r&&!a)return o[n[0]];var l=a?{display:"inline-block"}:{},i=n.map((function(e){return o[e]}));return Object.assign.apply(Object,[l].concat(i))}})),f(this,"getTokenProps",(function(e){var n=e.key,a=e.className,r=e.style,o=e.token,l=y({},E(e,["key","className","style","token"]),{className:"token "+o.types.join(" "),children:o.content,style:t.getStyleForToken(o),key:void 0});return void 0!==r&&(l.style=void 0!==l.style?y({},l.style,r):r),void 0!==n&&(l.key=n),a&&(l.className+=" "+a),l})),f(this,"tokenize",(function(e,t,n,a){var r={code:t,grammar:n,language:a,tokens:[]};e.hooks.run("before-tokenize",r);var o=r.tokens=e.tokenize(r.code,r.grammar,r.language);return e.hooks.run("after-tokenize",r),o}))}return e&&(t.__proto__=e),t.prototype=Object.create(e&&e.prototype),t.prototype.constructor=t,t.prototype.render=function(){var e=this.props,t=e.Prism,n=e.language,a=e.code,r=e.children,o=this.getThemeDict(this.props),l=t.languages[n];return r({tokens:function(e){for(var t=[[]],n=[e],a=[0],r=[e.length],o=0,l=0,i=[],c=[i];l>-1;){for(;(o=a[l]++)<r[l];){var s=void 0,u=t[l],d=n[l][o];if("string"==typeof d?(u=l>0?u:["plain"],s=d):(u=b(u,d.type),d.alias&&(u=b(u,d.alias)),s=d.content),"string"==typeof s){var m=s.split(g),p=m.length;i.push({types:u,content:m[0]});for(var h=1;h<p;h++)v(i),c.push(i=[]),i.push({types:u,content:m[h]})}else l++,t.push(u),n.push(s),a.push(0),r.push(s.length)}l--,t.pop(),n.pop(),a.pop(),r.pop()}return v(i),c}(void 0!==l?this.tokenize(t,a,l,n):[a]),className:"prism-code language-"+n,style:void 0!==o?o.root:{},getLineProps:this.getLineProps,getTokenProps:this.getTokenProps})},t}(a.Component),C=Z;var N=n(87594),_=n.n(N),T={plain:{color:"#bfc7d5",backgroundColor:"#292d3e"},styles:[{types:["comment"],style:{color:"rgb(105, 112, 152)",fontStyle:"italic"}},{types:["string","inserted"],style:{color:"rgb(195, 232, 141)"}},{types:["number"],style:{color:"rgb(247, 140, 108)"}},{types:["builtin","char","constant","function"],style:{color:"rgb(130, 170, 255)"}},{types:["punctuation","selector"],style:{color:"rgb(199, 146, 234)"}},{types:["variable"],style:{color:"rgb(191, 199, 213)"}},{types:["class-name","attr-name"],style:{color:"rgb(255, 203, 107)"}},{types:["tag","deleted"],style:{color:"rgb(255, 85, 114)"}},{types:["operator"],style:{color:"rgb(137, 221, 255)"}},{types:["boolean"],style:{color:"rgb(255, 88, 116)"}},{types:["keyword"],style:{fontStyle:"italic"}},{types:["doctype"],style:{color:"rgb(199, 146, 234)",fontStyle:"italic"}},{types:["namespace"],style:{color:"rgb(178, 204, 214)"}},{types:["url"],style:{color:"rgb(221, 221, 221)"}}]},S=n(85350),x=n(941),I=function(){var e=(0,x.LU)().prism,t=(0,S.Z)().isDarkTheme,n=e.theme||T,a=e.darkTheme||n;return t?a:n},j=n(24973),P="codeBlockContainer_K1bP",B="codeBlockContent_hGly",L="codeBlockTitle_eoMF",w="codeBlock_23N8",M="copyButton_Ue-o",A="codeBlockLines_39YC",D=/{([\d,-]+)}/,F=["js","jsBlock","jsx","python","html"],O={js:{start:"\\/\\/",end:""},jsBlock:{start:"\\/\\*",end:"\\*\\/"},jsx:{start:"\\{\\s*\\/\\*",end:"\\*\\/\\s*\\}"},python:{start:"#",end:""},html:{start:"\x3c!--",end:"--\x3e"}},R=["highlight-next-line","highlight-start","highlight-end"],H=function(e){void 0===e&&(e=F);var t=e.map((function(e){var t=O[e],n=t.start,a=t.end;return"(?:"+n+"\\s*("+R.join("|")+")\\s*"+a+")"})).join("|");return new RegExp("^\\s*(?:"+t+")\\s*$")};function W(e){var t=e.children,n=e.className,r=e.metastring,o=e.title,l=(0,x.LU)().prism,i=(0,a.useState)(!1),s=i[0],u=i[1],d=(0,a.useState)(!1),p=d[0],f=d[1];(0,a.useEffect)((function(){f(!0)}),[]);var y=(0,x.bc)(r)||o,g=(0,a.useRef)(null),v=[],b=I(),k=Array.isArray(t)?t.join(""):t;if(r&&D.test(r)){var E=r.match(D)[1];v=_()(E).filter((function(e){return e>0}))}var Z=null==n?void 0:n.replace(/language-/,"");!Z&&l.defaultLanguage&&(Z=l.defaultLanguage);var N=k.replace(/\n$/,"");if(0===v.length&&void 0!==Z){for(var T,S="",F=function(e){switch(e){case"js":case"javascript":case"ts":case"typescript":return H(["js","jsBlock"]);case"jsx":case"tsx":return H(["js","jsBlock","jsx"]);case"html":return H(["js","jsBlock","html"]);case"python":case"py":return H(["python"]);default:return H()}}(Z),O=k.replace(/\n$/,"").split("\n"),R=0;R<O.length;){var W=R+1,z=O[R].match(F);if(null!==z){switch(z.slice(1).reduce((function(e,t){return e||t}),void 0)){case"highlight-next-line":S+=W+",";break;case"highlight-start":T=W;break;case"highlight-end":S+=T+"-"+(W-1)+","}O.splice(R,1)}else R+=1}v=_()(S),N=O.join("\n")}var U=function(){!function(e,{target:t=document.body}={}){const n=document.createElement("textarea"),a=document.activeElement;n.value=e,n.setAttribute("readonly",""),n.style.contain="strict",n.style.position="absolute",n.style.left="-9999px",n.style.fontSize="12pt";const r=document.getSelection();let o=!1;r.rangeCount>0&&(o=r.getRangeAt(0)),t.append(n),n.select(),n.selectionStart=0,n.selectionEnd=e.length;let l=!1;try{l=document.execCommand("copy")}catch{}n.remove(),o&&(r.removeAllRanges(),r.addRange(o)),a&&a.focus()}(N),u(!0),setTimeout((function(){return u(!1)}),2e3)};return a.createElement(C,(0,c.Z)({},h,{key:String(p),theme:b,code:N,language:Z}),(function(e){var t=e.className,n=e.style,r=e.tokens,o=e.getLineProps,l=e.getTokenProps;return a.createElement("div",{className:P},y&&a.createElement("div",{style:n,className:L},y),a.createElement("div",{className:(0,m.Z)(B,Z)},a.createElement("pre",{tabIndex:0,className:(0,m.Z)(t,w,"thin-scrollbar"),style:n},a.createElement("code",{className:A},r.map((function(e,t){1===e.length&&""===e[0].content&&(e[0].content="\n");var n=o({line:e,key:t});return v.includes(t+1)&&(n.className+=" docusaurus-highlight-code-line"),a.createElement("span",(0,c.Z)({key:t},n),e.map((function(e,t){return a.createElement("span",(0,c.Z)({key:t},l({token:e,key:t})))})))})))),a.createElement("button",{ref:g,type:"button","aria-label":(0,j.I)({id:"theme.CodeBlock.copyButtonAriaLabel",message:"Copy code to clipboard",description:"The ARIA label for copy code blocks button"}),className:(0,m.Z)(M,"clean-btn"),onClick:U},s?a.createElement(j.Z,{id:"theme.CodeBlock.copied",description:"The copied button label on code blocks"},"Copied"):a.createElement(j.Z,{id:"theme.CodeBlock.copy",description:"The copy button label on code blocks"},"Copy"))))}))}var z=n(28408),U="details_1VDD";function V(e){var t=Object.assign({},e);return a.createElement(x.PO,(0,c.Z)({},t,{className:(0,m.Z)("alert alert--info",U,t.className)}))}var Y=["mdxType","originalType"];var $={head:function(e){var t=a.Children.map(e.children,(function(e){return function(e){var t,n;if(null!=e&&null!=(t=e.props)&&t.mdxType&&null!=e&&null!=(n=e.props)&&n.originalType){var r=e.props,o=(r.mdxType,r.originalType,(0,s.Z)(r,Y));return a.createElement(e.props.originalType,o)}return e}(e)}));return a.createElement(u.Z,e,t)},code:function(e){var t=e.children;return(0,a.isValidElement)(t)?t:t.includes("\n")?a.createElement(W,e):a.createElement("code",e)},a:function(e){return a.createElement(d.Z,e)},pre:function(e){var t,n=e.children;return(0,a.isValidElement)(n)&&(0,a.isValidElement)(null==n||null==(t=n.props)?void 0:t.children)?n.props.children:a.createElement(W,(0,a.isValidElement)(n)?null==n?void 0:n.props:Object.assign({},e))},details:function(e){var t=a.Children.toArray(e.children),n=t.find((function(e){var t;return"summary"===(null==e||null==(t=e.props)?void 0:t.mdxType)})),r=a.createElement(a.Fragment,null,t.filter((function(e){return e!==n})));return a.createElement(V,(0,c.Z)({},e,{summary:n}),r)},h1:(0,z.Z)("h1"),h2:(0,z.Z)("h2"),h3:(0,z.Z)("h3"),h4:(0,z.Z)("h4"),h5:(0,z.Z)("h5"),h6:(0,z.Z)("h6")},J=n(24608),K=n(34096),G=n(5977),q=n(77898),Q="backToTopButton_35hR",X="backToTopButtonShow_18ls";function ee(){var e=(0,a.useRef)(null);return{smoothScrollTop:function(){var t;e.current=(t=null,function e(){var n=document.documentElement.scrollTop;n>0&&(t=requestAnimationFrame(e),window.scrollTo(0,Math.floor(.85*n)))}(),function(){return t&&cancelAnimationFrame(t)})},cancelScrollToTop:function(){return null==e.current?void 0:e.current()}}}var te=function(){var e,t=(0,G.TH)(),n=ee(),r=n.smoothScrollTop,o=n.cancelScrollToTop,l=(0,a.useState)(!1),i=l[0],c=l[1];return(0,q.Z)((function(e,t){var n=e.scrollY;if(t){var a=n<t.scrollY;if(a||o(),n<300)c(!1);else if(a){var r=document.documentElement.scrollHeight;n+window.innerHeight<r&&c(!0)}else c(!1)}}),[t]),a.createElement("button",{className:(0,m.Z)("clean-btn",Q,(e={},e[X]=i,e)),type:"button",onClick:function(){return r()}},a.createElement("svg",{viewBox:"0 0 24 24",width:"28"},a.createElement("path",{d:"M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z",fill:"currentColor"})))},ne={docPage:"docPage_31aa",docMainContainer:"docMainContainer_3ufF",docSidebarContainer:"docSidebarContainer_3Kbt",docMainContainerEnhanced:"docMainContainerEnhanced_3NYZ",docSidebarContainerHidden:"docSidebarContainerHidden_3pA8",collapsedDocSidebar:"collapsedDocSidebar_2JMH",expandSidebarButtonIcon:"expandSidebarButtonIcon_1naQ",docItemWrapperEnhanced:"docItemWrapperEnhanced_2vyJ"};function ae(e){var t,n,o,c=e.currentDocRoute,s=e.versionMetadata,u=e.children,d=s.pluginId,p=s.version,h=c.sidebar,f=h?s.docsSidebars[h]:void 0,y=(0,a.useState)(!1),g=y[0],v=y[1],b=(0,a.useState)(!1),k=b[0],E=b[1],Z=(0,a.useCallback)((function(){k&&E(!1),v(!g)}),[k]);return a.createElement(l.Z,{wrapperClassName:x.kM.wrapper.docsPages,pageClassName:x.kM.page.docsDocPage,searchMetadatas:{version:p,tag:(0,x.os)(d,p)}},a.createElement("div",{className:ne.docPage},a.createElement(te,null),f&&a.createElement("aside",{className:(0,m.Z)(ne.docSidebarContainer,(t={},t[ne.docSidebarContainerHidden]=g,t)),onTransitionEnd:function(e){e.currentTarget.classList.contains(ne.docSidebarContainer)&&g&&E(!0)}},a.createElement(i.Z,{key:h,sidebar:f,path:c.path,onCollapse:Z,isHidden:k}),k&&a.createElement("div",{className:ne.collapsedDocSidebar,title:(0,j.I)({id:"theme.docs.sidebar.expandButtonTitle",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),"aria-label":(0,j.I)({id:"theme.docs.sidebar.expandButtonAriaLabel",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),tabIndex:0,role:"button",onKeyDown:Z,onClick:Z},a.createElement(K.Z,{className:ne.expandSidebarButtonIcon}))),a.createElement("main",{className:(0,m.Z)(ne.docMainContainer,(n={},n[ne.docMainContainerEnhanced]=g||!f,n))},a.createElement("div",{className:(0,m.Z)("container padding-top--md padding-bottom--lg",ne.docItemWrapper,(o={},o[ne.docItemWrapperEnhanced]=g,o))},a.createElement(r.Zo,{components:$},u)))))}var re=function(e){var t=e.route.routes,n=e.versionMetadata,r=e.location,l=t.find((function(e){return(0,G.LX)(r.pathname,e)}));return l?a.createElement(a.Fragment,null,a.createElement(u.Z,null,a.createElement("html",{className:n.className})),a.createElement(ae,{currentDocRoute:l,versionMetadata:n},(0,o.Z)(t,{versionMetadata:n}))):a.createElement(J.default,e)}},71632:function(e,t,n){"use strict";n.d(t,{Z:function(){return R}});var a=n(67294),r=n(86010),o=n(941),l=n(93783),i=n(77898),c=n(55537),s=n(34096),u=n(24973),d=n(87462),m=n(63366),p=n(36742),h=n(13919),f=n(18617),y="menuLinkText_1J2g",g=["items"],v=["item"],b=["item","onItemClick","activePath"],k=["item","onItemClick","activePath"],E=function e(t,n){return"link"===t.type?(0,o.Mg)(t.href,n):"category"===t.type&&t.items.some((function(t){return e(t,n)}))},Z=(0,a.memo)((function(e){var t=e.items,n=(0,m.Z)(e,g);return a.createElement(a.Fragment,null,t.map((function(e,t){return a.createElement(C,(0,d.Z)({key:t,item:e},n))})))}));function C(e){var t=e.item,n=(0,m.Z)(e,v);return"category"===t.type?0===t.items.length?null:a.createElement(N,(0,d.Z)({item:t},n)):a.createElement(_,(0,d.Z)({item:t},n))}function N(e){var t,n=e.item,l=e.onItemClick,i=e.activePath,c=(0,m.Z)(e,b),s=n.items,u=n.label,p=n.collapsible,h=E(n,i),f=(0,o.uR)({initialState:function(){return!!p&&(!h&&n.collapsed)}}),g=f.collapsed,v=f.setCollapsed,k=f.toggleCollapsed;return function(e){var t=e.isActive,n=e.collapsed,r=e.setCollapsed,l=(0,o.D9)(t);(0,a.useEffect)((function(){t&&!l&&n&&r(!1)}),[t,l,n])}({isActive:h,collapsed:g,setCollapsed:v}),a.createElement("li",{className:(0,r.Z)(o.kM.docs.docSidebarItemCategory,"menu__list-item",{"menu__list-item--collapsed":g})},a.createElement("a",(0,d.Z)({className:(0,r.Z)("menu__link",(t={"menu__link--sublist":p,"menu__link--active":p&&h},t[y]=!p,t)),onClick:p?function(e){e.preventDefault(),k()}:void 0,href:p?"#":void 0},c),u),a.createElement(o.zF,{lazy:!0,as:"ul",className:"menu__list",collapsed:g},a.createElement(Z,{items:s,tabIndex:g?-1:0,onItemClick:l,activePath:i})))}function _(e){var t=e.item,n=e.onItemClick,l=e.activePath,i=(0,m.Z)(e,k),c=t.href,s=t.label,u=E(t,l);return a.createElement("li",{className:(0,r.Z)(o.kM.docs.docSidebarItemLink,"menu__list-item"),key:s},a.createElement(p.Z,(0,d.Z)({className:(0,r.Z)("menu__link",{"menu__link--active":u}),"aria-current":u?"page":void 0,to:c},(0,h.Z)(c)&&{onClick:n},i),(0,h.Z)(c)?s:a.createElement("span",null,s,a.createElement(f.Z,null))))}var T="sidebar_15mo",S="sidebarWithHideableNavbar_267A",x="sidebarHidden_2kNb",I="sidebarLogo_3h0W",j="menu_Bmed",P="menuWithAnnouncementBar_2WvA",B="collapseSidebarButton_1CGd",L="collapseSidebarButtonIcon_3E-R";function w(e){var t=e.onClick;return a.createElement("button",{type:"button",title:(0,u.I)({id:"theme.docs.sidebar.collapseButtonTitle",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),"aria-label":(0,u.I)({id:"theme.docs.sidebar.collapseButtonAriaLabel",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),className:(0,r.Z)("button button--secondary button--outline",B),onClick:t},a.createElement(s.Z,{className:L}))}function M(e){var t,n,l=e.path,s=e.sidebar,u=e.onCollapse,d=e.isHidden,m=function(){var e=(0,o.nT)().isClosed,t=(0,a.useState)(!e),n=t[0],r=t[1];return(0,i.Z)((function(t){var n=t.scrollY;e||r(0===n)})),n}(),p=(0,o.LU)(),h=p.navbar.hideOnScroll,f=p.hideableSidebar,y=(0,o.nT)().isClosed;return a.createElement("div",{className:(0,r.Z)(T,(t={},t[S]=h,t[x]=d,t))},h&&a.createElement(c.Z,{tabIndex:-1,className:I}),a.createElement("nav",{className:(0,r.Z)("menu thin-scrollbar",j,(n={},n[P]=!y&&m,n))},a.createElement("ul",{className:(0,r.Z)(o.kM.docs.docSidebarMenu,"menu__list")},a.createElement(Z,{items:s,activePath:l}))),f&&a.createElement(w,{onClick:u}))}var A=function(e){var t=e.toggleSidebar,n=e.sidebar,l=e.path;return a.createElement("ul",{className:(0,r.Z)(o.kM.docs.docSidebarMenu,"menu__list")},a.createElement(Z,{items:n,activePath:l,onItemClick:function(){return t()}}))};function D(e){return a.createElement(o.Cv,{component:A,props:e})}var F=a.memo(M),O=a.memo(D);function R(e){var t=(0,l.Z)(),n="desktop"===t||"ssr"===t,r="mobile"===t;return a.createElement(a.Fragment,null,n&&a.createElement(F,e),r&&a.createElement(O,e))}},28408:function(e,t,n){"use strict";n.d(t,{N:function(){return m},Z:function(){return p}});var a=n(63366),r=n(87462),o=n(67294),l=n(86010),i=n(24973),c=n(941),s="anchorWithStickyNavbar_31ik",u="anchorWithHideOnScrollNavbar_3R7-",d=["id"],m=function(e){var t=Object.assign({},e);return o.createElement("header",null,o.createElement("h1",(0,r.Z)({},t,{id:void 0}),t.children))},p=function(e){return"h1"===e?m:(t=e,function(e){var n,r=e.id,m=(0,a.Z)(e,d),p=(0,c.LU)().navbar.hideOnScroll;return r?o.createElement(t,m,o.createElement("a",{"aria-hidden":"true",tabIndex:-1,className:(0,l.Z)("anchor","anchor__"+t,(n={},n[u]=p,n[s]=!p,n)),id:r}),m.children,o.createElement("a",{className:"hash-link",href:"#"+r,title:(0,i.I)({id:"theme.common.headingLinkTitle",message:"Direct link to heading",description:"Title for link to heading"})},"#")):o.createElement(t,m)});var t}},34096:function(e,t,n){"use strict";var a=n(87462),r=n(67294);t.Z=function(e){return r.createElement("svg",(0,a.Z)({width:"20",height:"20","aria-hidden":"true"},e),r.createElement("g",{fill:"#7a7a7a"},r.createElement("path",{d:"M9.992 10.023c0 .2-.062.399-.172.547l-4.996 7.492a.982.982 0 01-.828.454H1c-.55 0-1-.453-1-1 0-.2.059-.403.168-.551l4.629-6.942L.168 3.078A.939.939 0 010 2.528c0-.548.45-.997 1-.997h2.996c.352 0 .649.18.828.45L9.82 9.472c.11.148.172.347.172.55zm0 0"}),r.createElement("path",{d:"M19.98 10.023c0 .2-.058.399-.168.547l-4.996 7.492a.987.987 0 01-.828.454h-3c-.547 0-.996-.453-.996-1 0-.2.059-.403.168-.551l4.625-6.942-4.625-6.945a.939.939 0 01-.168-.55 1 1 0 01.996-.997h3c.348 0 .649.18.828.45l4.996 7.492c.11.148.168.347.168.55zm0 0"})))}},24608:function(e,t,n){"use strict";n.r(t);var a=n(67294),r=n(56698),o=n(24973);t.default=function(){return a.createElement(r.Z,{title:(0,o.I)({id:"theme.NotFound.title",message:"Page Not Found"})},a.createElement("main",{className:"container margin-vert--xl"},a.createElement("div",{className:"row"},a.createElement("div",{className:"col col--6 col--offset-3"},a.createElement("h1",{className:"hero__title"},a.createElement(o.Z,{id:"theme.NotFound.title",description:"The title of the 404 page"},"Page Not Found")),a.createElement("p",null,a.createElement(o.Z,{id:"theme.NotFound.p1",description:"The first paragraph of the 404 page"},"We could not find what you were looking for.")),a.createElement("p",null,a.createElement(o.Z,{id:"theme.NotFound.p2",description:"The 2nd paragraph of the 404 page"},"Please contact the owner of the site that linked you to the original URL and let them know their link is broken."))))))}},87594:function(e,t){function n(e){let t,n=[];for(let a of e.split(",").map((e=>e.trim())))if(/^-?\d+$/.test(a))n.push(parseInt(a,10));else if(t=a.match(/^(-?\d+)(-|\.\.\.?|\u2025|\u2026|\u22EF)(-?\d+)$/)){let[e,a,r,o]=t;if(a&&o){a=parseInt(a),o=parseInt(o);const e=a<o?1:-1;"-"!==r&&".."!==r&&"\u2025"!==r||(o+=e);for(let t=a;t!==o;t+=e)n.push(t)}}return n}t.default=n,e.exports=n}}]);