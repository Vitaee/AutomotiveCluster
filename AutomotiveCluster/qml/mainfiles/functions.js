.pragma library

function toPixels(percentage, outerRadius) {
    return percentage * outerRadius;
}

var convertToRad = Math.PI / 180;
function degToRad(degrees) {
    return degrees * convertToRad;
}

var convertToDeg = 180 / Math.PI;
function radToDeg(radians) {
    return radians * convertToDeg;
}

