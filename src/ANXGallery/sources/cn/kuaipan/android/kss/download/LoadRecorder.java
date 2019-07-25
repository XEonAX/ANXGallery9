package cn.kuaipan.android.kss.download;

import java.io.IOException;

public class LoadRecorder {
    private LoadMap map;
    private final Space space;

    LoadRecorder(LoadMap loadMap, Space space2) {
        this.map = loadMap;
        this.space = space2;
    }

    public void add(int i) throws IOException {
        if (this.map != null) {
            this.space.remove(i);
            this.map.onSpaceRemoved(i);
            return;
        }
        throw new IOException("The recoder has been recycled");
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        recycle();
        super.finalize();
    }

    /* access modifiers changed from: 0000 */
    public Space getSpace() {
        return this.space;
    }

    /* access modifiers changed from: 0000 */
    public long getStart() {
        return this.space.getStart();
    }

    public void recycle() {
        if (this.map != null) {
            this.map.recycleRecorder(this);
            this.map = null;
        }
    }

    public long size() {
        return this.space.size();
    }
}
