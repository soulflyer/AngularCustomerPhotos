# AngularCustomerPhotos

Display photos for customers. Each set of photos to be delivered is represented by a JSON file. These are read in by the Angular driven web page. Scripts are included to build the JSON and ZIP files.

## build-json.sh

A shell script to create the JSON file for a set of photos. Run build-json.sh to see the options. By default it will fetch the list of selected photos in Aperture and use that. This can be overridden with the -l option, which accepts a string containing a list of photos in yyyy/mm/project/picture format.

If the -z option is given then the zipfile will be built too.
