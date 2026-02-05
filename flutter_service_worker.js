'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "34ae1e90f4bddeb6a9251c71a85e5bf1",
"version.json": "3984a118f4b1c11fe5d65a767f0eb813",
"index.html": "b9bcc65528ba1d5e8f0b49d8e990ac3f",
"/": "b9bcc65528ba1d5e8f0b49d8e990ac3f",
"main.dart.js": "e16ffdb83b561429af8b06b5d5400192",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e3a6310c1767d2abae881eda04cc9f27",
".git/config": "c639ceaaab356dfb4cbc595da7216f56",
".git/objects/61/ba976c706c4f1fa92622d6797ec950455b49a9": "7c54c3a5ce85b3a8e4936ccce71e9724",
".git/objects/59/f6f049ade0832c2797a4426dfbec6f9043fb32": "72a53c6d88be0be223e0f29442648304",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/9e/4d35c38a375533e3a692d708ab15e85cf61f6a": "8fdb8bb476c0318249f0554b8f796e82",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/69/e0ef181983c5d31e55e33c0c6d5a53fa3a8bd4": "1a63b55564146b4e8a83bf8de70cde8f",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/a4/b724b827bc046bd4c60659e494d039940c6bc2": "5764bdf9ab00193a658754863f5ca081",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/df6dd9e68b06589ae2ac071042474e22aa4692": "c868916eb16a61b2e412ca36545f1358",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fc/ed429988a6a3919a5ee049d298a098bb920267": "14aeea063f435620d77a260c91244245",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/bcda9abeeab6bcb28cace3373e0ea6fbdc4a66": "39e747fdedad6abeff349723acc39e25",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/7c/1d22ee56878aec452bff325e8ab3403ccfb394": "4f2a115ec0735dbd24b0ec530ad0d682",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/8a/57aa2083421d982497634453aba65d78dad3ef": "fb2061bb5c1d73c54c6dc1d241409c9f",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/86/be828ef90bb4fc656db1ba2e8080c28e96da79": "fee4ffd4bf05503f99c5540aa604687e",
".git/objects/2f/6e1955778e146296dbaea753300b87b45d69f8": "093903e7e7487e3e1009d2830fe67995",
".git/objects/88/40ca06600b3117e7a244869f810ce4f04c9bdd": "6c138ef3c5f2c8b8dc55320d75d8ff1e",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/98/16e927c62eeb08a56debcbc147cc85e939d809": "a4522eee12c4a9f773991bb5f5e4a837",
".git/objects/37/3b71959ffc390faeeefd385145dfc19434d6ae": "ded06507bd3f9064393b7b5c9018faf3",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/dc/e53342172cc1b06f06a47676fe5f74d495eb3a": "54a1703f32b454208fd227e112ff83eb",
".git/objects/d5/9960a328362228aeb49021ae9c235095460435": "0028d9f7f08de5353998cd10e15b951a",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/634ac054e904a2ae0aa76d2cfcabb8aba368d7": "bbdc4ab619b9757d45f8d25e87a6dff6",
".git/objects/a6/f48485f967c8729eb8c7098bfd032ef5001348": "dc6db7b5885c903c4e71a4dd24253e31",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/c4/08621d8fff69ff7db9cf3d27894d37196f4514": "d5ae3d0ed926f6dd07975f8ca87e2e5a",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/fa/596007eecb71bbc6edf7ba7c01add08ec9fd0f": "b092f11ca868d32c8dc05fdd7ec1dd15",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/f1/850945a048d73da971814a9ec214a5732b2498": "4278ab524a87d36757ffd71d1e823e52",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/79/4c8a4d12abf337a8ae8377da3326b27627f505": "11ab485adb97dc8982ba47da19d5f3e0",
".git/objects/48/73f27ccc35a09de0ec12d1a0259b444874e42b": "d8238e9fe147e959f744808700c7a1c2",
".git/objects/84/c987c8585bca1802494ff8342b64fe85e697f9": "d4de47b3d5189e61a76724b5c01e071d",
".git/objects/4a/cbcee86f828732342870c3656e99f74e3db7c0": "44ceda8bbde8afc781a05d8ea78d25c9",
".git/objects/23/1866d3d8e356e4e9a579658eda87c7b39e32e1": "af74c2fb25c2075f03c22185dc273421",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/76/c213f927c013fbec9d3588470fa964caf39037": "659569571f37aaceced2a49ea1e86745",
".git/objects/78/ee74399a9d6dc010ed03dde635907af924ba33": "bf314c9f30c8f1b8efcba7bb5d2563e4",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "421dbcabc67fe6b6098122916d51da83",
".git/logs/refs/heads/gh-pages": "421dbcabc67fe6b6098122916d51da83",
".git/logs/refs/remotes/origin/gh-pages": "d4cc9a87ae0628f632d3edc4d0720a2e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "1bb895329adb99ed8e9cbd1066b56575",
".git/refs/remotes/origin/gh-pages": "1bb895329adb99ed8e9cbd1066b56575",
".git/index": "8f400c9181e02104403ccd6d769d0dce",
".git/COMMIT_EDITMSG": "1a4a097e17ceee03ae7a8df9253ac51a",
"assets/NOTICES": "61c239246fefe2cfffc491b11bdaad4a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "e687accd33156e3628878887e2a7b423",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "7200e740e51b350ee2ea58836502e0a2",
"assets/fonts/MaterialIcons-Regular.otf": "e0518b171c582cdb97c488b7910cc0ac",
"assets/assets/images/term_deposit.png": "a21ee89f62c55dfa41ba8612c028d410",
"assets/assets/images/microtakaful.png": "6822caafdf4270220aa4fb6e8eb74cf3",
"assets/assets/images/Rectangle%25201276.png": "cd4e8d2b10eb3e6ea57887ad81fb7a28",
"assets/assets/images/logobeu.121ceabe.png": "f00b997720f9a4b50e59e7ddcc94249b",
"assets/assets/images/nest.png": "ebafe2e487391c934d4340129674c200",
"assets/assets/images/profile.png": "f580f9095c6ef65f586ca32c1f3d85f1",
"assets/assets/images/superhero.png": "9ceddacfc01e8924de318b75d50a2d04",
"assets/assets/images/4.png": "216d9225acce87967d44381709eea5fe",
"assets/assets/images/2.png": "c56f18ba995dd0004a0b78b027899202",
"assets/assets/images/logobeu.121ceabe.svg": "03a9f9f280e4733926491f3222ad0b09",
"assets/assets/images/3.png": "fab0539479e5d8ae8d23c7db673c4bcb",
"assets/assets/images/1.png": "807bd27c5a73465f116011104691ac07",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
