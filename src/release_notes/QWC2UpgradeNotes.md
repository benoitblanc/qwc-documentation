# Upgrade notes

This document describes incompatibilites and other aspects which QWC2 applications need to address when updating against the latest qwc2 submodule.

When updating the `qwc2` submodule, run `yarn install` to ensure the dependencies are up to date!

Update to qwc2 submodule revision [38b242a](https://github.com/qgis/qwc2/tree/38b242a) (01.11.2023)
---------------------------------------------------------------------------------------------------

**Import svg as inline assets**

`qwc2/utils/FeatureStyles.js` now imports some SVG files as inline assets. For this to work, you need to list `.svg` in the `assets/inline` loader rules in `webpack.config.js`:

    {
        test: /(.woff|.woff2|.png|.jpg|.gif|.svg)/,
        type: 'asset/inline'
    }

**Babel plugin changes**

The `class-properties` and `object-rest-spread` proposals have been merged to the ECMAScript standard, and the respective babel plugins in `.babelrc.json` need to be changed to

    "plugins": [
        "@babel/plugin-transform-class-properties",
        "@babel/plugin-transform-object-rest-spread"
    ]

Update to qwc2 submodule revision [7409372](https://github.com/qgis/qwc2/tree/7409372) (23.08.2023)
---------------------------------------------------------------------------------------------------

**MapInfoToolTip plugin instantation change**

* The instantation of the `MapInfoToolTip` in `appConfig.js` needs to be changed to

        MapInfoTooltipPlugin: MapInfoTooltipPlugin()

  Note the extra braces at the end. As a new feature, you can pass a list of [plugins](/references/qwc2_plugins/#mapinfotooltip) to the `MapInfoTooltipPlugin`.

**Configuration changes**

* The window size configuration of various plugins has been uniformized to the `geometry` config prop (rather than occasionally `windowSize` before). Affected plugins are: `FeatureForm`, `Identify`, `LayerCatalog`, `LayerTree`, `MapLegend`. Please check the respective [plugin reference](/references/qwc2_plugins/) for more details on the new format.

Update to qwc2 submodule revision [96aaa51](https://github.com/qgis/qwc2/tree/96aaa51) (09.02.2023)
---------------------------------------------------------------------------------------------------

**Config setting change**

* Geodesic measurement mode is now configured at toplevel in `config.json` via `geodesicMeasurements: true|false` rather than below `Map -> cfg -> toolsOptions -> MeasurementSupport`.

Update to qwc2 submodule revision [7a474e3](https://github.com/qgis/qwc2/tree/7a474e3) (23.01.2023)
---------------------------------------------------------------------------------------------------

**Dependency update**

Most dependencies have been updated to the latest version. The following adjustments need to be performed by hand:

* Use `createRoot` in `app.jsx`, see the [demo `app.jsx`](https://github.com/qgis/qwc2-demo-app/blob/1ec0a2ba614ddfb2bc30ab0d3db083fbcc5da524/js/app.jsx).
* Update `uuid` imports in external components, examples:

        import {v1 as uuidv1} from 'uuid';
        import {v4 as uuidv4} from 'uuid';

  and then instead of `uuid.v1()` use `uuidv1()` etc.

* Adjust `webpack.config.js` from
```
      {
        test: /\.mjs$/,
        type: 'javascript/auto'
      }
```
to
```
      {
        test: /(.mjs|.js)$/,
        type: 'javascript/auto'
      }
```

Update to qwc2 submodule revision [fe063b6](https://github.com/qgis/qwc2/tree/fe063b6) (13.01.2023)
---------------------------------------------------------------------------------------------------

**Reworked search provider support**

The arguments and expected behaviour of the provider `onSearch` and `getResultGeometry` have changed. Please refer to the documentation chapter in the [Documentation](https://github.com/qgis/qwc2-demo-app/blob/master/doc/src/qwc_configuration.md#search-providers). Consult [js/SearchProviders.js](https://github.com/qgis/qwc2-demo-app/blob/master/js/SearchProviders.js) and [static/assets/searchProviders.js](https://github.com/qgis/qwc2-demo-app/blob/master/static/assets/searchProviders.js) for full examples.

It is now possible to define search providers in a external JS file loaded at runtime rather than compiled into the application bundle. See [static/assets/searchProviders.js](https://github.com/qgis/qwc2-demo-app/blob/master/static/assets/searchProviders.js), which is loaded by [index.html](https://github.com/qgis/qwc2-demo-app/blob/master/index.html).

`js/SearchProviders.js` now only includes `coordinates` and `nominatim` as built-in search providers for the demo application.

The `searchProviderFactory` function has been removed from `js/SearchProviders.js`. Instead, custom parameters to be passed to a provider can be specified directly in the theme item `searchProviders` entry:

    {
      key: "<providerkey2>",
      params: {...}
    }

and read from `searchParams.cfgParams` in the provider `onSearch` function.

**Load Help dialog contents from HTML fragment**

Instead of requiring users to implement the `renderHelp` function in `js/Help.jsx`, for simple cases the users can provide a plain HTML fragment which is loaded at runtime from the assets. Consult the [Documentation](https://github.com/qgis/qwc2-demo-app/blob/master/doc/src/qwc_configuration.md#help-dialog).

Update to qwc2 submodule revision [90c613a](https://github.com/qgis/qwc2/tree/90c613a) (28.11.2022)
---------------------------------------------------------------------------------------------------

**Reworked color scheme support**

The `styleConfig.js` file is deprecated and won't be honoured anymore for the styling of core QWC2 components. Instead, base theme colors can be defined via CSS, refer to [documentation](https://github.com/qgis/qwc2-demo-app/blob/master/doc/src/qwc_configuration.md#color-schemes) for details.

**Renamed config variable**
The `maxGetUrlLength` variable in `config.json` has been renamed to `wmsMaxGetUrlLength`.

Update to qwc2 submodule revision [e357152](https://github.com/qgis/qwc2/tree/e357152) (27.06.2022)
---------------------------------------------------------------------------------------------------

**Reworked interface for handling 1:N relations between qwc2 and qwc-data-service**

The interface for reading and writing 1:n relations between the qwc2 and the qwc-data-service was reworked. If you are using the qwc-data-service, make sure to update to qwc-data-service-v2022.06.27 or later when updating to qwc2 submodule revision [e357152](https://github.com/qgis/qwc2/tree/e357152) or later.

Update to qwc2 submodule revision [76ec566](https://github.com/qgis/qwc2/tree/76ec566) (17.06.2022)
---------------------------------------------------------------------------------------------------

**Refactoring of editing components**

The editing components have been heavily refactored internally. The changes are mostly transparent, but two points are important:

- The `editDataset` field of an `editConfig` entry is now mandatory. `editConfig`s generated by qwc-config-generator already write this field, so this applies only to manually written `editConfig`s for use outside of qwc-services.
- The `changeEditingState` action has been replaced by `setEditContext` (and `clearEditContext`). This allows for storing and switching between multiple edit contexts in the application state. Custom components interacting with editing also should be changed to verify that the current edit context is the desired one.

Update to qwc2 submodule revision [7929587](https://github.com/qgis/qwc2/tree/7929587) (21.04.2022)
---------------------------------------------------------------------------------------------------

**Format change for external layer resource strings**

For a short period of time (after submodule revision [cb870a1](https://github.com/qgis/qwc2/tree/cb870a1)), QWC2 supported external resource strings in the form `wms:<service_url>#<layername>?<options>`. The format has been changed to

    wms:<service_url>?<options>#<layername>

i.e. by moving the query portion before the hash portion, which is inline with the URL scheme format.

Update to qwc2 submodule revision [eb5e358](https://github.com/qgis/qwc2/tree/eb5e358) (25.10.2021)
---------------------------------------------------------------------------------------------------

**Update to Webpack 5, React 17**

- Synchronize the `webpack.config.js` and the dependencies and package scripts from the demo app `package.json`. Note that the `build` package script is now an alias with the `prod` script.
- Remove the `dist/App.js` script include from `index.html`, it is now added automatically by Webpack.
- All static files of the app need to be placed below a toplevel `static` folder, which will contain `assets`, `translations`, `config.json`, `themes.json`, etc. The `themesConfig` script will write `themes.json` to that folder.
- In custom components, replace any use of `Swipeable` from `react-swipeable`:

      - import {Swipeable} from 'react-swipeable';
      + import {Swipeable} from 'qwc2/components/Swipeable';


Update to qwc2 submodule revision [e08aed5](https://github.com/qgis/qwc2/tree/e08aed5) (18.05.2021)
---------------------------------------------------------------------------------------------------

**Reworked Identify plugin**

The Identify plugin has been completely reworked, and the IdentifyRegion plugin has been merged into the Identify plugin:

- Remove the IdentifyRegion plugin from `js/appConfig.js` and `config.json`
- Create menu/toolbar entries in config.json for the region identify tool mode by specifying `"mode": "Region"`, i.e.:

      {"key": "Identify", "icon": "identify_region", "mode": "Region"},

- The translation message id `identifyregion.info` has been changed to `infotool.clickhelpPolygon` (unless the string is overridden, `yarn run tsupdate` will take care of this automatically).
- *Note*: The identify tool state is now handled internally by the Identify component, it does not store the results in the global application state anymore.


Update to qwc2 submodule revision [317eea3](https://github.com/qgis/qwc2/tree/317eea3) (03.01.2021)
---------------------------------------------------------------------------------------------------

**Updated dependencies**

Many dependencies in the `qwc2` submodule have been update, please run `yarn install` to update them in your application.

In the demo app, also many dependencies in the application `package.json` have been updated.
It's recommended to synchronize the application `package.json` and `webpack.config.js` with the ones of the demo app.


**Plugins do not need to specify the reducers they use anymore**

Action files register now the reducers they use automatically, so whenever a symbol is imported from an action file, the respective reducer is automatically enabled.

If you have a custom action/reducer file outside the `qwc2` submodule folder (i.e. `js/{actions,reducers}/myfunctionality.js`), you should add lines similar to

    import ReducerIndex from 'qwc2/reducers/index';
    import myfunctionalityReducer from '/reducers/myfunctionality';
    ReducerIndex.register("myfunctionality", myfunctionalityReducer);

to `js/actions/myfunctionality.js`.

If you have custom QWC2 plugins, remove the `reducers` field of the plugin export.

**ES6 imports**

QWC2 now uses the ES6 import/export syntax throughout. For instance

    const Icon = require('qwc2/components/Icon');
    const {addLayer} = require('qwc2/actions/layers');

become

    import Icon from 'qwc2/components/Icon';
    import {addLayer} from 'qwc2/actions/layers';

And

    module.exports = MyClass;

becomes

    export default MyClass;

resp.

    function foo() {...};
    function bar() {...};
    module.exports = {foo, bar};

becomes

    export function foo() {...};
    export function bar() {...};

In particular, `js/appConfig.js` needs to be heavily adapted.

**Update to React 16.14**

As per React 16.3, various component lifecycle methods have been deprecated.
All qwc2 core components are updated to avoid their use. Custom components should also be updated.
See [https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html](https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html) for details.

**Reworked localization**

Localization in QWC2 has been reworked:
- Instead of `<Message msgId="<msgid>" />` and `LocaleUtils.getMessageById()`, use `LocaleUtils.tr(<msgid>)`.
- For message IDs which are not translated directly via `LocaleUtils.tr`, use `LocaleUtils.trmsg` to mark the string as a message ID.
- The `Message` component has been dropped.
- Static message IDs are now picked up automatically by `updateTranslations.js` (invoked by `yarn run tsupdate`).
- Message IDs built at runtime will beed to be specified manually in `tsconfig.json` in the `extra_strings` section.
- The translation files are now called `translations/<lang>-<COUNTRY>.json` rather than `translations/data.<lang>-<COUNTRY>`. The format of the files remains unchanged.
- The `supportedLocales` section in `appConfig.js` needs to be dropped.
- Previously, the fallback locale was specified as `fallbacklocale` in config.json. Now, it must be specified as `defaultLocaleData` in `appConfig.js`.

**Default editing interface now shipped in the qwc2 submodule**

The `js/EditingInterface.js` in the demo app has been moved to `qwc2/utils/EditingInterface.js`.
This is the interface which acts as a counterpart to the [QWC data service](https://github.com/qwc-services/qwc-data-service).
If you want to use a custom editing interface, you can still do so, passing it to the `Editing` plugin in `appConfig.js` as before.

**Assets and translations path now optional**

Assets and translations path can now be omitted from the `config.json`, and are resolved to `assets` resp `translations` relative to the `index.html` path of the QWC2 application by default.

Use `ConfigUtils.getAssetsPath()` and `ConfigUtils.getTranslationsPath()` in your custom components instead of `ConfigUtils.getConfigProp`.

You can still specify `assetsPath` and `translationsPath` in `config.json` to override the default values.

**Changes to map click point/feature state**

The previous `state.map.clickPoint` and `state.map.clickFeature` have been merged to a single `state.map.click`. The `clickFeatureOnMap` action has been removed.
