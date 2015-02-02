// Activate debug to see some useful logs.
xRTML.Config.debug = true;

var connectionConfig = {
	id:'OnMinerTest',
	appKey:'ZHBxIB',
	authToken:'OnMinerTKN',
	url:'http://ortc-developers.realtime.co/server/2.1',
	channels:[{name:'OnMinerChatChannel'}]
}	
xRTML.ready(function(){
	xRTML.ConnectionManager.create(connectionConfig);
});									


xRTML.ready(function(){
	xRTML.TagManager.create({
		name: 'Shoutbox',
		id: "OnMinerTest",
		target:"#target-shoutbox",
		channelId: "OnMinerChatChannel",
		connections: ['OnMinerTest'],
		triggers: ['myTrigger']
	});
});
