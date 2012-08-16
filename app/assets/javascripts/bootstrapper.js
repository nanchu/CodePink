var script = '<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerclusterer/1.0/src/markerclusterer';
if (document.location.search.indexOf('packed') !== -1) {
    script += '_packed';
}
if (document.location.search.indexOf('compiled') !== -1) {
    script += '_compiled';
}
script += '.js"><' + '/script>';
document.write(script);
