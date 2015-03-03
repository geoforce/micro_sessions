angular.module('ng-micro-session', []).config(['$httpProvider', function($httpProvider) {
  var getToken = function() {
    var el = document.querySelector('meta[name="msid-token"]');

    if (el) {
      return el.getAttribute('content');
    }
  };

  var updateToken = function() {
    var headers = $httpProvider.defaults.headers.common, token = getToken();

    if (token) {
      headers['X-MSID-TOKEN'] = getToken;
      headers['X-Requested-With'] = 'XMLHttpRequest';
    }
  };

  updateToken();

  if (window['Turbolinks']) {
    document.addEventListener('page:change', updateToken);
  }
}]);