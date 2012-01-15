require 'Fotocrib'

client = Fotocrib.new('http://fotocrib.com/images/vanquish.jpg', 'rframe.jpg')
client.roundFrame(12, 44, 122, 33, 45)

client.src = 'http://fotocrib.com/images/smilely.jpg'
client.filename = 'cube.jpg'
client.cube(255, 255, 255)

client.src = 'http://fotocrib.com/images/kobe.jpg'
client.filename = 'label.jpg'
client.label('NBA.COM', 'SouthEast')

client.src = 'http://fotocrib.com/images/gogh.jpg'
client.filename = 'round.jpg'
client.roundCorners(66)

client.src = 'http://fotocrib.com/images/monalisa.jpg'
client.filename = 'repaint.jpg'
client.repaint(144, 0, 0)
