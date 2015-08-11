$(document).ready(function(){
  $('#pandora-button').on('click', function (){
    myApp.showPleaseWait();
  });

  var myApp;
  myApp = myApp || (function () {
    var pleaseWaitDiv = $('<div class="modal fade" id="pleaseWaitDialog" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header">Fetching Pandora songs... This may take a while</div><div class="modal-body"><i class="fa fa-spinner fa-pulse"></i></div></div></div></div>');
    return {
      showPleaseWait: function() {
        pleaseWaitDiv.modal('show');
      }
    };
  })();
});
