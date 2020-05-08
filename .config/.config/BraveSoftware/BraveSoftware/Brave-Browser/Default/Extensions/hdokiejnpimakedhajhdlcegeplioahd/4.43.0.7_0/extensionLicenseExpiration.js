ExtensionLicenseExpiration=function(A){var n,i,t,r,s,a,e,d=function(e,n,i,t){var r=$(A.body),s="license_expiration_seen",a="license_expiration_upgrade",d="license_expiration_learn_more",o="license_expiration_dismiss",p,l=document.getElementById("notificationContainer"),g=LPTools.createElement("div"),m=LPTools.createElement("p"),c=LPTools.createElement("button"),S=LPTools.createElement("a");g.setAttribute("id","expirationTextContainer"),m.setAttribute("id","expirationText"),c.setAttribute("id","expirationUpgradeButton"),S.setAttribute("id","expirationLearnMore");var x=document.getElementById("panelContainer"),u=LPTools.createElement("h1"),L=LPTools.createElement("p"),E=LPTools.createElement("span"),T=LPTools.createElement("a"),v=LPTools.createElement("div","features"),b=LPTools.createElement("div","feature one"),P=LPTools.createElement("div","feature two"),f=LPTools.createElement("div","feature three"),I=LPTools.createElement("div","buttons"),C=LPTools.createElement("button","try-btn"),h=LPTools.createElement("button","no-thanks-btn"),k=function(){$("#notificationContainer").empty(),g.appendChild(m),g.appendChild(S),l.appendChild(g),l.appendChild(c)},y=function(){$("#panelContainer").empty(),L.appendChild(E),L.appendChild(T),v.appendChild(b),v.appendChild(P),v.appendChild(f),I.appendChild(C),I.appendChild(h),x.appendChild(u),x.appendChild(L),x.appendChild(v),x.appendChild(I)};switch(e){case"Enterprise Admin":void 0!==i&&i<1?(y(),p=("trial"===n?(u.innerText=Strings.translateString("Your LastPass Enterprise trial expired."),E.innerText=Strings.translateString("Upgrade now to avoid losing LastPass Enterprise features."),C.innerText=Strings.translateString("Upgrade to LastPass Enterprise"),T.innerText=Strings.translateString("Learn More")):(u.innerText=Strings.translateString("Your Enterprise License has expired."),E.innerText=Strings.translateString("Renew now to avoid losing LastPass Enterprise features."),T.innerText=Strings.translateString("Learn More"),C.innerText=Strings.translateString("Renew LastPass Enterprise")),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Federated Login with AD Sync"),P.innerText=Strings.translateString("SAML Single Sign-On"),f.innerText=Strings.translateString("Advanced Reporting"),"dismissedEnterpriseExpired"),r.addClass("panelIsActive licenseExpired"),x.classList.add("enterpriseExpired"),bg.sendLpImprove(s),C.addEventListener("click",function(){bg.sendLpImprove(a),bg.openenterprisepayment()}),T.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}),h.addEventListener("click",function(){bg.sendLpImprove(o),r.removeClass("panelIsActive licenseExpired"),ExtensionDropdown.setSize(),_(p,1)})):(void 0!==i&&i<=30&&1!==t?(k(),m.innerText=Strings.translateString("Your LastPass Enterprise license expires in %1 days.",i),c.innerText=Strings.translateString("Renew"),S.innerText=Strings.translateString("Learn More"),r.addClass("expirationSet"),bg.sendLpImprove(s)):(k(),m.innerText=Strings.translateString("Your LastPass Enterprise trial expires in %1 days.",i),c.innerText=Strings.translateString("Upgrade"),S.innerText=Strings.translateString("Learn More"),bg.sendLpImprove(s),r.addClass("expirationSet")),c.addEventListener("click",function(){bg.sendLpImprove(a),bg.openenterprisepayment()}),S.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}));break;case"Teams Admin":void 0!==i&&i<1?(y(),p=("trial"===n?(u.innerText=Strings.translateString("Your Teams License has expired."),E.innerText=Strings.translateString("Upgrade now to avoid losing LastPass Teams features."),C.innerText=Strings.translateString("Upgrade to LastPass Teams")):(u.innerText=Strings.translateString("Your Teams License has expired."),E.innerText=Strings.translateString("Renew now to avoid losing LastPass Teams features."),C.innerText=Strings.translateString("Renew LastPass Teams")),T.innerText=Strings.translateString("Learn More"),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Admin Console"),P.innerText=Strings.translateString("User Management"),f.innerText=Strings.translateString("Increased Security Policies"),"dismissedTeamsExpired"),r.addClass("panelIsActive licenseExpired"),x.classList.add("teamsExpired"),bg.sendLpImprove(s),C.addEventListener("click",function(){bg.sendLpImprove(a),bg.openteamspayment()}),T.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}),h.addEventListener("click",function(){bg.sendLpImprove(o),r.removeClass("panelIsActive licenseExpired"),ExtensionDropdown.setSize(),_(p,1)})):(void 0!==i&&i<=30&&1!==t?(k(),m.innerText=Strings.translateString("Your LastPass Teams license expires in %1 days.",i),c.innerText=Strings.translateString("Renew"),S.innerText=Strings.translateString("Learn More"),r.addClass("expirationSet"),bg.sendLpImprove(s),c.addEventListener("click",function(){bg.sendLpImprove(a),bg.openenterprisepayment()})):(k(),m.innerText=Strings.translateString("Your LastPass Teams trial expires in %1 days.",i),c.innerText=Strings.translateString("Upgrade"),S.innerText=Strings.translateString("Learn More"),r.addClass("expirationSet"),bg.sendLpImprove(s),c.addEventListener("click",function(){bg.sendLpImprove(a),bg.openteamspayment()})),S.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}));break;case"Family Admin":void 0!==i&&i<1?(y(),"trial"===n?(u.innerText=Strings.translateString("Your LastPass Families trial expired."),E.innerText=Strings.translateString("Upgrade now to avoid losing LastPass Families features."),C.innerText=Strings.translateString("Upgrade to LastPass Families"),T.innerText=Strings.translateString("Learn More"),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Six Premium Licenses"),P.innerText=Strings.translateString("Family Manager Dashboard"),f.innerText=Strings.translateString("Unlimited Shared Folders"),p="dismissedFamiliesExpired"):void 0!==i&&i<1&&1!==t&&(u.innerText=Strings.translateString("Your Families License has expired."),E.innerText=Strings.translateString("Renew now to avoid losing LastPass Families features."),C.innerText=Strings.translateString("Renew LastPass Families"),T.innerText=Strings.translateString("Learn More"),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Six Premium Licenses"),P.innerText=Strings.translateString("Family Manager Dashboard"),f.innerText=Strings.translateString("Unlimited Shared Folders"),a="license_expired_upgrade_families",d="license_expired_learn_more_families",o="license_expired_dismiss_families",p="dismissedFamiliesExpired",s="license_expired_seen_families"),r.addClass("panelIsActive licenseExpired"),x.classList.add("familiesExpired"),bg.sendLpImprove(s),C.addEventListener("click",function(){bg.sendLpImprove(a),bg.openfamiliespayment()}),T.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}),h.addEventListener("click",function(){bg.sendLpImprove(o),r.removeClass("panelIsActive licenseExpired"),ExtensionDropdown.setSize(),_(p,1)})):(k(),m.innerText=Strings.translateString("Your LastPass Families trial expires in %1 days.",i),c.innerText=Strings.translateString("Upgrade"),S.innerText=Strings.translateString("Learn More"),r.addClass("expirationSet"),bg.sendLpImprove(s),c.addEventListener("click",function(){bg.sendLpImprove(a),bg.openfamiliespayment()}),S.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}));break;case"Premium Trial User":void 0!==i&&i<1?(y(),u.innerText=Strings.translateString("Your LastPass Premium trial expired."),E.innerText=Strings.translateString("Upgrade now to avoid losing LastPass Premium features."),C.innerText=Strings.translateString("Upgrade to LastPass Premium"),T.innerText=Strings.translateString("Learn More"),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Unlimited 1:1 Password Sharing"),P.innerText=Strings.translateString("Emergency Access"),f.innerText=Strings.translateString("Two-Factor Authentication"),p="dismissedPremiumTrialExpired",r.addClass("panelIsActive licenseExpired"),x.classList.add("premiumExpired"),bg.sendLpImprove(s),C.addEventListener("click",function(){bg.sendLpImprove(a),bg.openpremium()}),T.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}),h.addEventListener("click",function(){bg.sendLpImprove(o),r.removeClass("panelIsActive licenseExpired"),ExtensionDropdown.setSize(),_(p,1)})):(k(),m.innerText=Strings.translateString("Your LastPass Premium trial expires in %1 days.",i),c.innerText=Strings.translateString("Upgrade"),S.innerText=Strings.translateString("Learn More"),r.addClass("expirationSet"),bg.sendLpImprove(s),c.addEventListener("click",function(){bg.sendLpImprove(a),bg.openpremium()}),S.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}));break;case"Free User":void 0!==i&&-30<=i&&(y(),u.innerText=Strings.translateString("Your LastPass Premium trial expired."),E.innerText=Strings.translateString("Upgrade now to avoid losing LastPass Premium features."),C.innerText=Strings.translateString("Upgrade to LastPass Premium"),T.innerText=Strings.translateString("Learn More"),h.innerText=Strings.translateString("No Thanks"),b.innerText=Strings.translateString("Unlimited 1:1 Password Sharing"),P.innerText=Strings.translateString("Emergency Access"),f.innerText=Strings.translateString("Two-Factor Authentication"),p="dismissedPremiumTrialExpired",r.addClass("panelIsActive licenseExpired"),x.classList.add("premiumExpired"),bg.sendLpImprove(s),C.addEventListener("click",function(){bg.sendLpImprove(a),bg.openpremium()}),T.addEventListener("click",function(){bg.sendLpImprove(d),bg.openpricing()}),h.addEventListener("click",function(){bg.sendLpImprove(o),r.removeClass("panelIsActive licenseExpired"),ExtensionDropdown.setSize(),_(p,1)}))}ExtensionDropdown.setSize()},_=function(e,n){var i=JSON.parse(localStorage.getItem("expiredData"));null===i?(i={})[e]=n:i[e]=n,localStorage.setItem("expiredData",JSON.stringify(i))},o,p,l,g,m,c,S,x,u;return{initialize:function(){var e;n=bg.get("LPContentScriptFeatures").license_expiration,i=LPProxy.getAccountClass(),t=bg.get("g_premium_trial_exp_days"),r=bg.get("g_company_trial_exp_days"),s=bg.get("g_company_license_exp_days"),a=bg.get("g_company_renewalstatus"),360<s&&(null!==JSON.parse(localStorage.getItem("expiredData"))&&localStorage.removeItem("expiredData"))},showExpiration:d,getStoredExpPrefs:function(e,n,i,t){var r=JSON.parse(localStorage.getItem("expiredData"));return null!==r&&(1===r[e]||1===r[n]||1===r[i]||1===r[t])},premiumTrialExpiringStatusChecker:function(){return n&&null!==t&&t<=7&&1<=t&&"Premium Trial User"===i},premiumTrialExpiredStatusChecker:function(){return n&&null!==t&&t<1&&-31<t&&("Premium Trial User"===i||"Free User"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedPremiumTrialExpired")},companyTrialExpiringStatusChecker:function(){return n&&null!==r&&r<=7&&1<=r},companyTrialExpiredStatusChecker:function(){return n&&null!==r&&r<1&&("Enterprise Admin"===i||"Teams Admin"===i||"Family Admin"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedEnterpriseExpired","dismissedTeamsExpired","dismissedFamiliesExpired")},companyLicenseExpiredStatusChecker:function(){return n&&null!==s&&s<1&&("Enterprise Admin"===i||"Teams Admin"===i||"Family Admin"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedEnterpriseExpired","dismissedTeamsExpired","dismissedFamiliesExpired")},companyLicenseExpiringStatusChecker:function(){return n&&null!==s&&s<=30&&1!==a&&("Enterprise Admin"===i||"Teams Admin"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedEnterpriseExpired","dismissedTeamsExpired","dismissedFamiliesExpired")},expiredCompanyStatusCheckerForPanelSize:function(){return n&&(null!==s&&s<1||null!==r&&r<1)&&("Enterprise Admin"===i||"Teams Admin"===i||"Family Admin"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedEnterpriseExpired","dismissedTeamsExpired","dismissedFamiliesExpired")},expiredPremiumStatusCheckerForPanelSize:function(){return n&&null!==t&&t<1&&("Premium Trial User"===i||"Free User"===i)&&!ExtensionLicenseExpiration.getStoredExpPrefs("dismissedPremiumTrialExpired")}}}(document);
//# sourceMappingURL=sourcemaps/extensionLicenseExpiration.js.map
