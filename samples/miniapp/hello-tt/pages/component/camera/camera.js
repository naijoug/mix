let listener;
const fileSystemManager = tt.getFileSystemManager();
Page({
  data: {
    counter: 0,
    frameWidth: 0,
    frameHeight: 0,
    cameraType: 'back',
    photoPath: '',
    videoPath: '',
    photoOrVideo: '',
    videoStarted: false,
    isOnFrame: false,
  },
  onLoad: function (options) {
    this.openCamera()
    this.ctx = tt.createCameraContext()
  },
  toggleCamera() {
    const { cameraType } = this.data;
    if (cameraType === 'back') {
      this.setData({
        cameraType: 'front',
      });
    } else {
      this.setData({
        cameraType: 'back',
      });
    }
  },
  setZoom() {
    this.ctx.setZoom({
      zoom: 8,
      success(res) {
        tt.showToast({
          title: '设置 zoom 为' + res.zoom,
        });
      },
      fail(err) {
        tt.showModal({
          content: '设置缩放失败:' + JSON.stringify(err)
        });
      }
    })
  },
  openCamera() {
    tt.getSetting({
      success: (res) => {
        let cameraAllowed = res.authSetting['scope.camera']
        if (cameraAllowed) {
          this.ctx = tt.createCameraContext();
        } else {
          tt.showToast({
            title: '请授权相机后重新进入',
            success: (res) => {
              this.auth()
            }
          });
        }
      }
    });
  },
  auth() {
    tt.authorize({
      scope: 'scope.camera',
      success() {
        tt.showToast({
          title: '授权成功',
          success() {
            tt.reLaunch({
              url: '/pages/camera-show/index',
            });
          }
        })
      },
      fail(err) {
        tt.showModal({
          content: '授权失败：' + JSON.stringify(err)
        })
      }
    })
  },
  toggleFrame(e) {
    const { isOnFrame } = this.data;
    if (isOnFrame) {
      this.stopOnFrame(e);
    } else {
      this.startOnFrame(e);
    }
    this.setData({
      isOnFrame: !isOnFrame,
    });
  },
  startOnFrame(e) {
    listener = this.ctx.onCameraFrame((frame) => {
      let { width, height, data } = frame
      let counter = this.data.counter
      this.setData({
        counter: counter + 1,
        frameWidth: width,
        frameHeight: height
      })
    })

    listener.start({
      success(res) {
        tt.showToast({
          title: '开始接收帧数据',
        })
      },
      fail(err) {
        tt.showModal({
          content: '开始接收失败: ' + JSON.stringify(err),
        })
      }
    })
  },
  stopOnFrame() {
    listener.stop({
      success(res) {
        tt.showToast({
          title: '停止接收帧数据',
        })
      },
      fail(err) {
        tt.showModal({
          content: '停止接收出错: ' + JSON.stringify(err),
        })
      }
    })
  },
  onStop(e) {
    console.log('相机中断')
  },
  onError(e) {
    let { errMsg } = e.detail
    tt.showModal({
      content: '相机出错了：' + errMsg
    })
  },
  async takePhoto() {
    if (this.data.videoStarted) {
      await new Promise((resolve) => {
        this.ctx.stopRecord({
          success() {
            resolve();
          }
        });
      })
    }
    this.ctx.takePhoto({
      success: (res) => {
        this.setData({
          photoPath: res.tempImagePath,
          photoOrVideo: 'photo',
          videoStarted: false,
        });
      },
      fail(err) {
        console.log(err);
        tt.showToast({
          icon: 'fail',
          title: err.errMsg,
        });
      }
    });
  },
  toggleVideo() {
    const { videoStarted } = this.data;
    if (videoStarted) {
      this.ctx.stopRecord({
        success: res => {
          this.setData({
            videoPath: res.tempVideoPath,
            photoOrVideo: 'video',
            videoStarted: false,
          });
        },
        fail(err) {
          tt.showToast({
            icon: 'fail',
            title: err.errMsg,
          });
        }
      });
    } else {
      this.ctx.startRecord({
        success: () => {
          this.setData({
            videoStarted: true,
          })
        }
      });
    }

  }
})