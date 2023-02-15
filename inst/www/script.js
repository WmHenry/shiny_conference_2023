function enableButton(button) {
  button.find('i').removeClass('fa-spin');
  button.removeClass('loading').prop('disabled', false);
  button.find('span').text('Add Slide');
}

function makeButtonReady(message) {
  var button = $('#' + message.id);
  button.find('span').html('&nbsp;&nbsp; Done &nbsp;&nbsp;');
  setTimeout(function() {enableButton(button)}, 500);
}

Shiny.addCustomMessageHandler("ready-button", makeButtonReady);

function stateButton(message) {
  var button = $('#' + message.id);
  button.prop('disabled', message.disable);
}

Shiny.addCustomMessageHandler("state-button", stateButton);

function enableLink(message) {
  var button = $('#' + message.id);
  button.removeClass('disabled');
}

Shiny.addCustomMessageHandler("enable-link", enableLink);

$(document).ready(function() {
  $('#controlbar-toggle').addClass('disabled-link');
})

function openControlbar() {
  if (!$('body').hasClass('control-sidebar-slide-open')) {
    $('#controlbar-toggle').removeClass('disabled-link');
    $('#controlbar').ControlSidebar('toggle');
    $(window).resize();
  }
}
