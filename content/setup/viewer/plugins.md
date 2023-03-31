+++
menuTitle = "Plugin Reference"
weight = 4
chapter = false
+++
Plugin reference
================

- [Plugin reference](#plugin-reference)
  - [API](#api)
  - [AttributeTable](#attributetable)
  - [Authentication](#authentication)
  - [BackgroundSwitcher](#backgroundswitcher)
  - [Bookmark](#bookmark)
  - [BottomBar](#bottombar)
  - [DxfExport](#dxfexport)
  - [Editing](#editing)
  - [FeatureForm](#featureform)
  - [HeightProfile](#heightprofile)
  - [Help](#help)
  - [HomeButton](#homebutton)
  - [Identify](#identify)
  - [LayerCatalog](#layercatalog)
  - [LayerTree](#layertree)
  - [LocateButton](#locatebutton)
  - [LoginUser](#loginuser)
  - [MapPlugin](#mapplugin)
  - [MapComparePlugin](#mapcompareplugin)
  - [MapCopyright](#mapcopyright)
  - [MapInfoTooltip](#mapinfotooltip)
  - [MapLegend](#maplegend)
  - [MapTip](#maptip)
  - [Measure](#measure)
  - [Print](#print)
  - [ProcessNotifications](#processnotifications)
  - [RasterExport](#rasterexport)
  - [Redlining](#redlining)
  - [Routing](#routing)
  - [ScratchDrawing](#scratchdrawing)
  - [Settings](#settings)
  - [Share](#share)
  - [StartupMarker](#startupmarker)
  - [TaskButton](#taskbutton)
  - [ThemeSwitcher](#themeswitcher)
  - [TimeManager](#timemanager)
  - [TopBar](#topbar)
  - [ZoomButton](#zoombutton)

---
API
----------------------------------------------------------------
Exposes an API for interacting with QWC2 to `window.qwc2`.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

AttributeTable
----------------------------------------------------------------
Displaying the attribute table of layers in a dialog.

To make a layer available in the attribute table, create a a data resource and matching permissions for it in the qwc-admin-gui.

The attribute table works for both read-only as well as read-write data resources.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| allowAddForGeometryLayers | `bool` | Whether to allow adding records for datasets which have a geometry column. | `undefined` |
| showEditFormButton | `bool` | Whether to show a button to open the edit form for selected layer. Requires the Editing plugin to be enabled. | `true` |
| zoomLevel | `number` | The zoom level for zooming to point features. | `1000` |

Authentication
----------------------------------------------------------------
Handles authentication via the authentication service specified by `authServiceUrl`.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| clearLayerParam | `bool` | Whether to clear the layer parameter from the URL on login. | `undefined` |
| idleTimeout | `number` | An idle timeout in seconds after which the user is automatically logged of. | `undefined` |
| logoutTargetUrl | `string` | An URL to redirect to on logout, instead of the viewer URL. | `undefined` |
| requireLogin | `bool` | Whether authentication is required, i.e. the viewer automatically redirects to the login page if no user is authenticated. | `undefined` |

BackgroundSwitcher
----------------------------------------------------------------
Map button for switching the background layer.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| position | `number` | The position slot index of the map button, from the bottom (0: bottom slot). | `0` |

Bookmark
----------------------------------------------------------------
Allows managing user bookmarks.

Bookmarks are only allowed for authenticated users.

Requires `permalinkServiceUrl` to point to a qwc-permalink-service.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

BottomBar
----------------------------------------------------------------
Bottom bar, displaying mouse coordinate, scale, etc.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| displayCoordinates | `bool` | Whether to display the coordinates in the bottom bar. | `true` |
| displayScales | `bool` | Whether to display the scale in the bottom bar. | `true` |
| termsUrl | `string` | The URL of the terms label anchor. | `undefined` |
| termsUrlTarget | `string` | The target where to open the terms URL. If `iframe`, it will be displayed in an inline window, otherwise in a new tab. | `undefined` |
| viewertitleUrl | `string` | The URL of the viewer title label anchor. | `undefined` |
| viewertitleUrlTarget | `string` | The target where to open the viewer title URL. If `iframe`, it will be displayed in an inline window, otherwise in a new tab. | `undefined` |

DxfExport
----------------------------------------------------------------
Allows exporting a selected extent of the map as DXF.

Uses the DXF format support of QGIS Server.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| formatOptions | `string` | Optional format options to pass to QGIS Server via FORMAT_OPTIONS. | `undefined` |
| layerOptions | `[{`<br />`  label: string,`<br />`  layers: string,`<br />`}]` | Optional choice of layer sets to pass to QGIS Server via LAYERS. | `undefined` |
| serviceUrl | `string` | Optional URL invoked on export instead of the default QGIS Server URL. | `undefined` |

Editing
----------------------------------------------------------------
Allows editing geometries and attributes of datasets.

The attribute form is generated from the QGIS attribute form configuration.

By default, requires `editServiceUrl` to point to a qwc-data-service. See
for more information.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| allowCloneGeometry | `bool` | Whether to enable the "Clone existing geometry" functionality. | `true` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |
| snapping | `bool` | Whether snapping is available when editing. | `true` |
| snappingActive | `bool` | Whether snapping is enabled by default when editing. | `true` |
| width | `string` | The default width of the editing sidebar, as a CSS width string. | `"30em"` |

FeatureForm
----------------------------------------------------------------
Displays queried feature attributes in a form.

The attribute form is generated from the QGIS attribute form configuration.

If the dataset it editable, allows editing the attributes directly in the
displayed form.

This plugin queries the feature via the editing service specified by
`editServiceUrl` (by default the qwc-data-service), rather than over WMS
GetFeatureInfo like the `Identify` plugin.

Can be used as default identify tool by setting `"identifyTool": "FeatureForm"` in `config.json`.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| initialHeight | `number` | Initial height of the form window. | `480` |
| initialWidth | `number` | Initial width of the form window. | `320` |
| initialX | `number` | Initial x position of the form window. | `0` |
| initialY | `number` | Initial y position of the form window. | `0` |

HeightProfile
----------------------------------------------------------------
Displays a height profile along a measured line.

Triggered automatically when a line is measured via the `Measure` plugin.

Requires `elevationServiceUrl` to point to a qwc-elevation-service.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| heighProfilePrecision | `number` | The precision of displayed and exported values (0: no decimals, 0.1: 1 decimal position, etc). | `0` |
| height | `number` | The height of the height profile widget in pixels. | `100` |
| samples | `number` | The number of elevation samples to query. | `500` |

Help
----------------------------------------------------------------
Displays a custom help dialog in a sidebar.

Define the help contents by specifying the `bodyContentsFragmentUrl` prop.
See also https://github.com/qgis/qwc2-demo-app/blob/master/doc/src/qwc_configuration.md#help-dialog.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| bodyContentsFragmentUrl | `string` | URL to a document containing a HTML fragment to display in the Help sidebar. | `undefined` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

HomeButton
----------------------------------------------------------------
Map button for reverting to the home extent of the theme.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| position | `number` | The position slot index of the map button, from the bottom (0: bottom slot). | `5` |

Identify
----------------------------------------------------------------
Displays queried feature attributes.

Uses WMS GetFeatureInfo to query features and displays the result in
table, as a HTML fragment or as plain text based on the supported GetFeatureInfo
format.

Extendable in combination with the `qwc-feature-info-service`, which provides support
for customized queries and templates for the result presentation.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| attributeCalculator | `func` | Optional function for computing derived attributes. See js/IdentifyExtensions.js for details. This prop can be specified in the appConfig.js cfg section. | `undefined` |
| attributeTransform | `func` | Optional function for transforming attribute values. See js/IdentifyExtensions.js for details. This prop can be specified in the appConfig.js cfg section. | `undefined` |
| clearResultsOnClose | `bool` | Whether to clear the identify results when exiting the identify tool. | `true` |
| customExporters | `array` | Optional list of custom exporters to offer along with the built-in exporters. See js/IdentifyExtensions.js for details. This prop can be specified in the appConfig.js cfg section. | `[]` |
| displayResultTree | `bool` | Whether to display a tree overview of results (as opposed to a flat list of results). | `true` |
| enableExport | `bool` | Whether to enable the export functionality. | `true` |
| featureInfoReturnsLayerName | `bool` | Whether to assume that XML GetFeatureInfo responses specify the technical layer name in the `name` attribute, rather than the layer title. | `true` |
| initialHeight | `number` | The initial height of the identify dialog. | `320` |
| initialWidth | `number` | The initial width of the identify dialog. | `240` |
| initialX | `number` | The initial x coordinate of the identify dialog. | `0` |
| initialY | `number` | The initial y coordinate of the identify dialog. | `0` |
| initiallyDocked | `bool` | Whether the identify dialog should be initially docked. | `undefined` |
| replaceImageUrls | `bool` | Whether to replace an attribute value containing an URL to an image with an inline image. | `true` |

LayerCatalog
----------------------------------------------------------------
Displays a pre-configured catalog of external layers in a window.

Configured through a catalog JSON containing a tree of external layer identifiers.

See [https://qwc2.sourcepole.ch/assets/catalog.json](https://qwc2.sourcepole.ch/assets/catalog.json) for an example.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| catalogUrl | `string` | The URL to the catalog JSON file. | `undefined` |
| windowSize | `{`<br />`  width: number,`<br />`  height: number,`<br />`}` | The default window size. | `{width: 320, height: 320}` |

LayerTree
----------------------------------------------------------------
Displays the map layer tree in a sidebar.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| addLayerSeparator | `func` | Whether to allow adding separator entries in the layer tree, useful for organizing the tree. | `undefined` |
| allowCompare | `bool` | Whether to enable the compare function. Requires the `MapCompare` plugin. | `true` |
| allowImport | `bool` | Whether to allow importing external layers. | `true` |
| allowMapTips | `bool` | Whether to allow enabling map tips. | `true` |
| bboxDependentLegend | `{bool, string}` | Whether to display a BBOX dependent legend. Can be `true|false|"theme"`, latter means only for theme layers. | `false` |
| enableLegendPrint | `bool` | Whether to enable the legend print functionality. | `true` |
| enableServiceInfo | `bool` | Whether to display a service info button to display the WMS service metadata. | `true` |
| enableVisibleFilter | `bool` | Whether to display a button to filter invisible layers from the layertree. | `true` |
| extraLegendParameters | `string` | Additional parameters to pass to the GetLegendGraphics request- | `undefined` |
| flattenGroups | `bool` | Whether to display a flat layer tree, omitting any groups. | `false` |
| grayUnchecked | `bool` | Whether to display unchecked layers gray in the layertree. | `true` |
| groupTogglesSublayers | `bool` | Whether toggling a group also toggles all sublayers. | `false` |
| infoInSettings | `bool` | Whether to display the layer info button inside the layer settings menu rather than next to the layer title. | `true` |
| layerInfoWindowSize | `{`<br />`  width: number,`<br />`  height: number,`<br />`}` | The initial size of the layer info window. | `{width: 320, height: 480}` |
| mapTipsEnabled | `bool` | Whether map tips are enabled by default. | `undefined` |
| scaleDependentLegend | `{bool, string}` | Whether to display a scale dependent legend. Can be `true|false|"theme"`, latter means only for theme layers. | `undefined` |
| showLegendIcons | `bool` | Whether to display legend icons. | `true` |
| showQueryableIcon | `bool` | Whether to display the queryable icon to indicate that a layer is identifyable. | `true` |
| showRootEntry | `bool` | Whether to display the root entry of the layertree. | `true` |
| showToggleAllLayersCheckbox | `bool` | Whether to display a checkbox to toggle all layers. | `true` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |
| width | `string` | The initial width of the layertree, as a CSS width string. | `"25em"` |

LocateButton
----------------------------------------------------------------
Map button for controling the locate (GPS) state.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| position | `number` | The position slot index of the map button, from the bottom (0: bottom slot). | `2` |

LoginUser
----------------------------------------------------------------
Displays the currently logged in user.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

MapPlugin
----------------------------------------------------------------
The main map component.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| mapOptions | `{`<br />`  zoomDuration: number,`<br />`  enableRotation: bool,`<br />`  rotation: number,`<br />`  panStepSize: number,`<br />`  panPageSize: number,`<br />`}` | Zoom duration in ms, rotation in degrees, panStepSize and panPageSize as fraction of map width/height. | `{}` |
| showLoading | `bool` | Whether to display the loading spinner when layers are loading. | `true` |
| swipeGeometryTypeBlacklist | `[string]` | A list of layer geometry types to ignore when determining the top-most layer to compare. | `[]` |
| swipeLayerNameBlacklist | `[string]` | A list of layer names to ignore when determining the top-most layer to compare. You can use `*` as a whildcard character. | `[]` |
| toolsOptions | `object` | Map tool configuraiton options. Refer to the sample config.json. | `{}` |

MapComparePlugin
----------------------------------------------------------------
Allows comparing the top layer with the rest of the map.

Activated through a checkbox in the LayerTree.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

MapCopyright
----------------------------------------------------------------
Displays layer attributions in the bottom right corner of the map.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| prefixCopyrightsWithLayerNames | `bool` | Whether to prepend the layer name to the attribution string. | `undefined` |
| showThemeCopyrightOnly | `bool` | Whether to only display the attribution of the theme, omitting external layers. | `undefined` |

MapInfoTooltip
----------------------------------------------------------------


| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

MapLegend
----------------------------------------------------------------
Displays the map legend in a floating dialog.

The user can toggle whether to display only layers which are enabled, visible in the current extent and/or visible at the current scale.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| addGroupTitles | `bool` | Whether to add group titles to the legend. | `false` |
| addLayerTitles | `bool` | Whether to add layer titles to the legend. Note that often the legend image itself already contains the layer title. | `false` |
| bboxDependentLegend | `bool` | Whether to display a BBOX-dependent legend by default. | `false` |
| extraLegendParameters | `string` | Extra parameters to add to the GetLegendGraphics request. | `undefined` |
| onlyVisibleLegend | `bool` | Whether to only include enabled layers in the legend by default. | `false` |
| scaleDependentLegend | `bool` | Whether to display a scale-dependent legend by default. | `false` |
| windowSize | `{`<br />`  width: number,`<br />`  height: number,`<br />`}` | The default window size. | `{width: 320, height: 320}` |

MapTip
----------------------------------------------------------------
Displays maptips by hovering over features on the map.

Queries the map tips configured in the QGIS layer properites over GetFeatureInfo.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| layerFeatureCount | `number` | The maximum number of feature maptips to display for a single layer. | `5` |

Measure
----------------------------------------------------------------
Allows measuring points/lines/areas on the map.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| showMeasureModeSwitcher | `bool` | Whether to show the widget to switch between measure modes. | `true` |
| snapping | `bool` | Whether snapping is available when editing. | `true` |
| snappingActive | `bool` | Whether snapping is enabled by default when editing. | `true` |

Print
----------------------------------------------------------------
Invokes QGIS Server WMS GetPrint to print the map to PDF.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| defaultDpi | `number` | The default print dpi. | `300` |
| defaultScaleFactor | `number` | The factor to apply to the map scale to determine the initial print map scale. | `0.5` |
| displayRotation | `bool` | Whether to display the map rotation control. | `true` |
| gridInitiallyEnabled | `bool` | Whether the grid is enabled by default. | `false` |
| hideAutopopulatedFields | `bool` | Whether to hide form fields which contain autopopulated values (i.e. search result label). | `undefined` |
| inlinePrintOutput | `bool` | Whether to display the print output in an inline dialog instead triggering a download. | `false` |
| printExternalLayers | `bool` | Whether to print external layers. Requires QGIS Server 3.x! | `true` |
| scaleFactor | `number` | Scale factor to apply to line widths, font sizes, ... of redlining drawings passed to GetPrint. | `1.9` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

ProcessNotifications
----------------------------------------------------------------


| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

RasterExport
----------------------------------------------------------------
Allows exporting a selected portion of the map to an image ("screenshot").

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| allowedFormats | `[string]` | Whitelist of allowed export format mimetypes. If empty, supported formats are listed. | `undefined` |
| allowedScales | `[number]` | List of scales at which to export the map. | `undefined` |
| defaultScaleFactor | `number` | The factor to apply to the map scale to determine the initial export map scale. | `0.5` |
| dpis | `[number]` | List of dpis at which to export the map. If empty, the default server dpi is used. | `undefined` |
| exportExternalLayers | `bool` | Whether to include external layers in the image. Requires QGIS Server 3.x! | `true` |
| pageSizes | `[{`<br />`  name: string,`<br />`  width: number,`<br />`  height: number,`<br />`}]` | List of image sizes to offer, in addition to the free-hand selection. The width and height are in millimeters. | `[`<br />`    {name: '15 x 15 cm', width: 150, height: 150},`<br />`    {name: '30 x 30 cm', width: 300, height: 300}`<br />`]` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

Redlining
----------------------------------------------------------------
Allows drawing figures and text labels on the map.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| allowGeometryLabels | `bool` | Whether to allow labeling geometric figures. | `true` |
| snapping | `bool` | Whether snapping is available when editing. | `true` |
| snappingActive | `bool` | Whether snapping is enabled by default when editing. | `true` |

Routing
----------------------------------------------------------------
Compute routes and isochrones.

Uses Valhalla as backend by default, with `routingServiceUrl` pointing to a Valhalla server.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| enabledProviders | `[string]` | List of search providers to use for routing location search. | `["coordinates", "nominatim"]` |
| geometry | `{`<br />`  initialWidth: number,`<br />`  initialHeight: number,`<br />`  initialX: number,`<br />`  initialY: number,`<br />`  initiallyDocked: bool,`<br />`}` | Default window geometry. | `{`<br />`    initialWidth: 320,`<br />`    initialHeight: 640,`<br />`    initialX: 0,`<br />`    initialY: 0,`<br />`    initiallyDocked: true`<br />`}` |

ScratchDrawing
----------------------------------------------------------------
Task which which can be invoked by other tools to draw a geometry and pass it to a callback.

Invoke as setCurrentTask("ScratchDrawing", null, null, {callback: <function(features, crs)>});

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
|

Settings
----------------------------------------------------------------
Settings panel.

Allows configuring language and color scheme.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| colorSchemes | `[{`<br />`  title: string,`<br />`  titleMsgId: string,`<br />`  value: string,`<br />`}]` | List of available color schemes. Value is the css class name, title/titleMsgId the display name. | `[]` |
| languages | `array` | List of available languages. Value is the lang code, title/titleMsgId the display name. | `[]` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

Share
----------------------------------------------------------------
Share the current map as a URL/permalink.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| showLink | `bool` | Show the map URL. | `true` |
| showQRCode | `bool` | Show the QR code of the map URL. | `true` |
| showSocials | `{bool, [string]}` | Show the social buttons. Either `true` or `false`to enable/disable all, or an array of specific buttons to display (possible choices: `email`, `facebook`, `twitter`, `linkedin`, `whatsapp`). | `true` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |

StartupMarker
----------------------------------------------------------------
Displays a marker in the center of the map if c=<x>,<y>&hc=1 is set in the URL.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| removeMode | `string` | When to remove the marker. Possible choices: onpan, onzoom, onclickonmarker. | `'onpan'` |

TaskButton
----------------------------------------------------------------
Generic map button to launch a task.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| icon | `string` | The icon name. | `undefined` |
| mode | `string` | The task mode. | `undefined` |
| position | `number` | The position slot index of the map button, from the bottom (0: bottom slot). | `1` |
| task | `string` | The task name. | `undefined` |

ThemeSwitcher
----------------------------------------------------------------
Theme switcher panel.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| collapsibleGroups | `bool` | Whether to allow collapsing theme groups. | `undefined` |
| showLayerAfterChangeTheme | `bool` | Whether to show the LayerTree by default after switching the theme. | `false` |
| side | `string` | The side of the application on which to display the sidebar. | `'right'` |
| themeLayersListWindowSize | `{`<br />`  width: number,`<br />`  height: number,`<br />`}` | The default window size for the theme layers dialog. | `{width: 400, height: 300}` |
| width | `string` | Default width as a CSS string. | `"50%"` |

TimeManager
----------------------------------------------------------------
Allows controling the time dimension of temporal WMS layers.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| cursorFormat | `string` | The format of the time cursor label. Either `date`, `time` or `datetime`. | `"datetime"` |
| dateFormat | `string` | The date format in the time controls, i.e. YYYY-MM-DD. | `"YYYY-MM-DD[\n]HH:mm:ss"` |
| defaultAnimationInterval | `number` | The default interval for the temporal animation, in seconds. | `1` |
| defaultStepSize | `number` | The default step size for the temporal animation, in step units. | `1` |
| defaultStepUnit | `string` | The default step unit for the temporal animation, one of `ms`, `s`, `m`, `d`, `M`, `y`, `10y`, `100y` | `"d"` |
| defaultTimelineDisplay | `string` | The default timeline display mode. One of `hidden`, `minimal`, `features`, `layers`. | `undefined` |
| defaultTimelineMode | `string` | The default timeline mode. One of `fixed`, `infinite`. | `"fixed"` |
| markerConfiguration | `{`<br />`  markersAvailable: bool,`<br />`  gradient: [string],`<br />`  markerOffset: array,`<br />`  markerPins: bool,`<br />`}` | The feature marker configuration. | `{`<br />`    markersAvailable: true,`<br />`    gradient: ["#f7af7d", "#eacc6e", "#fef89a", "#c5e09b", "#a3d29c", "#7cc096", "#79c8c5", "#34afce"],`<br />`    markerOffset: [0, 0],`<br />`    markerPins: true`<br />`}` |
| stepUnits | `[string]` | The available temporal anumation step units. | `["s", "m", "h", "d", "M", "y"]` |

TopBar
----------------------------------------------------------------
Top bar, containing the logo, searchbar, task buttons and app menu.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| appMenuClearsTask | `bool` | Whether opening the app menu clears the active task. | `undefined` |
| appMenuFilterField | `bool` | Whether to display the filter field in the app menu. | `undefined` |
| appMenuShortcut | `string` | The shortcut for tiggering the app menu, i.e. alt+shift+m. | `undefined` |
| appMenuVisibleOnStartup | `bool` | Whether to open the app menu on application startup. | `undefined` |
| logoFormat | `string` | The logo file format. | `"svg"` |
| logoSrc | `string` | The logo image URL if a different source than the default assets/img/logo.<ext> and assets/img/logo-mobile.<ext> is desired. | `undefined` |
| logoUrl | `string` | The hyperlink to open when the logo is clicked. | `undefined` |
| menuItems | `array` | The menu items. Refer to the corresponding chapter of the viewer documentation and the sample config.json. | `[]` |
| searchOptions | `object` | Options passed down to the search component. See the searchOption propType of the used search component. | `{}` |
| toolbarItems | `array` | The toolbar. Refer to the corresponding chapter of the viewer documentation and the sample config.json. | `[]` |
| toolbarItemsShortcutPrefix | `string` | The keyboard shortcut prefix for triggering toolbar tasks. I.e. alt+shift. The task are then triggered by <prefix>+{1,2,3,...} for the 1st, 2nd, 3rd... toolbar icon. | `undefined` |

ZoomButton
----------------------------------------------------------------
Map button for zooming the map.

Two specific plugins exist: ZoomInPlugin and ZoomOutPlugin, which are instances of ZoomButton for the respective zoom directions.

| Property | Type | Description | Default value |
|----------|------|-------------|---------------|
| position | `number` | The position slot index of the map button, from the bottom (0: bottom slot). | `undefined` |

