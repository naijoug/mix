const pageData = {
  onShareAppMessage() {
    return {
      title: 'slider',
      path: 'page/component/pages/slider/slider'
    };
  },
  bindchanging(e) {
    console.log('拖动过程中触发的事件', e);
  },
  // 兼容右滑触发返回上一页
  disableSwipeBack() {
    tt.setSwipeBackMode(0);
  },
  enableSwipeBack() {
    tt.setSwipeBackMode(1);
  }
};
for (let i = 1; i < 5; ++i) {
  (function (index) {
    pageData['slider' + index + 'change'] = function (e) {
      console.log('slider' + index + '发生change事件，携带值为', e.detail.value);
    };
  })(i);
}
Page(pageData);