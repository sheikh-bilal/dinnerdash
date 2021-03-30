// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


  function addtocart(){
    var x = document.getElementById("snackbar");
    x.innerHTML = "Item is added Successfully..!!";
    x.className = "show";

    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
  }
  function updatecart(){
    var x = document.getElementById("snackbar");
    x.innerHTML = "Cart is Updated Successfully..!!";
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
  }
