function success(title='success') {
  tt.showToast({
    title,
  });
}

function fail() {
  tt.showToast({
    title: 'fail'
  });
}

Page({
  short() {
    tt.vibrateShort({
      success(res) {
        console.log('触发短振动', res);
        success('触发短振动')
      },
      fail(err) {
        console.log('短振动错误', err);
        fail()
      },
      complete(res) {
        console.log('短振动触发complete', res);
      }
    });
  },
  long() {
    tt.vibrateLong({
      success(res) {
        console.log('触发长振动', res);
        success('触发长振动')
      },
      fail(err) {
        console.log('长振动错误', err);
        fail()
      },
      complete(res) {
        console.log('长振动触发complete', res);
      }
    });
  }

});