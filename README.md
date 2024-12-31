# Dispatch Converter

![](https://img.shields.io/github/downloads/Maximus7474/lb-tablet-dispatch-converter/total?logo=github)
![](https://img.shields.io/github/contributors/Maximus7474/lb-tablet-dispatch-converter?logo=github)
![](https://img.shields.io/github/v/release/Maximus7474/lb-tablet-dispatch-converter?logo=github) 

A script providing compatibility from other dispatch/mdt scripts to also work with lb-tablet's police MDT.

> [!NOTE]
> This resource is still in beta phase, breaking changes can occur without notice.
> Please open issues for bug reports, other dispatch services to integrate with maximum information.

## Supported Dispatch systems
- QS Dispatch
  - Untested
  - Partially Integrated
- PS Dispatch
  - Partially Integrated
  - Untested
- RCORE Dispatch
  - Untested
- CD Dispatch
  - Untested
- Bub MDT
  - Untested

## Setup:

This script acts as a brdige and provides event handlers to the supported dispatch systems to convert the dispatch events to work with lb-tablet.
Please note that there are limitations on these and not all data can be converted properly.
It is highly recommended to alter the scripts creating the calls/dispatch events directly with the [AddDispatch](https://docs.lbscripts.com/tablet/script-integration/server-exports/#adddispatch) export. 

> [!NOTE]
> This resource is using [convars](https://docs.fivem.net/docs/scripting-reference/convars/) to define certain functionalities.

```bash
# Set the default/fallback time (in seconds) for dispatch messages
setr lb-tablet-dispatch:default-time 100

# Set the default locale for the various translations
# Current locales: en
setr lb-tablet-dispatch:locale en
```
