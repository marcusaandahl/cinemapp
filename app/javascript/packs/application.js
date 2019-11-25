import "bootstrap";
import "../dynamics/navbar";
import "../dynamics/seats";
import $ from 'jquery';
global.$ = jQuery;
import 'slick-carousel';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initCarousel } from "../components/carousel";

console.log('Hello from Webpack!')

initCarousel();

import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!


initMapbox();
