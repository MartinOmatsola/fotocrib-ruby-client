require 'net/http'


# @author  Martin Okorodudu <webmaster@fotocrib.com>
# @license http://opensource.org/licenses/lgpl-license.php
#          GNU Lesser General Public License, Version 2.1
# This class is a wrapper for the fototools service.


class Fotocrib
  
  def initialize(src, filename)
    @src = src
    @filename = filename
  end
  
  
  def thumbnail
    handleRequest({'q' => 'thumbnail'})
  end
  
  
  def label(text, location)
    handleRequest({'q' => 'label', 't' => text, 'l' => location})
  end
  
  
  def roundCorners(radius)
    handleRequest({'q' => 'round', 'r' => radius})
  end
  
  
  def cube(r, g, b)
    handleRequest({'q' => 'cube', 'r' => r, 'g' => g, 'b' => b})
  end
  
  
  def raise(height)
    handleRequest({'q' => 'raise', 'h' => height})
  end
  
  
  def scale(pct)
    handleRequest({'q' => 'scale', 'p' => pct})
  end
  
  
  def resize(width, height)
    handleRequest({'q' => 'resize', 'w' => width, 'h' => height})
  end
  
  
  def focus()
    handleRequest({'q' => 'focus'})
  end
  
  
  def emboss()
    handleRequest({'q' => 'emboss'})
  end
  
  
  def paint()
    handleRequest({'q' => 'paint'})
  end
  
  
  def repaint(r, g, b)
    handleRequest({'q' => 'repaint', 'r' => r, 'g' => g, 'b' => b})
  end
  
  
  def frame(border, r, g, b)
    handleRequest({'q' => 'frame', 't' => border, 'r' => r, 'g' => g, 'b' => b})
  end
  
  
  def roundFrame(border, radius, r, g, b)
    handleRequest({'q' => 'rframe', 't' => border, 'v' => radius, 'r' => r, 'g' => g, 'b' => b})
  end
  
  
  def mirror()
    handleRequest({'q' => 'mirror'})
  end
  
  
  def sobel()
    handleRequest({'q' => 'sobel'})
  end
  
  
  def blur()
    handleRequest({'q' => 'blur'})
  end
  
  
  def brighten()
    handleRequest({'q' => 'brighten'})
  end
  
  
  def grayscale()
    handleRequest({'q' => 'grayscale'})
  end
  
  
  
  
  def src=(value)
    @src = value
  end
  
  
  def filename=(value)
    @filename = value
  end
  
  
  def src
    @src
  end
  
  
  def filename
    @filename
  end
  
  
  def handleRequest(params)
    
    url = "/fototools.php?s=#{@src}&"
    params.each do |k, v|
      url += "#{k}=#{v}&"
    end
    
    fd = File::open(@filename, 'w')
    
    Net::HTTP.start('www.fotocrib.com', 80) do |http|
      fd << http.get(url).body
    end
    
    fd.close
    
  end
  
end