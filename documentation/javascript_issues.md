
# Getting Bootstrap JS to work
Bootstrap is JS dependent, meaning 2 things:
- You are required to load Jquery before loading Bootstrap
- Include Bootstrap and Jquery in your JS files on the header in sequence as aforementioned
# Related to installing Jquery and Scss - and getting Javascript to work on development

jiawei@Lim-Jia-Weis-MacBook-Air zutapp % ./bin/importmap json
{
  "imports": {
    "application": "/assets/application-f6ede83e93a075d188edacdcac3b6a66dc630eecb26017db5bda0b5192745984.js",
    "@hotwired/turbo-rails": "/assets/turbo.min-96cbf52c71021ba210235aaeec4720012d2c1df7d2dab3770cfa49eea3bb09da.js",
    "@hotwired/stimulus": "/assets/stimulus.min-900648768bd96f3faeba359cf33c1bd01ca424ca4d2d05f36a5d8345112ae93c.js",
    "@hotwired/stimulus-loading": "/assets/stimulus-loading-1fc59770fb1654500044afd3f5f6d7d00800e5be36746d55b94a2963a7a228aa.js",
    "jquery": "/assets/jquery.min-7ee715ee3f73b3fb2f6b3107a4f4aa67bebc05b366aef81d2d164ce30044c7c6.js",
    "jquery_ujs": "/assets/jquery_ujs-2f30aab14285d5b78b272a2bdb19ec8d8346b0c831e45a16a88546c9969e0330.js",
    "popper": "/assets/popper-f6f216e33a146423f2ff236cdf13e2b7472a4333e26a59bfafd1d42383c61682.js",
    "bootstrap": "/assets/bootstrap.min-20a034247d4d545a7a2d49d62ee00c40f53f825562ed9d6c9af1ad42383e67f6.js",
    "controllers/application": "/assets/controllers/application-368d98631bccbf2349e0d4f8269afb3fe9625118341966de054759d96ea86c7e.js",
    "controllers/hello_controller": "/assets/controllers/hello_controller-549135e8e7c683a538c3d6d517339ba470fcfb79d62f738a0a089ba41851a554.js",
    "controllers": "/assets/controllers/index-2db729dddcc5b979110e98de4b6720f83f91a123172e87281d5a58410fc43806.js",
    "controllers/reset_form_controller": "/assets/controllers/reset_form_controller-e189b30e9d263048ee90cbe6024421b0db621c96f0a88f90ce0faacebbaf1d9d.js",
    "rooms/room": "/assets/rooms/room-0c641fa9506130209badec68679418d56f1d70075aa2a9dd323f7373371f81ba.js"
  }
}

- notice that "rooms/room" is in /assets, it should be in app/javascript
- also notice that app/javascript isnt even called, is that included already?