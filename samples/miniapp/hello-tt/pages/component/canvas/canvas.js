const app = getApp()


Page({
  canvas: null,
  ctx: null,
  data: {
    width: 100,
    id: '123',
    textQuque: [],
  },

  onReady() {
    this.drawWeb(this.data.id);
    this.drawNative('#canvas_type_2d', '2d');
    this.drawNative('#canvas_type_webgl', 'webgl');
  },
  async getCanvas() {
    const query = tt.createSelectorQuery();
    query.select("#canvas").node();
    return new Promise(resolve => {
      query.exec(res => {
        this.canvas = res[0].node;
        this.ctx = this.canvas.getContext("2d");
        resolve(true);
      });
    });
  },
  drawNotation(x1, y1, type, over) {
    const { ctx } = this;
    const r1_1 = 60, r1_2 = 26, rect_h = 130;
    let color1 = "#79fffe";
    ctx.globalCompositeOperation = 'source-over';

    if (type === 2) {
      color1 = "#fa2055";
      if (over) {
        ctx.globalCompositeOperation = 'lighter';
      }
    }

    ctx.beginPath();
    ctx.strokeStyle = color1;
    ctx.lineWidth = r1_1 - r1_2;
    ctx.arc(x1, y1, r1_1 - (r1_1 - r1_2) / 2, 0, 1.5 * Math.PI);
    ctx.stroke();

    ctx.beginPath();
    ctx.fillStyle = color1;
    ctx.rect(x1 + r1_2, y1 - rect_h + 1, r1_1 - r1_2, rect_h + 1);
    ctx.fill();
  
    ctx.beginPath();
    ctx.lineWidth = r1_1 - r1_2;
    ctx.strokeStyle = color1;
    ctx.arc(x1 + r1_2 + r1_1, y1 - rect_h, r1_1 - (r1_1 - r1_2) / 2, 0.5 * Math.PI, 1 * Math.PI, false);
    ctx.stroke();
    ctx.restore();
    ctx.globalCompositeOperation = 'lighter';
    // ctx.beginPath();
    // ctx.clearRect(x1 + r1_2, y1 - rect_h, r1_1 - r1_2, rect_h);
    

  },

  drawByType(ctx, type, canvas) {
    if (type === '2d') {
      nativeCanvas2d = canvas;
      nativeCanvas2dCtx = ctx;
      this.drawNative2D(0, 0, 50, 50);
      this.drawNative2D(50, 50, 50, 50);
    } else {
      nativeCanvasGl = canvas;
      nativeCanvasGlCtx = ctx;
      this.drawNativeGL(1, 0, 1, 1);
    }
  },

  drawNative2D(x, y, width, height) {
    nativeCanvas2d.requestAnimationFrame(function () {
      nativeCanvas2dCtx.fillStyle = 'red';
      nativeCanvas2dCtx.fillRect(x, y, width, height);
    });
  },

  drawNativeGL(r, g, b, a) {
    nativeCanvasGl.requestAnimationFrame(function () {
      nativeCanvasGlCtx.clearColor(r, g, b, a);
      nativeCanvasGlCtx.clear(nativeCanvasGlCtx.COLOR_BUFFER_BIT);
    });
  },

  testBindtouchstart(e) {
    const touch = e.touches[0],
          { x: pageX, y: pageY } = touch,
          textMsg = `touchstart! pageX: ${ pageX },pageY: ${ pageY }`,
          { textQuque } = this.data;

    console.log('--- touchstart', e);

    this.setData({
      textQuque: [textMsg, ...textQuque],
    });
  },

  testBindtouchmove(e) {
    const touch = e.touches[0],
          { pageX, pageY } = touch,
          textMsg = `touchmove! pageX: ${ pageX },pageY: ${ pageY }`;

    console.log(`--- touchmove ${ textMsg }`, e);
  },

  testBindtouchend(e) {
    const touch = (e.changedTouches || e.touches)[0],
          { x: pageX, y: pageY } = touch,
          textMsg = `touchend! pageX: ${ pageX },pageY: ${ pageY }`,
          { textQuque } = this.data;

    console.log('--- touchend', e);

    this.setData({
      textQuque: [textMsg, ...textQuque],
    });
  },

  testBindtouchcancel(e) {
    const textMsg = `--- touchcancel!`;
    console.log(textMsg, e);

    this.setData({
      textQuque: [textMsg, ...this.data.textQuque]
    });
  },

  testBinderror(err) {
    console.log('canvas err', err);
  },

  onClearTextQuque() {
    this.setData({
      textQuque: [],
    });
  }
});
