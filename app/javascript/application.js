"use strict";
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

document.addEventListener("DOMContentLoaded", function(){
    window.addEventListener('scroll', function() {

        if (window.scrollY > 200) {
            document.getElementById('navbar_top').classList.add("sticky-top");
            document.getElementById('navbar_top').classList.add("shadow");
        }

        else {
            document.getElementById('navbar_top').classList.remove('sticky-top');
            document.getElementById('navbar_top').classList.remove('shadow');
        }
    });
});