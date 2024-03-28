Page({
  data: {
    latitude: 39.907957,
    longitude: 116.397493,
    scale: 15,
    rotate: 0,
    skew: 5,
    showLocation: true,
    polygons: [
      {
        points: [
          {
            latitude: 39.915,
            longitude: 116.404,
          },
          {
            longitude: 116.405,
            latitude: 39.92,
          },
          {
            longitude: 116.423493,
            latitude: 39.907445,
          },
        ],
        strokeWidth: 3,
        strokeColor: '#224499',
        fillColor: '#22334455',
        zIndex: 0,
      },
    ],
    circles: [
      {
        latitude: 39.907957,
        longitude: 116.397493,
        radius: 400,
      },
    ],
    markers: [
      {
        id: 1,
        longitude: 116.397493,
        latitude: 39.907957,
        title: '这是地标1',
        alpha: 0.6,
        anchorX: 0.5,
        anchorY: 1,
      },
      {
        id: 2,
        longitude: 116.39394,
        latitude: 39.90503,
        callout: {
          content: '这是地标 2',
          color: '#222222',
          fontSize: 12,
          borderRadius: 12,
          padding: 4,
          display: 'ALWAYS',
          textAlign: 'center',
          borderWidth: 1,
          borderColor: '#222222',
          bgColor: '#ffffff',
          anchorX: 0,
          anchorY: 0,
        },
      },
      {
        id: 3,
        longitude: 116.40159,
        latitude: 39.90511,
        title: '这是地标3',
      }
    ],
    polyline: [
      {
        points: [
          {
            longitude: 116.397493,
            latitude: 39.907957,
          },
          {
            longitude: 116.39394,
            latitude: 39.90503,
          },
          {
            longitude: 116.40159,
            latitude: 39.90511,
          },
        ],
        color: '#222222',
        width: 4,
        dottedLine: false,
        colorList: ['#000022', '#220000'],
        borderColor: '#222222',
        borderWidth: 0,
      },
    ],
    includePoints: [],
    showCompass: true,
    enableOverlooking: true,
    enableRotate: true,
    enable3D: true,
    showScale: true,
    enableZoom: true,
    enableScroll: true,
    enableSatellite: false,
    enableTraffic: false,
    enablePoi: true,
    enableBuilding: true,
    minScale: 3,
    maxScale: 19
  },
  onReady() {
    this.mapCtx = tt.createMapContext('myMap');
    console.log(this.mapCtx);
  },
  markerTap(e) {
    console.log('tap marker', e);
    this.msg('tap-marker');
  },
  mapTap(e) {
    console.log('tap map', e);
    this.msg('tap map');
  },
  calloutTap(e) {
    console.log('tap callout', e);
    this.msg('tap callout');
  },
  regionChange(e) {
    console.log('region', e);
    const { centerLocation } = e.detail,
           latitude = Number(centerLocation.latitude).toFixed(3),
           longitude = Number(centerLocation.longitude).toFixed(3);

    this.msg(`region: latitude: ${ latitude }, longitude: ${ longitude }`);
  },
  getCenterLocation() {
    this.mapCtx.getCenterLocation({
      success(res) {
        console.log('getCenterLocation 成功: ', res);
        tt.showModal({
          content: `经度: ${res.longitude}, 纬度: ${res.latitude}`,
          showCancel: false
        });
      },
      fail(err) {
        console.log('getCenterLocation 失败: ', err);
      },
      complete(res) {
        console.log('getCenterLocation complete', res);
      }
    });
  },
  getCurrentLocation() {
    tt.getLocation({
      type: 'gcj02',
      success(res) {
        tt.showModal({
          content: `经度: ${res.longitude}, 纬度: ${res.latitude}`,
          showCancel: false
        });
      },
      fail(err) {
        tt.showToast({
          title: err.errMsg,
          icon: 'fail',
        });
      },
    });
  },
  moveToLocation() {
    this.mapCtx.moveToLocation({
      success: (res) => {
        console.log('move 成功: ', res);
        this.mapCtx.getCenterLocation({
          success: (res) => {
            console.log('getCenterLocation 成功: ', res);
            this.setData({
              longitude: res.longitude,
              latitude: res.latitude
            });
          },
          fail(err) {
            console.log('getCenterLocation 失败: ', err);
          },
          complete(res) {
            console.log('getCenterLocation complete', res);
          }
        });
      },
      fail(err) {
        console.log('move 失败: ', err);
      },
      complete(res) {
        console.log('move complete', res);
      }
    });
  },
  // Auth
  authLocation() {
    let that = this;
    tt.authorize({
      scope: 'scope.userLocation',
      success(res) {
        console.log(res, res.data);
        if (res.data['scope.userLocation'] === 'ok') that.msg('您已允许授权');
      },
      fail(err) {
        console.log(err);
        that.msg('您已拒绝授权');
      },
    });
  },
  getScale() {
    const that = this;
    this.mapCtx.getScale({
      success(res) {
        console.log('getScale 成功', res);
        tt.showModal({
          content: `当前缩放级别：${res.scale}`,
          showCancel: false
        })
      },
      fail(err) {
        console.log('getScale 失败', err);
      },
      complete(res) {
        console.log('getScale complete', res);
      }
    })
  },
  getRegion() {
    let that = this;
    this.mapCtx.getRegion({
      success(res) {
        console.log('getRegion 成功', res);
        tt.showModal({
          content: `西南角-经度：${res.southwest.longitude} 西南角-纬度：${res.southwest.latitude} 东北角-经度：${res.northeast.longitude} 东北角-纬度：${res.northeast.latitude}`,
          showCancel: false
        });
      },
      fail(err) {
        console.log('getRegion 失败', err);
      },
      complete(res) {
        console.log('getRegion complete', res);
      }
    })
  },
  msg(title, duration = 1500) {
    tt.showToast({
      title,
      duration,
      icon: 'none'
    });
  },
  // 切换是否显示当前坐标
  onSwitchShowLocation() {
    this.setData({
      showLocation: !this.data.showLocation
    });
  },
  // 改变地图的旋转角度
  onChangeRotate(e) {
    const { value: rotate } = e.detail;
    this.setData({
      rotate,
    });
  },
  // 切换是否显示指南针
  onSwitchShowCompass() {
    this.setData({
      showCompass: !this.data.showCompass,
    });
  },
  onSwitchEnableOverlooking() {
    this.setData({
      enableOverlooking: !this.data.enableOverlooking
    });
  },
  onSwitchEnableRotate() {
    this.setData({
      enableRotate: !this.data.enableRotate
    });
  },
  onSwitchEnable3D() {
    this.setData({
      enable3D: !this.data.enable3D
    });
  },
  onSwitchShowScale() {
    this.setData({
      showScale: !this.data.showScale
    });
  },
  onSwitchEnableZoom() {
    this.setData({
      enableZoom: !this.data.enableZoom
    });
  },
  onSwitchEnableScroll() {
    this.setData({
      enableScroll: !this.data.enableScroll
    });
  },
  onSwitchEnableSatellite() {
    this.setData({
      enableSatellite: !this.data.enableSatellite
    });
  },
  onSwitchEnableTraffic() {
    this.setData({
      enableTraffic: !this.data.enableTraffic
    });
  },
  onSwitchEnablePoi() {
    this.setData({
      enablePoi: !this.data.enablePoi
    });
  },
  onSwitchEnableBuilding() {
    this.setData({
      enableBuilding: !this.data.enableBuilding
    });
  },
  labelTap(e) {
    console.log(e, 'labelTap');
    this.msg('labelTap');
  },
  updated(e) {
    console.log(e, 'updated');
    this.msg('updated');
  },
  anchorpointTap(e) {
    console.log(e, 'anchorpointTap');
    this.msg('anchorpointTap');
  },
  onChangeScale(e) {
    const { name } = e.target.dataset,
          inputNum = Number(e.detail.value);
    
    switch (name) {
      case 'minScale':
        if (inputNum < this.data.maxScale) {
          this.setData({
            [name]: inputNum,
          });
        }
        break;
      case 'maxScale':
        if (inputNum > this.data.minScale) {
          this.setData({
            [name]: inputNum,
          });
        }
        break;
      default:
        break;
    }
  }
});