"use strict";function sendRequest(e){if(null!=e)if(e.cmd&&"popupfillinputget"!=e.cmd&&"popupfilliconnumber"!=e.cmd&&L("IF -> BG : cmd="+e.cmd),g_ischrome)try{chrome_runtime_sendMessage(e,function(){})}catch(e){}else g_issafari?safari.self.tab?safari.self.tab.dispatchMessage(e.cmd,e):safari.extension&&safari.extension.globalPage&&safari.extension.globalPage.contentWindow&&safari.extension.globalPage.contentWindow.message_handler({name:e.cmd,message:e,target:window}):g_isfirefoxsdk?(e.messagetype=e.cmd,send_message(e)):g_iscasper?"function"==typeof t_sendmsg&&t_sendmsg(e):bg.LPPlatform.postLegacyMessage({name:"message",message:e})}var g_reference_url="",InfieldMenuTimer=function(){var e;function n(){e=setTimeout(function(){$(".menuTriggered").removeClass("menuTriggered"),$(".dropdown").hide()},300)}function t(){null!=e&&clearTimeout(e)}return{startTimer:n,clearTimer:t}}(),InfieldIcons={pw:"fa-lock",sn:"fa-sticky-note",address:"fa-address-book",ccDefault:"fa-credit-card-alt",ccAmex:"fa-cc-amex",ccMastercard:"fa-cc-mastercard",ccDiscover:"fa-cc-discover",ccVisa:"fa-cc-visa",ccDiners:"fa-cc-diners-club",ccJcb:"fa-cc-jcb",ba:"fa-bank",dl:"fa-car",pp:"fa-globe",ssn:"fa-balance-scale",insurance:"fa-umbrella",member:"fa-barcode",wifi:"fa-wifi",db:"fa-database",server:"fa-server",ssh:"fa-user-secret",software:"fa-laptop",custom:"fa-puzzle-piece"},advancedOptionsViewed=!1,debounceWait=500,InfieldCommands=function(){function i(e){csTop.LPInfieldFrame.close(e)}function e(e){bg.InfieldCommands.editSite(e,!0)}function n(e){sendRequest({cmd:"autofillaid",aid:e,from_iframe:!0,no_manualfill_on_saveall:!0,fromiframe:1,source:"formv2"}),i("action")}function t(e){bg.InfieldCommands.copyUrl(e,!0),i("action")}function o(e){bg.InfieldCommands.copyUserName(e,!0),i("action")}function a(e){bg.InfieldCommands.copyPassword(e,!0,"formv2"),i("action")}function r(e,n,t){bg.InfieldCommands.copyProp(e,n,!0,t),i("action")}function s(e,n){bg.InfieldCommands.setGeneratePasswordPrefs({prefstr:e,genpwstr:n})}function c(e){bg.InfieldCommands.editFormFill(e,!0,"formv2"),i("action")}function d(e){bg.InfieldCommands.fillForm(e,!0,"formv2"),i("action")}function l(e,n){bg.LPPlatform.copyToClipboard(e),m("copypass",{action:n,source:"formv2"})}function p(e){bg.InfieldCommands.getGeneratePasswordPrefs(e)}function u(e,n){bg.InfieldCommands.fillGeneratedPassword(e,n,!0),i("action")}function f(e,n,t){bg.InfieldCommands.searchVaultAll(e,n,t)}function g(e){bg.InfieldCommands.getPopupFillData(e)}function m(e,n){bg.sendLpImprove(e,n)}return{closePopup:i,copyToClipboard:l,editSite:e,fillUsernamePass:n,copyUrl:t,copyUserName:o,copyPassword:a,copyProp:r,editFormFill:c,fillForm:d,getGeneratePrefs:p,writeAllPrefs:s,fillGeneratedPassword:u,searchVault:f,getInitialData:g,sendLPImprove:m}}();!function(a){var e=function(e,n,t){var i=this;i._onResizeCallback=t,e&&(e instanceof jQuery?i._triggerElement=e:i._triggerElement=a("#"+e),n?(i._triggerElement.click(function(e){i.show(),i._setPosition(e)}),i._triggerElement.keypress(function(e){i.show(),a(i._menuElement[0]).children().children()[0].focus(),i._setPosition(e)})):(i._triggerElement.children().click(function(e){i.show()}),i._triggerElement.children().keypress(function(e){i.show(),a(i._menuElement[0]).children().children()[0].focus()})))};e.prototype._setPosition=function(e){var n=a(e.currentTarget).offset();n.top+=20,n.left+=20,this._menuElement.offset(n)},e.prototype.show=function(){a(".dropdown").hide(),a(".menuTriggered").removeClass("menuTriggered");var e=this,n;e._triggerElement.closest(".tile").addClass("menuTriggered"),e._triggerElement.addClass("menuTriggered"),this._menuElement&&this._menuElement.show(0,function(){e._onResizeCallback&&e._onResizeCallback(e._menuElement.height(),90)})},e.prototype.hide=function(e){var n=this,t;n._triggerElement.closest(".tile").removeClass("menuTriggered"),n._triggerElement.removeClass("menuTriggered"),n._triggerElement.blur(),this._menuElement&&(this._menuElement.hide(e),n._onResizeCallback(),n._triggerElement.trigger("reset"))},e.prototype.createMenu=function(e,n,t){var i=this;return i._menuElement=a("<div></div>").attr("id",e+"Menu").addClass("dropdown").addClass(n).hide().hover(function(){var e=i._triggerElement.closest(".tile");InfieldMenuTimer.clearTimer()},function(){InfieldMenuTimer.startTimer()}).append(i._createMenuItems(t)),i._menuElement},e.prototype._createMenuItems=function(e){var n=this;n._menuItems=e;for(var t=a("<ul></ul>").addClass("menuList"),i=0;i<n._menuItems.length;i++){var o=a("<li></li>").attr("data-viewId",n._menuItems[i].id).attr("tabindex","1").click(function(e){n._triggerElement.trigger("reset",["action"]),n.hide(),n.select(e.currentTarget.getAttribute("data-viewId"),!0)}).keypress(function(e){n._triggerElement.trigger("reset",["action"]),n.hide(),n.select(e.currentTarget.getAttribute("data-viewId"),!0)}).append(a("<p></p>").text(n._menuItems[i].text));t.append(o)}return t},e.prototype._findMenu=function(n){var e=a.grep(this._menuItems,function(e){return e.id===n});return e&&0<e.length?e[0]:null},e.prototype.select=function(e,n){var t=this._findMenu(e);t&&this._triggerElement&&this._triggerElement.find("p").text(t.selectedText),!0===n&&t&&t.action&&t.action()},window.InfieldMenu=e}(jQuery);var InfieldView=function(n){var t=[];function e(e){Array.isArray(e)&&0<e.length&&(t=e,o())}function i(e){-1!=t.indexOf(e)&&("generatePassView"!==e?(o(),n(".views").show()):(o(),n("#"+e).show()))}function o(){n(".views").hide(),n("#generatePassView").hide()}return{init:e,show:i}}(jQuery),InfieldGeneratePassword=function(r){function e(n,e){r("#moreOptions").click(function(){d(),e&&e()}),r(".iconMoreInfo").hover(function(){r(this).children().fadeIn(200)},function(){r(this).children().fadeOut(100)}),r("#showHistory").click(function(){u(),e&&e()}),r("#lengthInput").on("input",function(){InfieldSearch.debounce(a(r("#lengthInput").val()),debounceWait)}),r("#length").on("input",function(){InfieldSearch.debounce(a(r("#length").val()),debounceWait)}),g_isedge&&r("#length").on("mouseup",function(){i()}),r(".pwgen").change(i),r("#generateBtn").click(i),r("#pronounceable").click(function(){r("#pronounceable").prop("checked")?(r("#digits").prop("checked",!1),r("#digits").prop("disabled",!0),r("#special").prop("checked",!1),r("#special").prop("disabled",!0),r("#ambig").prop("checked",!1),r("#all").prop("checked",!1),r("#upper").prop("checked",!0),r("#lower").prop("checked",!0)):(r("#digits").prop("checked",!0),r("#digits").prop("disabled",!1),r("#special").prop("checked",!0),r("#special").prop("disabled",!1))}),r("#ambig").click(function(){r("#ambig").prop("checked")&&(r("#pronounceable").prop("checked",!1),r("#all").prop("checked",!1),r("#digits").prop("disabled",!1),r("#special").prop("disabled",!1))}),r("#all").click(function(){r("#all").prop("checked")&&(r("#pronounceable").prop("checked",!1),r("#ambig").prop("checked",!1),r("#digits").prop("checked",!0),r("#special").prop("checked",!0),r("#upper").prop("checked",!0),r("#lower").prop("checked",!0),r("#digits").prop("disabled",!1),r("#special").prop("disabled",!1))}),r("#password").on("copy",function(){bg.LPTabState.setCopiedGeneratedPassword(this.value)}).LP_addGeneratePasswordMeter(!0),r("#btnCopy").click(function(){var e=r("#password").val();n.copyToClipboard(e,"generatepassword"),f(),bg.LPTabState.setCopiedGeneratedPassword(e),r(this).children().fadeIn(1,function(){r(this).fadeOut(1200)})}),r("#clearHistory").bind("click",function(){g()});var t=function(){var e=r("#password").val();n.fillGeneratedPassword(e,{pronounceable:r("#pronounceable").prop("checked"),length:r("#password").val().length,expand:advancedOptionsViewed,uppercase:r("#upper").prop("checked"),lowercase:r("#lower").prop("checked"),numeric:r("#digits").prop("checked"),special:r("#special").prop("checked"),avoidAmbiguous:r("#ambig").prop("checked"),passwordType:c(),source:"formv2",variation:"new",generatedPasswordCount:r("#generatedPasswordCount").val()}),n.writeAllPrefs(JSON.stringify({generate_allcombos:r("#all").prop("checked")?1:0,generate_pronounceable:r("#pronounceable").prop("checked")?1:0,generate_length:r("#length").val(),generate_upper:r("#upper").prop("checked")?1:0,generate_lower:r("#lower").prop("checked")?1:0,generate_digits:r("#digits").prop("checked")?1:0,generate_special:r("#special").prop("checked")?1:0,generate_ambig:r("#ambig").prop("checked")?1:0,generate_mindigits:2,generate_reqevery:0})),bg.GenPassHistory.add(e)};r("#fillPasswordBtn").click(t),r("#generateAndFillBtn").click(t),r("#generateAndFillBtn").keypress(t),h(),r("#password").on("change paste keyup",function(e){h()}),r("#advancedView").hide(),r("#generateBtnContainer").hide(),r("#history").hide(),r("#clearHistory").hide()}function i(){m(),r("#generatedPasswordCount").val(function(){return parseInt(r("#generatedPasswordCount").val())+1});var e=lpCreatePass(r("#length").val(),r("#upper").prop("checked"),r("#lower").prop("checked"),r("#digits").prop("checked"),r("#special").prop("checked"),2,r("#ambig").prop("checked"),r("#all").prop("checked"),r("#pronounceable").prop("checked"));r("#password").val(e).change()}function t(){var o=bg.get("g_prefoverrides").sitepwlen;o&&(o=JSON.parse(o),bg.get_selected_tab_data_no_extension(null,function(e){var n=bg.lp_gettld_url(e.url);if(o[n]){var t=o[n],i=Math.max(r("#length").val(),t);r("#length").attr({min:t}),a(i)}}))}function n(e){t();var n=JSON.parse(e.prefstr);r("#length").val(parseInt(n.generate_length)),r("#upper").prop("checked",!!parseInt(n.generate_upper)),r("#lower").prop("checked",!!parseInt(n.generate_lower)),r("#digits").prop("checked",!!parseInt(n.generate_digits)),r("#special").prop("checked",!!parseInt(n.generate_special)),r("#ambig").prop("checked",!!parseInt(n.generate_ambig)),r("#all").prop("checked",!!parseInt(n.generate_allcombos)),r("#advancedView").hide(),r("#generateAndFillView").show(),parseInt(n.generate_pronounceable)?o():r("#pronounceable").prop("pronounceable",!1),r("#ambig").prop("checked")||r("#pronounceable").prop("checked")||s(),parseInt(parseInt(n.generate_length))?a(parseInt(n.generate_length)):a(10),bg.GenPassHistory.getWithReadableDate(f.bind(this)),r("#password").val(lpCreatePass(r("#length").val(),r("#upper").prop("checked"),r("#lower").prop("checked"),r("#digits").prop("checked"),r("#special").prop("checked"),2,r("#ambig").prop("checked"),r("#all").prop("checked"),r("#pronounceable").prop("checked"))).change()}function a(e){99<e&&(e=99),r("#length").val(e);var n=r("#length"),t=n.val(),i=n.attr("min"),o,a=(t-i)/(n.attr("max")-i)*100;r("#sliderFill").width(a+"%"),r("#lengthInput").val(e)}function o(){r("#pronounceable").prop("checked")||r("#pronounceable").prop("checked",!0),r("#digits").prop("checked",!1),r("#digits").prop("disabled",!0),r("#special").prop("checked",!1),r("#special").prop("disabled",!0),r("#upper").prop("checked",!0),r("#lower").prop("checked",!0)}function s(){r("#all").prop("checked")||r("#all").prop("checked",!0),r("#digits").prop("disabled",!1),r("#special").prop("disabled",!1),r("#upper").prop("checked",!0),r("#lower").prop("checked",!0)}function c(){return r("#ambig").prop("checked")?"ambig":r("#pronounceable").prop("checked")?"pronounceable":"all"}function d(){advancedOptionsViewed=!0,r("#advancedView").toggle(),r("#generateBtnContainer").toggle(),r("#moreOptions").html(r("#moreOptions").text()==Strings.translateString("Show Options")?Strings.translateString("Hide Options"):Strings.translateString("Show Options"))}function l(){r("#moreOptions").show(),r("#fillPasswordBtn").show(),r("#generateBtnContainer").hide()}function p(){r("#moreOptions").hide(),r("#fillPasswordBtn").hide(),r("#generateBtnContainer").hide()}function u(){"Show History"==r("#showHistory").text()?(r("#showHistory").html("Hide History"),r("#advanced-features").hide(),r("#history").show(),r("#clearHistory").show(),InfieldCommands.sendLPImprove("historyviewed",{source:"formv2"})):(r("#showHistory").html("Show History"),r("#advanced-features").show(),r("#history").hide(),r("#clearHistory").hide())}function f(e){var n=r("#historyTable"),t=r("#historyBody"),i=r("#historyEmptyState");e&&0!==e.length?(t.empty(),e.forEach(function(e){var n=LPTools.createElement("tr");n.appendChild(LPTools.createElement("td","",e.password)),n.appendChild(LPTools.createElement("td","",Strings.translateString(e.date))),t.append(n)}),n.show(),i.hide()):(n.hide(),i.show())}function g(){bg.GenPassHistory.clear(),r("#historyBody").empty(),r("#historyTable").hide(),r("#historyEmptyState").show(),InfieldCommands.sendLPImprove("historycleared",{source:"formv2"})}function m(){var e=r("#password").val();e&&0<e.length&&(bg.GenPassHistory.add(e),bg.GenPassHistory.getWithReadableDate(f.bind(this)))}function h(){0<r("#password").val().length?r("#fillPasswordBtn").removeAttr("disabled"):r("#fillPasswordBtn").attr("disabled","disabled")}return{init:e,setup:n,show:l,hide:p}}(jQuery),InfieldTiles=function(y,b,I,C){var k="hovered",P=C.translateString("Copy..."),T=C.translateString("Edit"),_=C.translateString("Fill"),S="<div></div>",x;function e(e,o,n,a,t,i){x=t;var r=[];if(y("#"+e).empty().append(y('<p class="italic"></p>').text(i)),n){var s=[],c=y.map(n,function(e,n){return e&&e.language&&1<e.language.length&&-1===s.indexOf(e.language.substr(0,2))&&s.push(e.language.substr(0,2)),e});c.sort(function(e,n){if(void 0!==e.name)return e.name.localeCompare(n.name);var t=e.noteType,i=e.decprofilename;return void 0===t&&(t="undefined"),void 0===i&&(i="undefined"),L("BAD_NAME FOUND - ABORT TILE SORT - userId:"+(e.aid||e.ffid)+" noteType:"+t+" decprofname:"+i),0}),y.each(c,function(e,n){var t=!1;e+1===c.length&&(t=!0);var i=l(o,{id:n.aid||n.ffid,name:"sites"===o?n.name:n.decprofilename,description:"sites"===o?n.unencryptedUsername||n.useusername:null!==n.description?n.description:null,icons:d(a,o,n),noteType:n.notetype,moreText:"sites"===o?C.translateString("More"):T,language:1<s.length?n.language.substr(0,2):null,moreHandler:"sites"===o?null:function(){b.editFormFill(n.aid||n.ffid)},clickHandler:"sites"===o?function(){csTop.Topics.publish(Topics.INFIELD_NOTIFICATION_FILLED),b.fillUsernamePass(n.aid)}:function(){b.fillForm(n.aid||n.ffid)},lastTile:t});i&&r.push(i)}),0<r.length?y("#"+e).empty().append(r):"sites"==o&&y("#"+e).empty().append(y('<p class="italic"></p>').text(i))}return r.length}function d(e,n,t){var i="",o="",a;if("formfills"===n)if(0==t.profiletype)i=InfieldIcons.profile;else switch(t.notetype){case"Credit Card":i=r(t.ccType);break;case"Bank Account":i=InfieldIcons.ba;break;case"Social Security":i=InfieldIcons.ssn;break;case"Address":i=InfieldIcons.address;break;default:if(t.notetype.includes("Custom_")){i=InfieldIcons.custom;break}i=InfieldIcons.pw}else o="icon-site",i=e&&t.aid&&e[t.aid]?e[t.aid]:InfieldIcons.pw;return{normalEl:a=0!=t.profiletype&&"formfills"===n?y("<span/>").addClass("omarImgIcon fa fa-fw fa-2x "+i).attr("aria-hidden","true"):i==InfieldIcons.pw?y("<span/>").addClass("omarImgIcon fa fa-fw fa-2x "+i).attr("aria-hidden","true"):y("<img/>").attr("src",i).addClass("icon-default omarImgIcon "+o)}}function r(e){if(!e||!e.length)return InfieldIcons.ccDefault;switch(e){case"AMEX":return InfieldIcons.ccAmex;case"MC":return InfieldIcons.ccMastercard;case"DISC":return InfieldIcons.ccDiscover;case"VISA":return InfieldIcons.ccVisa;case"DINERS":return InfieldIcons.ccDiners;case"JCB":return InfieldIcons.ccJcb;case"GENERIC":default:return InfieldIcons.ccDefault}}function E(e){return y(S).addClass("col-2 cardIcon no-left-gutter no-right-gutter").append(y(S).addClass("icon").append(e))}function l(n,t){if(!t)return null;var i=null,o=null,a=null,r=y(S).addClass("col-10 cardBody"),s=y(S).addClass("cardInside"),e=y(S).addClass("fa-lg fa-stack"),c=y("<i></i>").addClass("fa fa-clone").attr("aria-hidden","true"),d=y(S).addClass("fa fa-caret-down fa-stack-1x fontAwesomeIcon").attr("aria-hidden","true"),l=y(S).addClass("fa fa-circle fa-stack-1x circle");l.append(d),e.append(c),e.append(l);var p=y("<i></i>").addClass("fa fa-pencil fa-lg").attr("aria-hidden","true"),u=y(S).attr("id",t.id+"copyBtn").attr("tabindex","1").addClass("copyAction").append(e),f=y(S).attr("id",t.id+"editBtn").attr("tabindex","2").addClass("editAction").append(p);a=y(S).addClass("cardMainAction").text(_),r.hover(function(){a.addClass(k),s.addClass(k)},function(){a.removeClass(k),s.removeClass(k)}),s.append(y(S).addClass("cardPrimary").text(t.name+(t.language?" ("+t.language+")":""))),s.append(y(S).addClass("cardSecondary").text(t.description||String.fromCharCode(160))),r.append(a),r.append(s);var g=y(S).addClass("cardActions no-right-gutter no-left-gutter").append(u,f);i=new I(u,!0,x),g.hover(function(){InfieldMenuTimer.clearTimer()},function(){InfieldMenuTimer.startTimer()});var m=[],h;bg.InfieldCommands.canCopy(function(e){e?"sites"===n?(m.push({id:"copyPassword",text:C.translateString("Copy password"),action:function(){b.copyPassword(t.id)}}),m.push({id:"copyUsername",text:C.translateString("Copy username"),action:function(){b.copyUserName(t.id)}}),m.push({id:"copyURL",text:C.translateString("Copy URL"),action:function(){b.copyUrl(t.id)}})):"Credit Card"===t.noteType?(m.push({id:"copyCardNum",text:C.translateString("Copy card number"),action:function(){b.copyProp(t.id,"Number")}}),m.push({id:"copySecurityCode",text:C.translateString("Copy security code"),action:function(){b.copyProp(t.id,"Security Code")}})):"Bank Account"===t.noteType?(m.push({id:"copyAccountNum",text:C.translateString("Copy account number"),action:function(){b.copyProp(t.id,"Account Number")}}),m.push({id:"copyRoutingNum",text:C.translateString("Copy routing number"),action:function(){b.copyProp(t.id,"Routing Number")}})):"Social Security"===t.noteType?m.push({id:"copySSN",text:C.translateString("Copy SSN"),action:function(){b.copyProp(t.id,"Number")}}):"Address"===t.noteType&&(m.push({id:"copyFirstName",text:C.translateString("Copy first name"),action:function(){b.copyProp(t.id,"First Name")}}),m.push({id:"copyLastName",text:C.translateString("Copy last name"),action:function(){b.copyProp(t.id,"Last Name")}}),m.push({id:"copyAddressFirst",text:C.translateString("Copy address 1"),action:function(){b.copyProp(t.id,"Address 1")}}),m.push({id:"copyCity",text:C.translateString("Copy city/town"),action:function(){b.copyProp(t.id,"City / Town")}}),m.push({id:"copyZip",text:C.translateString("Copy zip/postal code"),action:function(){b.copyProp(t.id,"Zip / Postal Code")}}),m.push({id:"copyEmail",text:C.translateString("Copy email address"),action:function(){b.copyProp(t.id,"Email Address")}}),m.push({id:"copyPhone",text:C.translateString("Copy phone number"),action:function(){b.copyProp(t.id,"Phone","num")}})):y("#btnCopy").hide(),m.length?((o=i.createMenu("copy","tileDropdown",m)).hover(function(){InfieldMenuTimer.clearTimer()},function(){InfieldMenuTimer.startTimer()}),y("#menuContainer").append(o),u.click(function(e){e.stopPropagation(),i.show()}),u.bind("reset",function(e,n){v.removeClass("triggered"),!n&&r.hasClass(k)||(c.removeClass(k),l.removeClass(k)),a&&(a.text(_),s.hasClass(k)||a.removeClass(k))}),u.hover(function(){o&&o.is(":visible")||(c.addClass(k),l.addClass(k),a&&(a.text(P),a.addClass(k)))},function(){o&&o.is(":visible")||u.hasClass("menuTriggered")||(c.removeClass(k),l.removeClass(k),a&&(a.text(_),r.hasClass(k)||a.removeClass(k)))})):u.hide()}),f.click(function(e){e.stopPropagation(),"sites"===n?b.editSite(t.id):"formfills"===n&&b.editFormFill(t.id)}),f.hover(function(e){o&&o.is(":visible")||(p.addClass(k),a&&(a.text(T),a.addClass(k)))},function(){o&&o.is(":visible")||(p.removeClass(k),a&&(a.text(_),a.removeClass(k)))}),new MutationObserver(function(e){e.forEach(function(e){var n;"class"==e.attributeName&&(e.target.classList.contains("menuTriggered")||e.target.children[0].firstChild.classList.contains("hovered")&&(c.removeClass(k),l.removeClass(k)))})}).observe(u[0],{attributes:!0,childList:!0});var w=E([t.icons.normalEl]),v=y(S).addClass("cardContainer col-12").attr("id",t.id).attr("tabindex","1").append(y(S).addClass("omarCard").append(w,r,g)).hover(function(){g.addClass(k),r.addClass(k)},function(){u.hasClass("menuTriggered")||(v.removeClass("triggered"),g.removeClass(k),r.removeClass(k),s.removeClass(k),a&&a.removeClass(k))});return v.click(t.clickHandler),t.lastTile&&v.addClass("lastTile"),y(".copyAction",".editAction").focus(function(){v.addClass("triggered")}).blur(function(){v.removeClass("triggered")}).click(function(){v.addClass("menuTriggered"),v.removeClass("triggered")}),v}return y("#menuContainer").empty(),{setup:e}}(jQuery,InfieldCommands,InfieldMenu,Strings),InfieldSearch=function(t){var i,o,a,r,s,e=250;function n(n){if(o=t("#searchContainer"),a=t("#inlineSearch"),r=t("#searchCloseBtn"),s=t("#searchBtn"),i=t("#headerMain"),p(),t("#searchBtn").click(function(){t(this).hasClass("search")&&d()}).keypress(function(){t(this).hasClass("search")&&d()}),t("#searchCloseBtn").click(function(){l(),n("")}).keypress(function(){l(),n("")}),n){var e=c(function(e){n(t(e.currentTarget).val())},debounceWait);a.keyup(e)}t("#inlineSearch").focus(function(){t(".searchBar").addClass("hoverOver").fadeIn(100)}),t("#inlineSearch").focusout(function(){t(".searchBar").removeClass("hoverOver")})}function c(t,i){var o;return function(){var e=this,n=arguments;clearTimeout(o),o=setTimeout(function(){o=null,t.apply(e,n)},i)}}function d(){o.show(),i.hide(),o.animate({},e,function(){r.show(),a.fadeIn().focus()}),s.addClass("searchBtnActive")}function l(){o.hide(),i.show(),o.animate({},e,function(){r.hide(),a.fadeOut()}),a.val(""),s.removeClass("searchBtnActive")}function p(){o.hide(),s.removeClass("searchBtnActive")}function u(){o.show()}function f(){a.hide(),r.hide(),o.hide()}function g(e){e&&!0===e?u():f()}return{init:n,debounce:c,showIcon:u,hideIcon:f,display:g}}(jQuery),lpInfield=function(o,a,e,r,s,c,d,n,t){var l,p,u=t.translateString("No passwords found for this site."),f=t.translateString("No passwords found for this site."),g=t.translateString("Nothing in your vault to fill on this site."),m=t.translateString("Nothing in your vault to fill on this site."),h=10,w=360;function v(){var e=Date.now();document.addEventListener("DOMContentLoaded",function(){C(function(){var e;t.translate(document.body),y(),I(),r.init(["sitesView","formFillView","generatePassView"]),c.init(k),d.init(a,T),new MutationObserver(function(){T()}).observe(o(".infield-dialog")[0],{subtree:!0,childList:!0}),a.getInitialData(x)})})}function y(){p=new n({$parentEl:o(".infield-dialog")}),b({position:w})}function b(e){p&&(e&&e.position&&o.isNumeric(e.position)&&e.position>h&&e.position<w?p.show("top",e.position):p.show(!1,!1))}function I(){o("#btnClose").click(function(){a.closePopup("close")}),o("#btnClose").keypress(function(){a.closePopup("close")})}function C(i){document.body.style.setProperty("display","none","important");var e=document.createElement("iframe");e.setAttribute("class","backgroundFrame"),e.src="backgroundFrame.html?lplanguage="+encodeURIComponent(g_language),e.style.display="none",e.addEventListener("load",function(){e.contentWindow.LPPlatform.getBackgroundInterface({mainRequestFramework:!1,interfaceDefinition:Interfaces.InfieldPopupInterface,getData:!0,context:"infieldPopup",callback:function(e){window.bg=e}}),e.contentWindow.Topics.get(e.contentWindow.Topics.REQUEST_FRAMEWORK_INITIALIZED).subscribe(function(e,n){var t=parseInt(e.topFrameID);window.csTop=Interfaces.createInstance(Interfaces.ContentScriptInterface,{direct:!1,context:"infieldPopup",requestFunction:function(e){n.sendRequest({type:"contentScriptRequest",data:e,frameID:t})}}),window.csTop.LPFrame.initializeRequestFramework(LPTools.getURLParams().dialogID,function(e){e&&(document.body.style.removeProperty("display"),i&&i())})})}),document.body.appendChild(e)}function k(e){a.searchVault(e,l.type,P)}function P(e){var n=l.type;if(e){var t=JSON.parse(e);t&&(s.setup("sitesView","sites",t.sites,t.bigicons,T,f),s.setup("formFillView","formfills",t.formfills,null,T,m))}}function T(e,n){var t=o(".infield-dialog").outerHeight()+20,i=o(".infield-dialog").outerWidth()+10;e&&o.isNumeric(e)&&(t+=e),n&&o.isNumeric(n)&&(i+=n),csTop.LPInfieldFrame.resizeFrame(t,i)}function _(e){o("#fillSelector").show();var n=JSON.parse(e.fillData.sites),t=e.fillData.bigIcons?JSON.parse(e.fillData.bigIcons):null;s.setup("sitesView","sites",n,t,T,u);var i=e.fillData.formFills?JSON.parse(e.fillData.formFills):{};return s.setup("formFillView","formfills",i,null,T,g),r.show("formFillView"),d.hide(),Object.keys(n).length+Object.keys(i).length}function S(){o("#fillSelector").hide(),r.show("generatePassView"),a.getGeneratePrefs(d.setup),d.show()}function x(n){if(n){if((l=n).type)switch(n.type){case"generate":S(),c.display(!1);break;case"formfills":o(".lblSites").insertAfter("#formFillView"),o("#sitesView").insertAfter(".lblSites");default:var e=_(n)}if("generate"!=n.type&&n.condensedDropdown&&!0===n.condensedDropdown){var t={init:function(){o(".viewLabel").hide(),o("#fillSelector").show();var e=t.getData();t.createDropdown(e),t.selectDropdownOption()},getData:function(){var e=0,n=[];return o(".views").children("div").each(function(){var e={id:null,text:null};e.id=o(this).attr("id"),"sitesView"===e.id&&(e.text="Log in as",n.push(e)),"formFillView"===e.id&&(e.text="Fill form with",n.push(e))}),n},createDropdown:function(e){for(o("#fillSelector").html(""),o("<div/>",{id:"dropdownButton",class:"dropdownButton"}).appendTo("#fillSelector"),o("<span/>",{id:"dropdownButtonText",class:"dropdownButtonText",text:""}).appendTo("#dropdownButton"),o("<i/>",{id:"dropdownButtonIcon",class:"fa fa-caret-down dropdownButtonIcon",ariaHidden:!0}).appendTo("#dropdownButton"),o("<ul/>",{id:"dropdown",class:"dropdown"}).appendTo("#fillSelector"),i=0;i<e.length;i++)o("<li/>",{id:"option"+i,class:"option"+i,"data-viewed":e[i].id}).appendTo("#dropdown"),o("<i/>",{class:"fa fa-check","aria-hidden":!0}).appendTo("#option"+i),o("<span />",{text:e[i].text}).appendTo("#option"+i);o("#dropdown").hover(function(){InfieldMenuTimer.clearTimer()},function(){InfieldMenuTimer.startTimer()})},selectDropdownOption:function(e){void 0===e?e={id:"option0",text:o("#option0 > span").text(),action:o("#option0").attr("data-viewed")}:InfieldCommands.sendLPImprove("infield_dropdown_toggled",{toggle:e.action,domain:n.url}),o("#dropdownButtonText").text(e.text),o("#views").children().hide(),o('div[id*="'+e.action+'"]').show(),o("#dropdown > li > i").hide(),o("#dropdown > #"+e.id+" > i").show(),o("#dropdown").hide()}};t.init(),o("#dropdownButton").click(function(){o("#dropdown").show(),T(o("#dropdown").height())}),o("#dropdown > li").click(function(){var e={id:o(this).attr("id"),text:o(this).text(),action:o(this).attr("data-viewed")};t.selectDropdownOption(e)})}else n.noHeaders&&!0===n.noHeaders&&(o(".lblSites").hide(),o(".lblForms").hide());o("#searchBtn").click(function(){_(n),T()}).keypress(function(){_(n),T()}),o("#generatePassInfieldIconInfield").click(function(){S()}).keypress(function(){S()}),csTop.LPInfieldFrame.positionFrame(function(e){csTop.Topics.publish(Topics.INFIELD_NOTIFICATION_OPENED,e)}),csTop.LPInfieldFrame.show(),o(".infield-dialog").show()}else a.closePopup("close")}return{init:v,setArrowPosition:b}}(jQuery,InfieldCommands,InfieldMenu,InfieldView,InfieldTiles,InfieldSearch,InfieldGeneratePassword,lpArrow,Strings);lpInfield&&lpInfield.init();
//# sourceMappingURL=sourcemaps/betterLpInfield.js.map
