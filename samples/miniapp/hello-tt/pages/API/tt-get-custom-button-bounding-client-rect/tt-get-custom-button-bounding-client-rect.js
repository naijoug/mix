// /Users/bytedance/miniapp-code/ddemo/pages/API/tt-get-custom-button-bounding-client-rect/tt-get-custom-button-bounding-client-rect.js
Page({
  data: {
    rectData: null,
    paddingTop: 53,
    height: 30,
  },
  onLoad: function (options) {
    const res = tt.getCustomButtonBoundingClientRect();
    console.log(res);
    this.setData({
      rectData: res,
      paddingTop: res.capsule.top,
      height: res.capsule.height,
    });
  },
  back() {
    tt.navigateBack({
      success: (res) => {
        
      },
      fail: (res) => {
        
      },
    });
  }
})