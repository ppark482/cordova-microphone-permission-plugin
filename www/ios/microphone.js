var
  exec = require('cordova/exec');

module.exports = function (next) {
  exec(function (response) {
    next(response === 'on');
  }, null, 'Microphone', 'microphone');
};
