Page({
  onReady: function (options) {
    const canvasCtx = tt.createCanvasContext("myCanvas");
    canvasCtx.setFontSize(20);
    canvasCtx.fillText("ByteDance canvas", 0, 30);
    canvasCtx.draw();
  },
});