# nextbike
Connect to the NextBike API to list and rent bikes through the command line.

Created to support bike rentals on the Pinephone:
* https://www.pine64.org/pinephone/

Helpful information from h0chi:
* https://github.com/h0chi/nextbike-api-reverse-engineering

## status
Currently broken when parsing `Accept` header:
```
*** Exception: Invalid length for ""
CallStack (from HasCallStack):
  error, called at src/Network/HTTP/Media/MediaType.hs:87:10 in http-media-0.8.0.0-cbb2ed0998176892632a41507171e6c60d06905fc20180d2f5cd91d694c65f0e:Network.HTTP.Media.MediaType
```
