Page({
    data: {
        p1: 0,
        p2: 0,
        p3: 0,
        p4: 0,
    },
    onShow() {
        this.setData({
            p1: 20,
            p2: 40,
            p3: 60,
            p4: 80,
        });
    },
    onHide() {
        this.setData({
            p1: 0,
            p2: 0,
            p3: 0,
            p4: 0,
        });
    }
});