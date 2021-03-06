#library('sunflower');

#import('dart:dom');

#resource('sunflower.css');

main() {
  new Sunflower();
}

class Sunflower {
  
  Sunflower() {
    PHI = (Math.sqrt(5) + 1) / 2;
    var doc = window.document;
    
    HTMLCanvasElement canvas = doc.getElementById("canvas");
    xc = yc = MAX_D / 2;
    ctx = canvas.getContext("2d");
    
    HTMLInputElement slider = doc.getElementById("slider");
    slider.onchange = (Event e) {
      seeds = Math.parseInt(slider.value);
      drawFrame();
    };
    
    drawFrame();
  }
  
  // Draw the complete figure for the current number of seeds.
  void drawFrame() {
    ctx.clearRect(0, 0, MAX_D, MAX_D);
    for (var i=0; i<seeds; i++) {
      var theta = i * TAU / PHI;
      var r = Math.sqrt(i) * SCALE_FACTOR;
      var x = xc + r * Math.cos(theta);
      var y = yc - r * Math.sin(theta);
      drawSeed(x,y);
    }
  }
  
  // Draw a small circle representing a seed centered at (x,y).
  void drawSeed(num x, num y) {
    ctx.beginPath();
    ctx.setLineWidth(2);
    ctx.setFillColor(ORANGE);
    ctx.setStrokeColor(ORANGE);
    ctx.arc(x, y, SEED_RADIUS, 0, TAU, false);
    ctx.fill();
    ctx.closePath();
    ctx.stroke();
  }

  CanvasRenderingContext2D ctx;
  num xc, yc;
  num seeds = 0;

  static final SEED_RADIUS = 2;
  static final SCALE_FACTOR = 4;
  static final TAU = Math.PI * 2;
  var PHI;
  static final MAX_D = 300;
  static final String ORANGE = "orange";

}
