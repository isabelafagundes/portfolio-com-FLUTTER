'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e36da209f702cda262571f7d500db437",
"assets/AssetManifest.bin.json": "32b58d754d6b8033a0b4259582be3f24",
"assets/assets/4.png": "4e87d320a568e12983b43eb6461c2007",
"assets/assets/5.png": "a02e1bcbc52afc8993d8f2aab23b43dc",
"assets/assets/Aboreto/Aboreto-Regular.ttf": "cb4c7aaa6ca3d17c6a103c709538397e",
"assets/assets/Aesthetic%2520Minimal%2520Laptop%2520On%2520Table%2520Mockup%2520Instagram%2520Post.zip": "9d21731bc33ce57d66ce846abf4f01c7",
"assets/assets/api.svg": "9c423446bd706531f7ac6991377c2204",
"assets/assets/arquitetura.svg": "7c373b7fefe090587e6d50ad4225ae18",
"assets/assets/AssetManifest.bin": "de361495ad62e8fc41c2ac2f4734c39a",
"assets/assets/AssetManifest.bin.json": "3f2602acb0a9ff089fb8c77b8d34d2e9",
"assets/assets/AssetManifest.json": "78c505e0b6e6d27a2cfc47bc9f9ee247",
"assets/assets/background.jpg": "a2e2dad4754e2e26a3bf5089c6916907",
"assets/assets/background.png": "5c6a85dc9d779620a8ab3ec448c8d7fa",
"assets/assets/boas-praticas.svg": "10e4b61445e3abf6c0671e077872d015",
"assets/assets/chihiro.gif": "2b297f906480c965284d2fd4e7152a4a",
"assets/assets/chihiro_projeto.png": "939061747cbe3b10e0b9e6f51a0c6646",
"assets/assets/cmd.svg": "0d24761da2b0f08a9f230b34e3f1a2a3",
"assets/assets/coding.gif": "fa2f9e0300f8eef64c7ee594f15e3812",
"assets/assets/computer.jpg": "4c5da78e140925cbd690dc75ab626c36",
"assets/assets/dart.svg": "82a4b8e6270602125a9165f4fe4ff6d5",
"assets/assets/database.svg": "3d546f740246afb547a54ac1307d6d66",
"assets/assets/devices.svg": "f5c5a3bada613bbaf84740f79bfeac55",
"assets/assets/email.svg": "023ef9fe14e16055063ca53806a0e47c",
"assets/assets/exclaimation-circle.svg": "da6a44d73f11f1df35e19a6edd0e57d3",
"assets/assets/face-frown.svg": "3d3ac26ea4d112d7be65991f1cefab88",
"assets/assets/face-smile.svg": "2def32a4ecb9f72743a6b52f583bc648",
"assets/assets/falcao-soldado.gif": "c814d3f49c8085552a9845a50c5ecd87",
"assets/assets/flutter.svg": "5596577b4c5acbcb51e03fb6895c3e88",
"assets/assets/FontManifest.json": "0d771364b78abde598c27ef0bc778000",
"assets/assets/git.svg": "2c592fa0585ec59189473375420be20e",
"assets/assets/github.svg": "e5b95e141146c7d2293e9b81f4f28f4d",
"assets/assets/golang.svg": "5c86aacaa680186f37fb6ed6dc20b0f8",
"assets/assets/heart.svg": "b15f4195477ef6d53713b46a924dd2b3",
"assets/assets/home.svg": "2679c66cc8220a3f3810b72523e0fff6",
"assets/assets/identification.svg": "952f11e28b97a8cdb10b6f8e33d7d649",
"assets/assets/isabela.png": "ed7fa367e0a657be21586cb69647260a",
"assets/assets/java.svg": "68655e083b0f8f4307d92d37547cf8da",
"assets/assets/jogo-memoria.gif": "08ce080e0d5a10d034aa20c5ab7b3e69",
"assets/assets/leituramiga.gif": "dcee1f7e5a764a77418b2d76fa51fbf7",
"assets/assets/linkedin.svg": "9c05e6d920fa971f5989d11ff72c7fa3",
"assets/assets/memoria_projeto.png": "2346107e9def1331d12e8e896b718168",
"assets/assets/Montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/Montserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/Montserrat/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/assets/Montserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/Montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/Montserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/moon.svg": "86bf7fd1e58a69a391ea7f585be1cfe7",
"assets/assets/NOTICES": "979f9ce82e5f821f86641ea23870ed03",
"assets/assets/quarkus.svg": "b0bf76288e3d25a0ec8fca0955060c98",
"assets/assets/responsive.svg": "8198d4cf193a6d19e3bc694d045797dc",
"assets/assets/Shrikhand/Shrikhand-Regular.ttf": "b2142f626983b4a663cb43a84f2e086d",
"assets/assets/sparkles.svg": "deffad39131b32cd6c800629da57bb01",
"assets/assets/star.svg": "9701ff5cc926fd19ceca7b62a6eaa2fe",
"assets/assets/sun.svg": "0720bf4e90be1c7cbb9aa3e34747e4ce",
"assets/assets/tfws_projeto.png": "2b88a07fc367435521ccd2e61eff8d21",
"assets/assets/user.svg": "0ac09c8d4324715bee4c35ea5069d7fe",
"assets/FontManifest.json": "0d771364b78abde598c27ef0bc778000",
"assets/fonts/MaterialIcons-Regular.otf": "7352fa42e2cae7271b0677e273052f10",
"assets/NOTICES": "b7f679f6c4abceb37ab7c6624858a226",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "8df157727d9ebb8b42da6d04e1dde2a7",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b3a089ab9fe29e08ea852386308c661d",
"/": "b3a089ab9fe29e08ea852386308c661d",
"main.dart.js": "62b6405b694b0320370a737558f8f0af",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
