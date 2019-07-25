package android.support.v7.widget;

import android.view.View;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;

class ViewBoundsCheck {
    BoundFlags mBoundFlags = new BoundFlags();
    final Callback mCallback;

    static class BoundFlags {
        int mBoundFlags = 0;
        int mChildEnd;
        int mChildStart;
        int mRvEnd;
        int mRvStart;

        BoundFlags() {
        }

        /* access modifiers changed from: 0000 */
        public void addFlags(int i) {
            this.mBoundFlags = i | this.mBoundFlags;
        }

        /* access modifiers changed from: 0000 */
        public boolean boundsMatch() {
            if ((this.mBoundFlags & 7) != 0 && (this.mBoundFlags & (compare(this.mChildStart, this.mRvStart) << 0)) == 0) {
                return false;
            }
            if ((this.mBoundFlags & BaiduSceneResult.STREET_VIEW) != 0 && (this.mBoundFlags & (compare(this.mChildStart, this.mRvEnd) << 4)) == 0) {
                return false;
            }
            if ((this.mBoundFlags & 1792) == 0 || (this.mBoundFlags & (compare(this.mChildEnd, this.mRvStart) << 8)) != 0) {
                return (this.mBoundFlags & 28672) == 0 || (this.mBoundFlags & (compare(this.mChildEnd, this.mRvEnd) << 12)) != 0;
            }
            return false;
        }

        /* access modifiers changed from: 0000 */
        public int compare(int i, int i2) {
            if (i > i2) {
                return 1;
            }
            return i == i2 ? 2 : 4;
        }

        /* access modifiers changed from: 0000 */
        public void resetFlags() {
            this.mBoundFlags = 0;
        }

        /* access modifiers changed from: 0000 */
        public void setBounds(int i, int i2, int i3, int i4) {
            this.mRvStart = i;
            this.mRvEnd = i2;
            this.mChildStart = i3;
            this.mChildEnd = i4;
        }
    }

    interface Callback {
        View getChildAt(int i);

        int getChildEnd(View view);

        int getChildStart(View view);

        int getParentEnd();

        int getParentStart();
    }

    ViewBoundsCheck(Callback callback) {
        this.mCallback = callback;
    }

    /* access modifiers changed from: 0000 */
    public View findOneViewWithinBoundFlags(int i, int i2, int i3, int i4) {
        int parentStart = this.mCallback.getParentStart();
        int parentEnd = this.mCallback.getParentEnd();
        int i5 = i2 > i ? 1 : -1;
        View view = null;
        while (i != i2) {
            View childAt = this.mCallback.getChildAt(i);
            this.mBoundFlags.setBounds(parentStart, parentEnd, this.mCallback.getChildStart(childAt), this.mCallback.getChildEnd(childAt));
            if (i3 != 0) {
                this.mBoundFlags.resetFlags();
                this.mBoundFlags.addFlags(i3);
                if (this.mBoundFlags.boundsMatch()) {
                    return childAt;
                }
            }
            if (i4 != 0) {
                this.mBoundFlags.resetFlags();
                this.mBoundFlags.addFlags(i4);
                if (this.mBoundFlags.boundsMatch()) {
                    view = childAt;
                }
            }
            i += i5;
        }
        return view;
    }

    /* access modifiers changed from: 0000 */
    public boolean isViewWithinBoundFlags(View view, int i) {
        this.mBoundFlags.setBounds(this.mCallback.getParentStart(), this.mCallback.getParentEnd(), this.mCallback.getChildStart(view), this.mCallback.getChildEnd(view));
        if (i == 0) {
            return false;
        }
        this.mBoundFlags.resetFlags();
        this.mBoundFlags.addFlags(i);
        return this.mBoundFlags.boundsMatch();
    }
}
