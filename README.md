# bttDarkSky
Small script that gets the current temp from the Dark Sky API, for displaying with Better Touch Tool. Requires a developer account + API secret from [Dark Sky](https://darksky.net/dev)

After building the script, you can execute it in BTT by adding a new TouchBar widget to "Run Shell Script and Show Return Value", and adding the following:

```bash
export DARK_SKIES_API_SECRET= {your api secret}
path/to/TouchbarWeather
```
