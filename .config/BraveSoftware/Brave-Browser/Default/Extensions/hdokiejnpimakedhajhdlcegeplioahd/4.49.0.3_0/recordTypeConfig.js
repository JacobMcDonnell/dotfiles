var RecordTypeConfig={TYPE:{Password:"Account",SecureNote:"Generic",Address:"Address",CreditCard:"Credit Card",BankAccount:"Bank Account",DriversLicense:"Driver's License",Passport:"Passport",SocialSecurity:"Social Security",Insurance:"Insurance",HealthInsurance:"Health Insurance",Membership:"Membership",Wifi:"Wi-Fi Password",EmailAccount:"Email Account",InstantMessenger:"Instant Messenger",Database:"Database",Server:"Server",SSHKey:"SSH Key",SoftwareLicense:"Software License",Custom:"Custom",CloudApps:"Cloud Apps"},types:[{id:"Password",name:"Password",recordType:"",isPrimaryItem:!0},{id:"SecureNote",name:"Secure note",recordType:"",isPrimaryItem:!0,enterprisePolicyId:"1"},{id:"Address",name:"Address",recordType:"",isPrimaryItem:!0,enterprisePolicyId:"2"},{id:"CreditCard",name:"Payment card",recordType:"",isPrimaryItem:!0,enterprisePolicyId:"3"},{id:"BankAccount",name:"Bank account",recordType:"",isPrimaryItem:!0,enterprisePolicyId:"4"},{id:"DriversLicense",name:"Driver's license",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"5"},{id:"Passport",name:"Passport",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"6"},{id:"SocialSecurity",name:"Social security number",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"7"},{id:"Insurance",name:"Insurance policy",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"8"},{id:"HealthInsurance",name:"Health insurance",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"9"},{id:"Membership",name:"Membership",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"10"},{id:"Wifi",name:"Wi-fi password",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"11"},{id:"EmailAccount",name:"Email account",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"12"},{id:"InstantMessenger",name:"Instant messenger",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"13"},{id:"Database",name:"Database",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"14"},{id:"Server",name:"Server",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"15"},{id:"SSHKey",name:"SSH key",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"16"},{id:"SoftwareLicense",name:"Software license",recordType:"",isPrimaryItem:!1,enterprisePolicyId:"17"},{id:"Custom",name:"Custom item",recordType:"",composite:!0,enterprisePolicyId:"18"},{id:"CloudApps",name:"Cloud Apps",recordType:"",isPrimaryItem:!0,noAddItemCard:!0,enterprisePolicyId:"19"}],views:[{id:"all",name:"All Items",default:!0,types:null},{id:"cloud-apps",name:"Cloud Apps",default:!0,types:["CloudApps"],url:"saml/launch/nopassword?RelayState=/",user:"Enterprise Admin|Enterprise User|Enterprise Role User",segmentEvent:"vault_cloud_apps_clicked"},{id:"passwords",name:"Passwords",default:!0,types:["Password"]},{id:"notes",name:"Notes",default:!0,types:["SecureNote"]},{id:"addresses",name:"Addresses",default:!0,types:["Address"]},{id:"payment-cards",name:"Payment Cards",default:!0,types:["CreditCard"]},{id:"bank-accounts",name:"Bank Accounts",default:!0,types:["BankAccount"]},{id:"drivers-license",name:"Driver's Licenses",default:!1,types:["DriversLicense"]},{id:"passports",name:"Passports",default:!1,types:["Passport"]},{id:"ssn",name:"Social Security Numbers",default:!1,types:["SocialSecurity"]},{id:"insurance",name:"Insurance Policies",default:!1,types:["Insurance"]},{id:"health-insurance",name:"Health Insurance Policies",default:!1,types:["HealthInsurance"]},{id:"memberships",name:"Memberships",default:!1,types:["Membership"]},{id:"wifi",name:"Wi-Fi Passwords",default:!1,types:["Wifi"]},{id:"emails",name:"Email Accounts",default:!1,types:["EmailAccount"]},{id:"ims",name:"Instant Messenger Accounts",default:!1,types:["InstantMessenger"]},{id:"databases",name:"Databases",default:!1,types:["Database"]},{id:"servers",name:"Servers",default:!1,types:["Server"]},{id:"ssh",name:"SSH Keys",default:!1,types:["SSHKey"]},{id:"software-keys",name:"Software Licenses",default:!1,types:["SoftwareLicense"]},{id:"custom-items",name:"Custom Items",default:!1,types:["Custom"]}],viewConfig:[["all","cloud-apps"],["passwords","notes","addresses"],["payment-cards","bank-accounts"],["drivers-license","passports","ssn"],["insurance","health-insurance","memberships","wifi"],["emails","ims"],["databases","servers","ssh","software-keys","custom-items"]],icons:{all:"fa fa-home",CloudApps:"fa fa-rocket",CreditCard:"fa fa-credit-card-alt",Password:"fa fa-lock",SecureNote:"fa fa-sticky-note",Address:"fa fa-address-book",BankAccount:"fa fa-bank",Database:"fa fa-database",DriversLicense:"fa fa-car",Folder:"fa fa-folder",Insurance:"fa fa-umbrella",HealthInsurance:"fa fa-heartbeat",Membership:"fa fa-barcode",Passport:"fa fa-globe",Server:"fa fa-server",SocialSecurity:"fa fa-balance-scale",SoftwareLicense:"fa fa-laptop",SSHKey:"fa fa-user-secret",Wifi:"fa fa-wifi",InstantMessenger:"fa fa-comments-o",EmailAccount:"fa fa-envelope",Custom:"fa fa-puzzle-piece"}};for(var i in RecordTypeConfig.types)if(RecordTypeConfig.types.hasOwnProperty(i)){var recordType=RecordTypeConfig.types[i];recordType.recordType=RecordTypeConfig.TYPE[recordType.id]}"undefined"!=typeof module&&(module.exports=RecordTypeConfig);
//# sourceMappingURL=sourcemaps/recordTypeConfig.js.map
