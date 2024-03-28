const texts = ['抖音，一个旨在帮助大众用户表达自我', '记录美好生活的短视频分享平台', '抖音日活跃用户超过6亿', '连续数月多次登顶', '国内Appstore应用市场第1名', 'TikTok已经覆盖全球超过150个国家和地区', '荣登2018年1季度全球App下载量排名第1', '是丰富的多元化内容分享平台', '......'];
const canAddNumber = texts.length;
Page({
  data: {
    text: '',
    canAdd: true,
    canRemove: false
  },
  extraLine: [],
  add: function (e) {
    if (!this.data.canAdd) {
      return;
    }
    var that = this;
    this.extraLine.push(texts[this.extraLine.length % canAddNumber]);
    this.setData({
      text: this.extraLine.join('\n'),
      canAdd: this.extraLine.length < canAddNumber,
      canRemove: this.extraLine.length > 0
    });
    setTimeout(function () {
      that.setData({
        scrollTop: 99999
      });
    }, 0);
  },
  remove: function (e) {
    var that = this;

    if (this.extraLine.length > 0) {
      this.extraLine.pop();
      this.setData({
        text: this.extraLine.join('\n'),
        canAdd: this.extraLine.length < canAddNumber,
        canRemove: this.extraLine.length > 0
      });
    }
    setTimeout(function () {
      that.setData({
        scrollTop: 99999
      });
    }, 0);
  }
});