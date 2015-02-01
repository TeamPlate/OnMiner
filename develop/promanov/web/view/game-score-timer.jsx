
var React = require('react');
var Kefir = require('kefir');

var timerStream = Kefir.fromBinder(function(emitter) {
	var gameStartTime = Date.now();
	var intervalId = setInterval(function() {
		emitter.emit((Date.now() - gameStartTime)/1000 | 0);
	}, 1000);
	return function() {
		clearInterval(intervalId);
	}
});

var GameScoreTimer = React.createClass({
	getInitialState: function() {
		var that = this;
		timerStream.onValue(function(time){
			that.setState({
				timeElapsed: time
			});
		});
		return {timeElapsed: ""};
	},
	render: function(){
		return (
			<div>Time: {this.state.timeElapsed}</div>
		);
	}
});
module.exports = GameScoreTimer;