import "bootstrap";
import "../dynamics/navbar";
import "../dynamics/seats";
import $ from 'jquery';
global.$ = jQuery;
import 'slick-carousel';

import { initCarousel } from "../components/carousel";

console.log('Hello from Webpack!')

initCarousel();