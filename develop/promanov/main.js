
var Kefir = require('kefir');
var React = require('react');

var gameField = document.getElementById('main-game-field');
var forceResize = Kefir.emitter();
var resizeStream = Kefir.merge([Kefir.fromEvent(window, 'resize'), forceResize]);
resizeStream.onValue(function(){
	gameField.style.height = (gameField.offsetWidth/1.5 | 0) + 'px';
});
forceResize.emit();

Kefir.fromEvent($('#main-top-menu-open-button'), 'click').onValue(function(el){
	$('.main-top-menu').toggleClass('opened');
});
Kefir.fromEvent($('#main-chat-menu-open-button'), 'click').onValue(function(el){
	$('.main-chat').toggleClass('opened');
});

var chat = [];
for(var i = 10; i < 50; i++)
{
	chat.push({
		time: '18:40:' + i,
		msg: (Math.random() * 1000000000000).toString(2),
		user: (Math.random() * 5 + 1) | 0
	});
}

$('#main-chat-output-area').val(chat.map(function(chatMsg){
	return [
		'[',
		chatMsg.time,
		']',
		'Bot#' + chatMsg.user,
		':',
		chatMsg.msg
	].join(' ');
}).join('\n'));

//var GameScoreTimer = require('./web/view/game-score-timer.jsx');
//React.render(
//	<GameScoreTimer />,
//	document.getElementById('game-timer')
//);