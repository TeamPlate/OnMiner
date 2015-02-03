
var Kefir = require('kefir');
var React = require('react');

var gameField = document.getElementById('main-game-field');
var forceResize = Kefir.emitter();
var resizeStream = Kefir.merge([Kefir.fromEvent(window, 'resize'), forceResize]);
resizeStream.onValue(function(){
	gameField.style.height = (gameField.offsetWidth/1.5 | 0) + 'px';
});
forceResize.emit();

//var GameScoreTimer = require('./web/view/game-score-timer.jsx');
//React.render(
//	<GameScoreTimer />,
//	document.getElementById('game-timer')
//);