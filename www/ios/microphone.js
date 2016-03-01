window.askMicrophonePermission = function(str, callback) {
	cordova.exec(callback, function(error) {
		console.log('error asking for microphone permission: ', error);
	}, 'RecordPermission', 'recordPermission');
}