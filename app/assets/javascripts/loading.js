$(document).ready(function(){
  $('#pandora-button').on('click', function (){
    myApp.showPleaseWait();
    debugger;
  });

  var myApp;
  myApp = myApp || (function () {
    var pleaseWaitDiv = $('<div class="modal fade" id="pleaseWaitDialog" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-body"><h1>Finding Pandora songs...</h1></div></div></div></div>');
    return {
      showPleaseWait: function() {
        pleaseWaitDiv.modal('show');
      },

      hidePleaseWait: function () {
        pleaseWaitDiv.modal('hide');
      }
    };
  })();
});
