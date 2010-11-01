function generateIcon() {
    var icon = new GIcon();
    icon.image = "http://labs.google.com/ridefinder/images/mm_20_red.png";
    icon.iconSize = new GSize(12, 20);
    icon.iconAnchor = new GPoint(6, 20);
    icon.infoWindowAnchor = new GPoint(5, 1);
    return icon;
}
function generateMap(id) {
    var map = new GMap2(document.getElementById(id));
    map.addControl(new GSmallMapControl());
    map.addControl(new GMapTypeControl());
    return map;
}
