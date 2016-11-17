// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.blockUI
//= require twitter/bootstrap
//= require turbolinks
//= require cocoon
//= requiert self

$(document).ready(function()
{
  $("#tabs" ).tabs();

  $('.datepicker').
  datepicker({ dateFormat: 'dd/mm/yy',
    nextText: 'Prox',
    prevText: 'Ant.',
    dayNamesMin: ["Do","Lu","Ma","Mi","Ju","Vi","Sa"],
    monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octobre","Noviembre","Diciembre"],
    monthNamesShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dec"],
    appendText: "dd/mm/aaaa"});

  // Tooltips (see http://onehackoranother.com/projects/jquery/tipsy)
  $('img').each( function() {
    if ($(this).get(0).title != '') {
      $(this).tipsy();
    }
  });

  $('select[title]').each( function() {
      $(this).tipsy();
  });

  $(document).ajaxStart(function() {
    element = "<p class='message warning ajax'>" +
      "<img style='vertical-align:middle;margin-right:5px;' src='" + rails_root.value +  "/images/spinner.gif'>" +
      "<strong>Cargando ...</strong>" +
      "</p>";
    $('.flash').append(element);
  });

  $(document).ajaxStop(function(){
    $(".flash > .ajax").hide();
  });

  $('.accordion').accordion({
    header: "h3",
    collapsible: true,
    active: false,
    autoHeight: true
  });

  $("#filters .clean-filters").bind('click', function(event){
     event.preventDefault();
     $("fieldset.inputs :input").val("");
  });

  $("#filters fieldset.inputs :input").each(function(){
   if( $(this).val() != '' ){
     $(".accordion").accordion("option", "active", 1);
   }
  });

  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    // re-initialize accordion on tab change
    $('.accordion').accordion({
      header: "h3",
      collapsible: true,
      active: false,
      autoHeight: true
    });
    window.location.href = e.target.dataset.targetUrl;
  });
});

function DynamicSearch(select_name, search_path, id_val, name_val){
  if (id_val == null) id_val = "";
  var x = $(select_name).tokenInput(search_path,
  {
    hintText: "Ingrese una búsqueda ...",
    noResultsText: "No hay datos",
    searchingText: "Buscando...",
    tokenLimit: 1,
    minChars: 1,
    searchDelay: 10,
    theme: "facebook",
    onDelete: function(item){
      try{
        onDelDynamicSearch(select_name, item);
      }
      catch(e){}
    },
    onAdd: function (item){
      try{
        onAddDynamicSearch(select_name, item);
      }
      catch(e){}
    },
    onResult: function (results) {
      var newResults = null;
      try
      {
        newResults = onResultDynamicSearch(results, this[0].id);
      }
      catch(err)
      {
        newResults = results;
      }
      return (newResults);
    }
  });
  if (id_val != ""){
    try{
      $(select_name).tokenInput("add", {id: id_val, name: name_val.replace(/\"/g, '*')});
    }
    catch(e){}
  }
}

// Scroll effect for anchors
jQuery(function( $ )
{
  $('a').click(function() {
     if ($(this).attr('class') == 'anchor') {
       $.scrollTo(this.hash, 500);
       $(this.hash).find('span.message').text(this.href);
       return false;
     }
  });
});
