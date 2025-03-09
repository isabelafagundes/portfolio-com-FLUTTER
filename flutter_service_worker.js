'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "de361495ad62e8fc41c2ac2f4734c39a",
"assets/AssetManifest.bin.json": "3f2602acb0a9ff089fb8c77b8d34d2e9",
"assets/AssetManifest.json": "78c505e0b6e6d27a2cfc47bc9f9ee247",
"assets/assets/4.png": "4e87d320a568e12983b43eb6461c2007",
"assets/assets/5.png": "a02e1bcbc52afc8993d8f2aab23b43dc",
"assets/assets/Aboreto/Aboreto-Regular.ttf": "cb4c7aaa6ca3d17c6a103c709538397e",
"assets/assets/Aesthetic%2520Minimal%2520Laptop%2520On%2520Table%2520Mockup%2520Instagram%2520Post.zip": "9d21731bc33ce57d66ce846abf4f01c7",
"assets/assets/api.svg": "9c423446bd706531f7ac6991377c2204",
"assets/assets/arquitetura.svg": "da2d0a3c09d391a2011ca74969702654",
"assets/assets/AssetManifest.bin": "de361495ad62e8fc41c2ac2f4734c39a",
"assets/assets/AssetManifest.bin.json": "3f2602acb0a9ff089fb8c77b8d34d2e9",
"assets/assets/AssetManifest.json": "78c505e0b6e6d27a2cfc47bc9f9ee247",
"assets/assets/background.jpg": "a2e2dad4754e2e26a3bf5089c6916907",
"assets/assets/boas-praticas.svg": "10e4b61445e3abf6c0671e077872d015",
"assets/assets/chihiro.gif": "2b297f906480c965284d2fd4e7152a4a",
"assets/assets/chihiro_projeto.png": "939061747cbe3b10e0b9e6f51a0c6646",
"assets/assets/cmd.svg": "c3985a84622d702dbec706ade845f53e",
"assets/assets/coding.gif": "fa2f9e0300f8eef64c7ee594f15e3812",
"assets/assets/computer.jpg": "4c5da78e140925cbd690dc75ab626c36",
"assets/assets/dart.svg": "82a4b8e6270602125a9165f4fe4ff6d5",
"assets/assets/database.svg": "d44016ec80f66c0cd5f5f67b30100b12",
"assets/assets/devices.svg": "f5c5a3bada613bbaf84740f79bfeac55",
"assets/assets/email.svg": "2003f3b2ca84ea73a9b46b2820753b28",
"assets/assets/falcao-soldado.gif": "c814d3f49c8085552a9845a50c5ecd87",
"assets/assets/flutter.svg": "5596577b4c5acbcb51e03fb6895c3e88",
"assets/assets/FontManifest.json": "0d771364b78abde598c27ef0bc778000",
"assets/assets/git.svg": "2c592fa0585ec59189473375420be20e",
"assets/assets/github.svg": "93fbbf84fd22b6e903b68f2e5199b10b",
"assets/assets/golang.svg": "00d05689ef69fd771e1b0bd9b88ec666",
"assets/assets/heart.svg": "2df583e1cbcd346efa27393428a7d1e1",
"assets/assets/home.svg": "df3901aa281085b966f719224c91e105",
"assets/assets/identification.svg": "052fd83d1b59ba871564b6b0068fc7a2",
"assets/assets/isabela.png": "ed7fa367e0a657be21586cb69647260a",
"assets/assets/java.svg": "68655e083b0f8f4307d92d37547cf8da",
"assets/assets/jogo-memoria.gif": "08ce080e0d5a10d034aa20c5ab7b3e69",
"assets/assets/leituramiga.gif": "dcee1f7e5a764a77418b2d76fa51fbf7",
"assets/assets/linkedin.svg": "96d2a5b6213f2286a9c7f4bdf1dfbed9",
"assets/assets/memoria_projeto.png": "2346107e9def1331d12e8e896b718168",
"assets/assets/Montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/Montserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/Montserrat/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/assets/Montserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/Montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/Montserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/moon.svg": "36206c141726814899f01918b2b0d7ee",
"assets/assets/NOTICES": "61c6ac901ac8933ba2c97dbaec886256",
"assets/assets/quarkus.svg": "38fcd6d7920cc9babbf847f53378e46c",
"assets/assets/responsive.svg": "8198d4cf193a6d19e3bc694d045797dc",
"assets/assets/Shrikhand/Shrikhand-Regular.ttf": "b2142f626983b4a663cb43a84f2e086d",
"assets/assets/sparkles.svg": "29deca0b5b8b0ee6fd0bef612977a16e",
"assets/assets/star.svg": "919b36ffea14906ad986bc3df4d54d79",
"assets/assets/sun.svg": "b91e7e48c5311b7b38f926e5cf015dca",
"assets/assets/tfws_projeto.png": "2b88a07fc367435521ccd2e61eff8d21",
"assets/assets/user.svg": "d2065379f44360971bcdf4612c01cc07",
"assets/FontManifest.json": "0d771364b78abde598c27ef0bc778000",
"assets/fonts/MaterialIcons-Regular.otf": "1782c2a430951fe823b3413790f5ef41",
"assets/NOTICES": "61c6ac901ac8933ba2c97dbaec886256",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "29aeacd259c5748ebe78376ba4f23130",
"icons/Icon-192.png": "f37aabcafda36744cfcd1d72f24840f2",
"icons/Icon-512.png": "43739495a6ba18eb0c6454cba0be782f",
"icons/Icon-maskable-192.png": "f37aabcafda36744cfcd1d72f24840f2",
"icons/Icon-maskable-512.png": "43739495a6ba18eb0c6454cba0be782f",
"index.html": "c48b07a546826e2af541e51f31c82a36",
"/": "c48b07a546826e2af541e51f31c82a36",
"logo.png": "e7a36722def3464fde74be5e9d57608c",
"main.dart.js": "7d50852763c9216bde4db12d87caf11f",
"manifest.json": "90728fb0606177611c36aaa01b25117d",
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
