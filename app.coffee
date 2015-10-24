
# Components
bg = new BackgroundLayer
	backgroundColor: "#CCC8C8"
	
frameLayer = new Layer
	width: 690
	height: 590
	backgroundColor: "transparant"

iconBaseLayer = new Layer
	superLayer: frameLayer
	borderRadius: 8
	y: 170
	x: 150
	width: 370
	height: 230
	shadowY: 40
	shadowBlur: 100
	shadowColor: "rgba(0,0,0,0.6)"
	shadowSpread: - 28

bgLayer = new Layer
	backgroundColor: "#565457"
	image: bgLayerImage
	width: 414
	height: 257
	superLayer: iconBaseLayer
	y: -19
	x: -19
	
topLayer = new Layer
	image: topLayerImage
	width: 414
	height: 257
	superLayer: iconBaseLayer
	y: -19
	x: -19

middleLayer = new Layer
	image: middleLayerImage
	width: 414
	height: 257
	superLayer: iconBaseLayer
	y: -17
	x: -17

label = new Layer
	width: 180
	height: 40
	backgroundColor: "transparant"
	
glow= new Layer
	width: 800
	height: 800
	opacity: 0.4
	borderRadius: 99
	superLayer: iconBaseLayer
		
iconBaseLayer.style =
	"background": "linear-gradient( #E2E0E0 0%, #979A9E 100%)"
	
label.style =
	"font": "500 30px SF Compact Text, Helvetica Neue"
	"letter-spacing": "-1px"
	"text-align": "center"
	"text-shadow": "0 2px 6px rgba(0,0,0,0.4)"
	
glow.style =
	"background": "radial-gradient( rgba(255,255,255,1) 0%, rgba(255,255,255,0) 60%)"
	
# Position frameLayer
frameLayer.center()
frameLayer.perspective = 100

# Position Label
label.html = iconLabel
label.center()
label.y += 150
label.x -= 5

# Place middle layer behind top layer
middleLayer.placeBehind(topLayer)

# Animate icon
bg.on Events.TouchMove, (event) ->
	
	delta =
		x: frameLayer.midX - Events.touchEvent(event).clientX
		y: frameLayer.midY - Events.touchEvent(event).clientY
	
	iconBaseLayer.rotationX = Utils.modulate delta.y, [0, frameLayer.midX], [0, 1]
	iconBaseLayer.rotationY = Utils.modulate delta.x, [0, frameLayer.midY], [0, -1]
	
	iconBaseLayer.y = Utils.modulate -delta.y, [0, frameLayer.midX], [170, 155]
	iconBaseLayer.x = Utils.modulate -delta.x, [0, frameLayer.midY], [150, 140]
	
	bgLayer.y = Utils.modulate delta.y, [0, frameLayer.midY], [-19, -14]
	bgLayer.x = Utils.modulate delta.x, [0, frameLayer.midX], [-19, -14]
	
	topLayer.y = Utils.modulate delta.y, [0, frameLayer.midY], [-20, -15]
	topLayer.x = Utils.modulate delta.x, [0, frameLayer.midX], [-20, -15]
	
	glow.x = Utils.modulate delta.x, [0, iconBaseLayer.midX], [-200, 200]
	glow.y = Utils.modulate delta.y, [0, iconBaseLayer.midY], [-200, 200]
	glow.opacity= Utils.modulate delta.x, [0, frameLayer.midX], [0.3, 1]


